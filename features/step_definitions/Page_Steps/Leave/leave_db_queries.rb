module Database_env
  class DAO
    def get_leave_type(title)
      query = "select * from epms_leave_type
               where title = '#{title}'
               and is_deleted = 0"
      return @db[query].first
    end

  end

end