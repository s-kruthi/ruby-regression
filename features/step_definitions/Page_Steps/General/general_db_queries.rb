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

    #returns users who have single or no cost centres
    def get_employee_without_multiple_costcentres()
      query = "select eu.first_name, eu.last_name, eu.id as user_id
               from epms_user eu
               where eu.is_active = 1
               and eu.is_onboarding = 0
               and eu.is_deleted = 0
               and eu.is_elmo = 0
               and eu.id not in (select user_id from epms_user_cost_centre eucc where eucc.is_deleted = 0 group by user_id
               having count(*) > 1)
               ORDER BY rand()"
      return @db[query].first
    end

    def get_employee_with_no_leavepolicy()
      query = "select first_name, last_name, id as user_id
               from epms_user
               where is_active = 1
               and is_deleted = 0
               and is_onboarding = 0
               and is_elmo = 0
               and id not in (select user_id from epms_leave_policy_user)
               ORDER BY rand()"
      return @db[query].first
    end

    def get_nondefault_leave_policy()
      query = "select title
               from epms_leave_policy
               where is_default = 0
               and is_deleted = 0
               ORDER BY rand()"
      return @db[query].first[:title]
    end

    def get_security_profiles_no_users()
      query = "select distinct ecrt.name, ecrt.id
               from epms_client_role_types ecrt
               left join epms_users_client_role_types eucrt on eucrt.client_role_type_id = ecrt.id
               where ecrt.is_deleted = 0
               and eucrt.client_role_type_id IS NULL
               order by rand()"
      return @db[query].first
    end

    def check_notification_exists(trigger_name)
      query = "select count(*) as count
               from epms_notifier_template_notification
               where trigger_id like '%#{trigger_name}%'
               and is_active = 1
               and is_deleted = 0"
      return @db[query].first[:count]
    end

    def get_notification_details(name)
      query = "select id
               from epms_notifier_template_notification
               where title = '#{name}'
               and is_deleted = 0"
      return @db[query].first
    end


    def get_vendor_details(vendor_name)
      query = "select id, name
               from epms_vendor
               where is_deleted = 0
               and is_active = 1
               and name = '#{vendor_name}'
               order by rand()"
      return @db[query].first
    end

    def get_vendor_usercount(vendor_id)
      query = "select count(*) as count
               from epms_user
               where is_active = 1
               and is_deleted = 0
               and vendor_id = #{vendor_id}"
      return @db[query].first[:count]
    end

    def get_vendor_user(vendor_id)
      query = "select id, first_name, last_name
               from epms_user
               where is_active = 1
               and is_deleted = 0
               and is_notified = 1
               and vendor_id = #{vendor_id}
               order by rand()"
      return @db[query].first
    end

  end

end