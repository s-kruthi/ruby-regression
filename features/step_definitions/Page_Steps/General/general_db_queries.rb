module Database_env
  class DAO
    def get_assignment_rules_course_list_by_name(partial_course_name)
      query = "SELECT DISTINCT c.id, c.fullname FROM mdl_course c
              INNER JOIN mdl_course_categories cc ON cc.id = c.category
              WHERE c.fullname LIKE '%#{partial_course_name}%'
              AND c.visible = 1
              AND cc.visible = 1
              ORDER BY rand();"
      return @db[query].first[:fullname]
    end


    def get_userid(username)
      query = "SELECT id FROM epms_user
                 WHERE username = '#{username}'
                AND is_active = 1 AND is_elmo = 0
                AND is_notified = 1
                AND confirmed = 1
                AND is_deleted = 0;"
      return @db[query].first[:id]
    end


    def get_notification_by_trigger_id_and_recipient_name(notification_trigger_id, recipient_name)
      query = "SELECT eplm.id, epnns.template_id, n.trigger_id,
      t.due_date AS DUE_DATE, eplm.SUBJECT AS SUBJECT,
      eplm.body, eplm.status AS EPMS_LOG_STATUS, epnns.status AS SCHEDULE_STATUS,
      epnns.status_code, eplm.recipients, eplm.replyEmail,
      FROM_UNIXTIME(eplm.created_time) AS CREATED, FROM_UNIXTIME(eplm.fired_time) AS FIRED
      FROM epms_log_message AS eplm
      INNER JOIN  epms_notifier_notification_schedule AS epnns ON eplm.source_id = epnns.id
      INNER JOIN  epms_notifier_notification AS n ON n.id = epnns.notification_id
      INNER JOIN  epms_notifier_template_notification t ON t.id = epnns.template_id
      WHERE eplm.created_time > UNIX_TIMESTAMP(CURRENT_TIMESTAMP - INTERVAL 8 HOUR)
      AND n.trigger_id LIKE '%#{notification_trigger_id}%'
      AND eplm.recipients LIKE '%#{recipient_name}%'
      ORDER BY ID DESC
      LIMIT 1;"
      return @db[query].first
    end
  end
end