
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