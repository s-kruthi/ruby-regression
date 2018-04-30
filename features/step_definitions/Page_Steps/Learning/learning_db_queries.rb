module Database_env
  class DAO
    def get_visible_course_list_by_name(partial_course_name)
      query = "SELECT id, fullname, shortname, c_template
               FROM mdl_course
               WHERE fullname LIKE '%#{partial_course_name}%'
               AND visible = 1;"
      return @db[query].first[:fullname]
    end


    def get_course_discrepency_list()
      query = "SELECT c.fullname courseName, c.id courseId, u.id userId, e.retrain, e.retrain_open
              FROM epms_lms_course_enrolment e
              INNER JOIN mdl_course c ON e.course_id = c.id
              INNER JOIN epms_user u ON e.user_id = u.id
              WHERE u.is_elmo = 0 AND
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
      return @db[query]
    end


  end


end