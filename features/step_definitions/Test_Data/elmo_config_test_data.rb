# HOW_MANY_USERS = 10
# SELECT_MANAGER = 0
# SELECT_START_DATE = 1
# SELECT_EXPIRY_DATE = 1
# SELECT_TIMEZONE = 1
#
# NEW_USER_FIRST_NAME_PREFIX = "auto1"
# NEW_USER_LAST_NAME_PREFIX = "test1"
# NEW_USER_EMAIL_SUFFIX = "@elmodev.com"
#
# MANAGER_SELECT_INPUT_VALUE = "manager1.omar1"
#
# SELECT_START_DATE_VALUE = (DateTime.now).prev_month.strftime "%d/%m/%Y"
# SELECT_EXPIRY_DATE_VALUE = (DateTime.now).next_year.strftime "%d/%m/%Y"
# SELECT_TIMEZONE_VALUE = "Sydney"
# USER_PASSWORD_VALUE = "Admin1234567"
#
# ADD_USER_SAVE_SUCCESS_VALUE = "User details have been updated!"
#
#
# EM_USER__NAME_VALUE = "Automation Test User"
# EM_USER_RELATIONSHIP_VALUE = "Tester"
# EM_USER_ADDRESS_VALUE = "520 Oxford St, Bondi Junction, New South Wales, Australia"
# EM_USER_MOBILE_VALUE = "0430000000"
# EM_USER_EMAIL_VALUE = "auto.test@elmodev.com"
#
# USERNAME_SEARCH_VALUE = "auto10.test10"
#
# USERNAME_SEARCH_RESULT_VALUE = "//td[contains(.,'auto10.test10@elmodev.com')]"
# ACTION_DROPDOWN_CLASS_INDEX_VALUE = 3
# ACTION_DROPDOWN_NAME_VALUE = "Deactivate user"
# INACTIVE_ATTRIBUTE_TEXT = "User is not active"


user_config_selection = {
    "Personal Email": "personal_email",
    "Home Phone": "home_phone",
    "Work Phone": "work_phone",
    "Mobile Phone": "mobile_phone",
    "Address": "address"
}

activity_resume_selection = {
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

#activity = { "a" => 100, "b" => 200 }
#activity.each {|key, value| puts "#{key} is #{value}" }
#activity.each_key {|key| puts key }

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