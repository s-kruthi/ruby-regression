
Given(/^I Want To Generate Learning Notification data On Any Staging$/i) do
  startWebDriver()
  if ENV['url'] == nil
    ENV['url'] = 'tmsfull'
  else
    puts "server provided = " + ENV["url"]
  end
  puts $create_against =  "#{ENV['url']}.dev.elmodev.com"
  puts "Data Creation in process...".colorize(:light_yellow)
  GenerateLearningDataUsingJmeterRubyService()
end


Then(/^The User Should Be Instantly Notified About The New Enrolment$/) do
  ReturnDetailsOfAParticularUser(TMSFULL_DATABASE,DOC_USERNAME)
  ConnectToDatabaseAndValidateTheCourseEnrolmentNotification()
end

Then(/^The Approver Should Be Instantly Notified About The New Enrolment Request$/) do
  ReturnDetailsOfAParticularUser(TMSFULL_DATABASE,DOC_USERNAME)
  ConnectToDatabaseAndValidateTheCourseEnrolmentRequestNotification()
end

And(/^I Approve The Course Enrolment Request$/) do
  GoToCourseCatalogueSection(COURSE_REQUESTS_LTEXT)
  WaitForAnElementByCSSAndTouch(APPROVE_CRS_RQST_CSS)
  sleep(1)
  WaitForAnElementByClassAndInputValue(COURSE_APPROVAL_REASON_FLD,COURSE_APPROVAL_REASON)
  PressConfirm()
end

Then(/^The User Should Be Instantly Notified About The New Enrolment Request$/) do
  ConnectToDatabaseAndValidateTheCourseEnrolmentRequestApprovedNotification()
end

Then(/^The User Should Be Instantly Notified About The New Course Enrolment$/) do
  ReturnDetailsOfAParticularUser(TMSFULL_DATABASE,DOC_USERNAME)
  ReturnMultipleUserDetails(TMSFULL_DATABASE,DOC_USERNAME,'AssignmentRule_course_automation')
  puts $data_hash['first_name:']
  puts $data_hash['course_id:']
  ConnectToDatabaseAndValidateTheNewCourseEnrolmentNotification()
end

Then(/^All Bulk Enrolled Users Should Be Instantly Notified About The New Course Enrolment$/) do
  ConnectToDatabaseAndValidateBulkNewCourseEnrolmentNotifications()
end