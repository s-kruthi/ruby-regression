module Database_env
  class DAO

    def get_user_with_leave_balance(leave_type_name)
      case leave_type_name
        when "RDO/ Time in Lieu"
          query = "select distinct eu.first_name, eu.last_name, eu.id as user_id from epms_user eu
                   inner join epms_leave_policy_user elpu on eu.id = elpu.user_id
                   inner join epms_hrcore_employment_detail ehed on eu.id = ehed.user_id
                   inner join epms_leave_bucket elb on eu.id = elb.user_id
                   where elpu.leave_policy_id = (select elp.id from epms_leave_policy elp
                     inner join epms_leave_policy_type elpt on elpt.policy_id = elp.id
                     inner join epms_leave_type elt on elt.id = elpt.type_id
                     where elt.title = 'RDO/ Time in Lieu')
                   and eu.is_active = 1
                   and eu.is_elmo = 0
                   and eu.is_deleted = 0
                   and eu.is_onboarding = 0
                   and ehed.is_active = 1
                   and ehed.is_deleted = 0
                   and exists (select user_id from epms_leave_bucket where leave_entitlement_type in (1,2,3,4))
                   and eu.id = (select user_id from epms_leave_bucket
                            where balance >= 8 and leave_entitlement_type = 4 and status = 1)
                   ORDER BY rand();"

        when "Long Service Leave"
          query = "select distinct eu.first_name, eu.last_name, eu.id as user_id from epms_user eu
                   inner join epms_leave_policy_user elpu on eu.id = elpu.user_id
                   inner join epms_hrcore_employment_detail ehed on eu.id = ehed.user_id
                   inner join epms_leave_bucket elb on eu.id = elb.user_id
                   where elpu.leave_policy_id = (select elp.id from epms_leave_policy elp
                     inner join epms_leave_policy_type elpt on elpt.policy_id = elp.id
                     inner join epms_leave_type elt on elt.id = elpt.type_id
                     where elt.title = 'Long Service Leave')
                   and eu.is_active = 1
                   and eu.is_elmo = 0
                   and eu.is_deleted = 0
                   and eu.is_onboarding = 0
                   and ehed.is_active = 1
                   and ehed.is_deleted = 0
                   and exists (select user_id from epms_leave_bucket where leave_entitlement_type = 3)
                   and eu.id in (select user_id from epms_leave_bucket
                            where balance >= 8 and leave_entitlement_type = 3 and status = 1)
                   ORDER BY rand();"

        when "Personal Leave"
          query = "select distinct eu.first_name, eu.last_name, eu.id as user_id from epms_user eu
                   inner join epms_leave_policy_user elpu on eu.id = elpu.user_id
                   inner join epms_hrcore_employment_detail ehed on eu.id = ehed.user_id
                   inner join epms_leave_bucket elb on eu.id = elb.user_id
                   where elpu.leave_policy_id in (select elp.id from epms_leave_policy elp
                     inner join epms_leave_policy_type elpt on elpt.policy_id = elp.id
                     inner join epms_leave_type elt on elt.id = elpt.type_id
                     where elt.title = 'Personal Leave')
                   and eu.is_active = 1
                   and eu.is_elmo = 0
                   and eu.is_deleted = 0
                   and eu.is_onboarding = 0
                   and ehed.is_active = 1
                   and ehed.is_deleted = 0
                   and exists (select user_id from epms_leave_bucket where leave_entitlement_type = 2)
                   and eu.id in (select user_id from epms_leave_bucket
                            where balance >= 8 and leave_entitlement_type = 2 and status = 1)
                   ORDER BY rand();"
      end
      return @db[query].first
    end

    def get_user_with_insufficient_leave_balance(leave_type_name)
      case leave_type_name
      when "Long Service"
        query = "select distinct eu.first_name, eu.last_name, eu.id as user_id from epms_user eu
                   inner join epms_leave_policy_user elpu on eu.id = elpu.user_id
                   inner join epms_hrcore_employment_detail ehed on eu.id = ehed.user_id
                   inner join epms_leave_bucket elb on eu.id = elb.user_id
                   where elpu.leave_policy_id = (select elp.id from epms_leave_policy elp
                     inner join epms_leave_policy_type elpt on elpt.policy_id = elp.id
                     inner join epms_leave_type elt on elt.id = elpt.type_id
                     where elt.title = 'Long Service Leave')
                   and eu.is_active = 1
                   and eu.is_elmo = 0
                   and eu.is_deleted = 0
                   and eu.is_onboarding = 0
                   and ehed.is_active = 1
                   and ehed.is_deleted = 0
                   and exists (select user_id from epms_leave_bucket where leave_entitlement_type = 3)
                   and eu.id in (select user_id from epms_leave_bucket
                            where balance <= 7.6 and leave_entitlement_type = 3 and status = 1)
                   ORDER BY rand();"
      end
      return @db[query].first
    end

  end
end