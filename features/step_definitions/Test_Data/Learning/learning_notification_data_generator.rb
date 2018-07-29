
def GenerateLearningDataUsingJmeterRubyService()
  if ENV['MYMAC']
    %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Learning/LearningDataAddUser.jmx -Jserver=#{$create_against})
  else
    %x(/var/lib/apache-jmeter/bin/./jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Learning/LearningDataAddUser.jmx -Jserver=#{$create_against})
  end
  csv = CSV.read('JMETER_AUTO/Jmeter_tests/Learning/learning_user_id.csv', :headers=>false)
  puts "manager_id:" + csv[0][0]
  puts "manager_username:" + csv[0][1]
  puts "user_id:" + csv[0][2]
  $created_username = puts "username:" + csv[0][3]
end