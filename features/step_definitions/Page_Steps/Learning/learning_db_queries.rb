module Database_env
  class DAO
    def get_visible_course_list_by_name(partial_course_name)
      query = "SELECT DISTINCT c.id, c.fullname FROM mdl_course c
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE c.fullname LIKE '%#{partial_course_name}%'
              AND c.visible = 1
              AND cc.visible = 1
              ORDER BY rand();"
      return @db[query].first[:fullname]
    end


    def get_visible_course_list_by_name_with_enrolments(partial_course_name)
      query = "SELECT DISTINCT c.id, c.fullname FROM mdl_course c
              INNER JOIN epms_lms_course_enrolment e ON c.id = e.course_id
              INNER JOIN epms_user u ON u.id = e.user_id
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE c.fullname LIKE '%#{partial_course_name}%'
              AND c.visible = 1
              AND e.isActive=1
              AND u.is_active = 1
              AND cc.visible = 1
              ORDER BY rand();"
      return @db[query].first[:fullname]
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
      return @db[query].first[:courseName]
    end


    def get_f2f_location_facilitator_settings(f2f_id)
      query = "select location, facilitator
              from epms_course_facetoface_session_template
              where facetoface_id = #{f2f_id};"
      return @db[query].first
    end


    def get_course_activity(course_id)
      pending
    end


    def get_count_course_enrolments()
      query = "select count(*) as enrolmentcount
              from `epms_lms_course_enrolment` e
              inner join epms_user u on u.id = e.user_id
              where e.isActive=1
              and u.is_active=1
              and u.is_deleted=0
              and u.is_elmo=0"
      enrolments = @db[query].first
      return enrolments[:enrolmentcount]
    end

    #provides the course name to which user has enrolled and self unenrol is allowed(allowSelfUnenrol=1)
    def get_course_selfunenrol(self_unerol, userid)
      query = "select fullname from `mdl_course` mc
               inner join  epms_lms_course_enrolment elce on elce.course_id = mc.id
               inner join mdl_course_categories mcc on mcc.id = mc.category
               where mc.visible = 1
               and mcc.visible = 1
               and allowSelfUnenrol = #{self_unerol}
               and user_id=#{userid}
               and isActive=1
               and enrolmethod = 1
              ORDER BY rand();"
      return @db[query].first[:fullname]
    end


    #check whether enrolment record has been deleted after self unenrol(count =0)
    def get_enrolment_status(course_id,user_id)
      query = "select count(*) as count
               from epms_lms_course_enrolment
               where user_id = #{user_id}
               and course_id = #{course_id}"
      return @db[query].first[:count]
    end


    def get_enrolment_method(course_id, user_id)
      query = "select enrolMethod
               from epms_lms_course_enrolment
               where user_id=#{user_id}
               and isActive=1
               and course_id = #{course_id}"
      return @db[query].first[:fullname]
    end


    def get_enroled_courses(user_id)
      query = "select count(*) as count
               from epms_lms_course_enrolment
               where user_id = #{user_id}
               and isActive = 1"
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


  end

end