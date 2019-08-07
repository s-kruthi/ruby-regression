module Database_env
  class DAO
    def get_visible_course_list_by_name(partial_course_name)
      query = "SELECT DISTINCT c.id, c.fullname FROM mdl_course c
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE c.fullname LIKE '%#{partial_course_name}%'
              AND c.visible = 1
              AND cc.visible = 1
              ORDER BY c.id DESC;"
      return @db[query].first
    end

    def get_visible_course_list_by_name_with_enrolments(partial_course_name)
      query = "SELECT c.id, c.fullname FROM mdl_course c
              INNER JOIN epms_lms_course_enrolment e ON c.id = e.course_id
              INNER JOIN epms_user u ON u.id = e.user_id
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE c.fullname LIKE '%#{partial_course_name}%'
              AND c.visible = 1
              AND e.isActive = 1
              AND u.is_active = 1
              AND cc.visible = 1
              ORDER BY c.id DESC;"
      return @db[query].first
    end

    def get_visible_course_list_by_name_with_no_enrolments(partial_course_name)
      query = "SELECT c.id, c.fullname FROM mdl_course c
      INNER JOIN mdl_course_categories cc ON cc.id = c.category AND cc.visible = 1
      LEFT JOIN epms_lms_course_enrolment e ON c.id = e.course_id AND e.isActive = 1
      WHERE e.id IS NULL AND c.visible = 1 AND c.fullname LIKE '%#{partial_course_name}%' ORDER BY c.id DESC LIMIT 1;"
      return @db[query].first
    end

    def get_course_discrepancy_list()
      query = "SELECT c.fullname courseName
              FROM epms_lms_course_enrolment e
              INNER JOIN mdl_course c ON e.course_id = c.id
              INNER JOIN epms_user u ON e.user_id = u.id
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE u.is_elmo = 0 AND
              u.is_active = 1 AND
              e.isActive = 1 AND
              e.status = 2 AND
              e.retrain != 0 AND
              c.visible != 0 AND
              DATE_SUB(DATE_ADD(FROM_UNIXTIME(e.timeEnded), INTERVAL e.retrain MONTH), INTERVAL e.retrain_open DAY) <= CURDATE();"
      return @db[query].first
    end

    def get_f2f_location_facilitator_settings(f2f_id)
      query = "SELECT location, facilitator
              FROM epms_course_facetoface_session_template
              WHERE facetoface_id = #{f2f_id};"
      return @db[query].first
    end

    def get_course_activity(course_id)
      pending
    end

    def get_count_course_enrolments()
      query = "SELECT count(*) AS enrolmentcount
              FROM epms_lms_course_enrolment e
              INNER JOIN epms_user u ON u.id = e.user_id
              WHERE e.isActive = 1
              AND u.is_active = 1
              AND u.is_deleted = 0
              AND u.is_elmo = 0;"
      enrolments = @db[query].first
      return enrolments[:enrolmentcount]
    end

    #provides the course name to which user has enrolled and self unenrol is allowed(allowSelfUnenrol=1)
    def get_course_selfunenrol(self_unenrol, userid)
      query = "SELECT fullname, course_id FROM mdl_course mc
               INNER JOIN epms_lms_course_enrolment elce ON elce.course_id = mc.id
               INNER JOIN mdl_course_categories mcc ON mcc.id = mc.category
               WHERE mc.visible = 1
               AND mcc.visible = 1
               AND allowSelfUnenrol = #{self_unenrol}
               AND user_id = #{userid}
               AND isActive = 1
               AND enrolmethod = 1
               ORDER BY rand();"
      return @db[query].first
    end

    #check whether enrolment record has been deleted after self unenrol(count =0)
    def get_enrolment_status(course_id,user_id)
      query = "SELECT count(*) AS count
               FROM epms_lms_course_enrolment
               WHERE user_id = #{user_id}
               AND course_id = #{course_id}"
      return @db[query].first[:count]
    end

    def get_enrolment_method(course_id, user_id)
      query = "SELECT enrolMethod
               FROM epms_lms_course_enrolment
               WHERE user_id = #{user_id}
               AND isActive = 1
               AND course_id = #{course_id}"
      return @db[query].first[:fullname]
    end

    def get_enroled_courses(user_id)
      query = "SELECT count(*) AS count
               FROM epms_lms_course_enrolment
               WHERE user_id = #{user_id}
               AND isActive = 1"
      return @db[query].first[:count]
    end

    #TODO Query needs to be corrected
    # def get_count_course_enrolments_by_enrolmethod(enrolmethod)
    #   query = "select count(*) as enrolmentcount
    #           from `epms_lms_course_enrolment` e
    #           inner join epms_user u on u.id = e.user_id
    #           where e.isActive=1
    #           and u.is_active=1
    #           and u.is_deleted=0
    #           and u.is_elmo=0
    #           and e.enrolMethod = #{enrolmethod}"
    #   enrolments = @db[query].first
    #   return enrolments[:enrolmentcount]
    # end
    #
    # TODO Query needs to be corrected
    # def get_count_course_enrolments_by_status(status)
    #   query = "select count(*) as enrolmentcount
    #           from `epms_lms_course_enrolment` e
    #           inner join epms_user u on u.id = e.user_id
    #           where e.isActive=1
    #           and u.is_active=1
    #           and u.is_deleted=0
    #           and u.is_elmo=0
    #           and e.status = #{status}"
    #   enrolments = @db[query].first
    #   return enrolments[:enrolmentcount]
    # end

    def count_certificate_template
      query = "SELECT count(*) AS certtemplatecount FROM epms_course_certificate_template;"
      templates = @db[query].first
      return templates[:certtemplatecount]
    end

    def get_cert_temp_name_legacy()
      query = "SELECT value FROM epms_config WHERE module = 'lms' AND NAME LIKE '%template%name%'
      AND VALUE NOT IN ('')
      ORDER BY RAND() LIMIT 1;"
      return @db[query].first[:value]
    end

    
    def get_cert_temp_name()
      query = "SELECT id, user_id, title, description, is_active, layout, is_deleted FROM epms_course_certificate_template
      WHERE is_active = 1 AND is_deleted = 0 ORDER BY RAND() DESC LIMIT 1;"
      return @db[query].first[:title]
    end
    
    
    def get_cert_temp_fields_value_by_name(cert_temp_name)
      query = "SELECT * FROM epms_course_certificate_template WHERE title = '#{cert_temp_name}';"
      return cert_temp_fields_value = @db[query].first
    end

    def get_visible_cpd_plan_by_name(arg)
      query = "SELECT * FROM epms_cpd_plan WHERE NAME LIKE '%#{arg}%' AND visible = 1 ORDER BY ID DESC LIMIT 1;"
      return @db[query].first
    end

    def get_visible_cpd_category_by_name(arg)
      query = "SELECT * FROM epms_cpd_category WHERE NAME LIKE '%#{arg}%' AND visible = 1 ORDER BY ID DESC LIMIT 1;"
      return @db[query].first
    end

    def get_user_with_course_discrepancy()
      query = "SELECT distinct concat (u.`first_name`,' ',u.`last_name`) as name
              FROM epms_lms_course_enrolment e
              INNER JOIN mdl_course c ON e.course_id = c.id
              INNER JOIN epms_user u ON e.user_id = u.id
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE u.is_elmo = 0 AND
              u.is_active = 1 AND
              u.is_deleted = 0 AND
              e.isActive = 1 AND
              e.status = 2 AND
              e.retrain != 0 AND
              c.visible != 0 AND
              DATE_SUB(DATE_ADD(FROM_UNIXTIME(e.timeEnded), INTERVAL e.retrain MONTH), INTERVAL e.retrain_open DAY) <= CURDATE()
              order by rand();"
      return @db[query].first
    end

    #checks whether course has the module
    def get_course_surveymodule(course_id, activity_name)
      query = "select distinct cm.id from mdl_course_modules cm
               inner join epms_course_survey cs on cm.course = cs.course
               inner join mdl_modules mm on mm.id = module
               where mm.name = 'surveytwo'
               and cm.course = '#{course_id}'
               and cs.NAME LIKE '%#{activity_name}%';"
      return @db[query].first
    end

    def get_course_f2fmodule(course_id, activity_name)
      query = "select distinct cm.id from mdl_course_modules cm
               inner join epms_course_facetoface cf on cm.course = cf.course
               inner join mdl_modules mm on mm.id = module
               where mm.name = 'facetoface'
               and cm.course = '#{course_id}'
               and cf.NAME LIKE '%#{activity_name}%';"
      return @db[query].first
    end

    def get_course_elmomodule(course_id, activity_name)
      query = "select distinct cm.id from mdl_course_modules cm
               inner join mdl_url mu on cm.course = mu.course
               inner join mdl_modules mm on mm.id = module
               where mm.name = 'url'
               and cm.course = '#{course_id}'
               and mu.name LIKE '%#{activity_name}%';"
      return @db[query].first
    end

    def get_enrolment_details()
      query = "select mc.fullname as course_name, elce.course_id as course_id,  concat (first_name,' ',last_name) as name
               from epms_lms_course_enrolment elce
               inner join epms_user eu on eu.id = elce.user_id
               inner join mdl_course mc on mc.id = elce.course_id
               where elce.isActive = 1
               and eu.is_active = 1
               and eu.is_deleted = 0
               ORDER BY rand();"
      return @db[query].first
    end

    def get_coursedetails_noenrolments()
      query = "select mc.fullname as course_name, mc.id as course_id
               from mdl_course mc
               left join epms_lms_course_enrolment elce on mc.id = elce.course_id
               where mc.visible = 1
               and elce.course_id is null
               order by rand();"
      return @db[query].first
    end

    # provide the number of enrolments of a course
    def get_enrolmentcount(course_id)
      query = "select count(*) as count
               from epms_lms_course_enrolment
               where course_id=#{course_id};"
      return @db[query].first[:count]
    end

  end
end
