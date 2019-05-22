def CreateLeaveTypeThroughJmeter(leave_type, leavetype_name)
  url = $site_url.split('//')[1].split('/')[0]
  ent_type = GetEntitlementType(leave_type)
  @leavetype_title = leavetype_name + rand(100).to_s

  if ENV['MYMAC']
    %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/LeaveManagement/CreateLeaveType.jmx -Jurl=#{url} -Jenttype=#{ent_type} -Jusername=#{@username} -Jtitle=#{@leavetype_title})
  else
    %x(/var/lib/apache-jmeter/bin/./jmeter -n -t ./JMETER_AUTO/Jmeter_tests/LeaveManagement/CreateLeaveType.jmx -Jurl=#{url} -Jenttype=#{ent_type} -Jusername=#{@username} -Jtitle=#{@leavetype_title})
  end
end

def GetEntitlementType(leave_type)
  case leave_type
  when 'Long Service Leave'
    return 3
  when 'Rostered Day Off / Time in Lieu'
    return 4
  end
end

def CheckLeaveTypeExists(leavetype_title)
  #checking the DB for the leave type created through Jmeter
  leave_type = $daos.get_leave_type(leavetype_title)

  #returns nil if leave type is not found
  if leave_type.nil?
    puts COLOR_RED + "Leave Type was not created, check manually".upcase
  end

  puts COLOR_GREEN + ("Leave Type was created successfully with title " + leavetype_title).upcase
end