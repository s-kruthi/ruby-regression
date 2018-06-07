
def GenerateLearningDataUsingJmeterRubyService()
  %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/LearningDataAddUser.jmx -Jserver=#{ENV['STAGING']})
  csv = CSV.read('JMETER_AUTO/Jmeter_tests/user_id.csv', :headers=>false)
  puts "manager_id:" + csv[0][0]
  puts "manager_username:" + csv[0][1]
  puts "user_id:" + csv[0][2]
  puts "username:" + csv[0][3]
end