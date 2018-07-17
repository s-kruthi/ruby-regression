module Database_env
  class DAO

    #provides the payroll id which is linked to a user
    def get_paycycle_associated_to_user()
      query = "select id, title
               from `epms_hrcore_payroll_cycle` ehpc
               where exists
               (select * from `epms_hrcore_employment_detail` where ehpc.id = payroll_cycle)
               and is_deleted = 0
               ORDER BY rand();"
      return @db[query].first
    end

    #provides the payroll id which is not linked to a user
    def get_paycycle_unassociated_to_user()
      query = "select id, title
               from `epms_hrcore_payroll_cycle` ehpc
               where not exists
               (select * from `epms_hrcore_employment_detail` where ehpc.id = payroll_cycle)
               and is_deleted = 0
               ORDER BY rand();"
      return @db[query].first
    end


    def get_payroll_cycle_details()
      query = "select id, title, created_date, type
               from `epms_hrcore_payroll_cycle` ehpc
               where is_deleted = 0
               ORDER BY rand();"
      return @db[query].first
    end


    def get_count_payroll_cycle()
      query = "select count(*) as payroll_cyclenum
               from `epms_hrcore_payroll_cycle` ehpc
               where is_deleted = 0
               ORDER BY rand();"
      return @db[query].first[:payroll_cyclenum]
    end

  end
end

