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
      query = "SELECT id, username, is_elmo, is_active, is_notified, confirmed, is_deleted, is_onboarding FROM epms_user
                 WHERE username = '#{username}';"
      return @db[query].first
    end


    def get_notification_by_trigger_id_and_recipient_name(notification_trigger_id, recipient_name)
      query = "SELECT eplm.id, eplm.source_id, epnns.template_id, epntn.trigger_id, epntn.due_date, eplm.subject, eplm.body,
               eplm.STATUS as STATUS, epnns.status AS LOG_SCHEDULE_STATUS,
               epnns.status_code, eplm.recipients, eplm.replyEmail, from_unixtime(eplm.created_time) AS CREATED,
               from_unixtime(eplm.fired_time) AS FIRED
               FROM epms_log_message AS eplm
               INNER JOIN epms_notifier_notification_schedule AS epnns ON eplm.source_id = epnns.id
               INNER JOIN epms_notifier_template_notification AS epntn ON epnns.template_id = epntn.id
               WHERE eplm.created_time > UNIX_TIMESTAMP(CURRENT_TIMESTAMP - INTERVAL 2 HOUR)
               AND epntn.trigger_id LIKE '%#{notification_trigger_id}%'
               AND eplm.recipients LIKE '%#{recipient_name}%'
               ORDER BY ID DESC LIMIT 1;"
      return @db[query].first
    end


    def get_employee_with_default_autopay()
      query = "select distinct user_id, first_name,last_name
               from epms_hrcore_employment_detail ehed
               inner join epms_user eu on eu.id = ehed.user_id
               where autopay is Null
               and eu.is_deleted = 0
               and is_elmo = 0
               and eu.is_active = 1
               and is_onboarding = 0
               and ehed.is_active = 1
               and annual_salary <> 0
               ORDER BY rand();"
      return @db[query].first
    end


    def get_employee_with_autopay_no()
      query = "select distinct user_id, first_name,last_name
               from epms_hrcore_employment_detail ehed
               inner join epms_user eu on eu.id = ehed.user_id
               where eu.is_deleted = 0
               and is_elmo = 0
               and eu.is_active = 1
               and is_onboarding = 0
               and ehed.is_active = 1
               and (autopay = 0
               or autopay is NULL)
               and annual_salary <> 0
               ORDER BY rand();"
      return @db[query].first
    end


    def get_epms_config_enabled(name)
      query = "select value from epms_config
               where name = '#{name}'
               and module = 'config'"
      return @db[query].first
    end


    def check_legal_entity_exists(abn_num)
      query = "select exists
              (select 1
              from epms_legal_entity where abn = '#{abn_num}')
              as presence"
      return @db[query].first
    end


    #only editing non-default entities
    def get_legal_entity_details_for_edit()
      query = "select id, business_name
              from epms_legal_entity
              where is_default = 0
              and is_deleted = 0
              ORDER BY rand();"
      return @db[query].first
    end


    def get_legal_entity_details()
      query = "select id, abn, business_name, is_default, is_active
              from epms_legal_entity
              where is_deleted = 0
              ORDER BY rand();"
      return @db[query].first
    end


    def get_default_entity_details()
      query = "select id, business_name
              from epms_legal_entity
              where is_deleted = 0
              and is_default = 1
              and is_active = 1"
      return @db[query].first
    end


    def get_count_active_legal_entity()
      query = "select count(*) as count
              from epms_legal_entity
              where is_deleted = 0
              and is_active = 1"
      return @db[query].first
    end


    def get_legal_entity_details_linked_to_user()
      query = "select distinct ele.id, business_name
              from epms_legal_entity ele
              inner join epms_user_legal_entity eule on eule.legal_entity_id = ele.id
              inner join epms_user eu on eu.id = eule.user_id
              where ele.is_deleted = 0
              and ele.is_active = 1
              and is_elmo = 0
              and eu.is_active = 1
              and is_onboarding = 0
              ORDER BY rand();"
      return @db[query].first
    end


    def get_count_enabled_positions()
      query = "select count(*) as count
              from epms_position
              where is_deleted = 0"
      return @db[query].first
    end


    #gets the count of users to be activated/notified
    def get_count_userstobeactivated(onboarding)
      query = "select count(*) as count
               from epms_user
               where is_active = 1
               and is_notified = 0
               and is_deleted = 0
               and confirmed = 0
               and is_onboarding = #{onboarding}"
      return @db[query].first
    end


    def get_nav_menu_setting()
      query = "select value
               from epms_config
               where name = 'switchVerticalNavigationMenu'"
      return @db[query].first
    end


    def get_custom_user_field_details(num)
      query = "select name, shortname
               from epms_user_profile_field
               where is_deleted = 0
               ORDER BY rand() limit #{num}"
      return @db[query]
    end

  end

end