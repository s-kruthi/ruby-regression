module Database_env
  class DAO

    def get_existing_user_detail_with_no_contract()
      query = "select id, first_name, last_name, email
               from epms_user
               where id not in (select user_id from epms_contract_workflow
               where status in (1,2,3,4,5,7,8))
               and is_active =1 and is_deleted=0 and is_elmo=0 and is_onboarding=0 order by rand();"
      @db[query].first
    end

    def get_onboarding_user_detail_with_no_contract()
      query = "select id, first_name, last_name, email
               from epms_user
               where id not in (select user_id from epms_contract_workflow
               where status in (1,2,3,4,5,7,8))
               and is_active =1 and is_deleted=0 and is_elmo=0 and is_onboarding=1 order by rand();"
      @db[query].first
    end

    def get_user_contract_workflow_id(user_id, status)
      query = "select id
               from epms_contract_workflow
               where user_id = #{user_id}
               and status = #{status};"
      @db[query]
    end

    def get_contract_placeholders_containing_string(contract_placeholder_string)
      query = "select count(*) as contract_placeholdersnum
               from epms_placeholder
               where name like '%#{contract_placeholder_string}%';"
      contract_placeholders_count = @db[query].first
      return contract_placeholders_count[:contract_placeholdersnum]
    end

    def get_contract_contractlib()
      query = "select id, name
               from epms_contract
               where visible = 1
               and is_deleted = 0
               order by rand();"
      @db[query].first
    end

    def get_hiddencontract_contractlib
      query = "select id, name
               from epms_contract
               where visible = 0
               and is_deleted = 0
               order by rand();"
      @db[query].first
    end
  end

end
