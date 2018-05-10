module Database_env
  class DAO
    # def get_visible_course_list_by_name(partial_course_name)
    #   query = "SELECT c.fullname
    #           FROM mdl_course c
    #           INNER JOIN mdl_course_categories cc ON cc.id = c.category
    #           WHERE c.fullname LIKE '%#{partial_course_name}%'
    #           AND c.visible = 1
    #           AND cc.visible = 1;"
    #   return @db[query].first[:fullname]
    # end


    def get_visible_course_list_by_name(partial_course_name)
      query = "SELECT DISTINCT c.id, c.fullname FROM mdl_course c
              INNER JOIN epms_lms_course_enrolment e ON c.id = e.course_id
              INNER JOIN epms_course_facetoface f ON c.id = f.course
              INNER JOIN epms_user u ON u.id = e.user_id
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE c.fullname LIKE '%#{partial_course_name}%'
              AND f.is_deleted = 0
              AND c.visible = 1
              AND e.isActive=1
              AND u.is_active = 1
              AND cc.visible = 1
              ORDER BY rand();"
      return @db[query].first[:fullname]
    end


    def get_course_discrepency_list()
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
  end


end