ELMO_CONFIG_SETTINGS = {
    "User activation on": ELMO_CONFIG_USER_ACTIVATION_ON_ID,
    "Notify new user": ELMO_CONFIG_NOTIFY_NEW_USER_ID,
    "Employee must have manager": ELMO_CONFIG_EMPLOYEE_MUST_HAVE_MANAGER_ID,
    "Lock course with enrolments": ELMO_CONFIG_LOCK_COURSE_WITH_ENROLMENTS_ID,
    "New User Contract": ELMO_CONFIG_NEW_USER_CONTRACT,
    "New OB User Contract": ELMO_CONFIG_NEW_OB_USER_CONTRACT
}
ELMO_CONFIG_VERIFY_SAVE_SUCCESSFUL_VALUE = "ELMO configurations have been saved!"


USER_CONFIG_SELECTION = {
    "Personal Email": "personal_email",
    "Home Phone": "home_phone",
    "Work Phone": "work_phone",
    "Mobile Phone": "mobile_phone",
    "Address": "address"
}


ACTIVITY_RESUME_SELECTION = {
    "Performance": "performance",
    "Learning": "learning",
    "Professional Development": "cpd",
    "Document": "document",
    "Task": "task",
    "License and Accreditations": "licenses_accreditations",
    "Notes": "notes",
    "Experience": "position",
    "Education": "education",
    "Skills": "skill",
    "Languages": "language",
    "Recommendations": "recommendation",
    "Message": "messages"
}

# activity = { "Performance" => 100, "Professional Development" => 200 }
# activity.each {|key, value| puts "#{key} is #{value}" }
# activity.each_key {|key| puts key }

#puts user_config_selection[:personal_email]

# test = ['personal_email', 'home_phone']
#
# test.each_with_index do |test,index|
#     $driver.find_element(:id, "#{test}").click
#     $driver.find_elements(:class, "toggle-on")[index].click
#     $driver.find_elements(:id, "contactDetailsConfig_submit")[index].click
#     puts "#{test} #{index}"
#     sleep(3)
# end
#
#
# irb(main):007:0> require ('./sel-aut.rb')
# hung01 - Administration - Personal and Payment Configuration
# personal_email 0
# home_phone 1