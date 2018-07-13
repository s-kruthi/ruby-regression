When(/^I Click On The Enrol Button For A Course$/i) do
  EnrolToCourse()
end


Then(/^I Should See The Success Message For The (Enrolment|Unenrollment)$/i) do | enrolment_unerollment |
  if enrolment_unerollment == "Enrolment"
    SUCCESS_MSG_VALUE = ENROL_SUCCESS_MSG_VALUE
  else
    SUCCESS_MSG_VALUE = UNENROLL_SUCCESS_MSG_VALUE
  end
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SUCCESS_MSG_VALUE))
end


And(/^I Should See That I Am (Enrolled|Unenrolled) To The Course$/i) do | enrolment_unenrollment |
  if enrolment_unenrollment == "Enrolled"
    VerifyEnrolmentToCourse()
  else
    VerifyUnenrollmentToCourse()
  end
end


And(/^The User Has Enrolled To A Course With Self-Unenroll Set To (Yes|No)$/i) do |self_unenroll_allowed|
  CheckUserEnrolledCourse(self_unenroll_allowed)
end


And(/^I Search For The Course I Have Enrolled To$/i) do
  steps "When I Search For A Specific Course Named #{@course_name}"
end


When(/^I Click On The Enrolled Button For The Course$/i) do
  GoToCourseViewPageToUnenrol()
end


And(/^I Click On The Unenrol Button In The Course$/i) do
  UnenrolFromCourse()
end


Then(/^I Should See That I Cannot Unenroll From The Course$/i) do
  #check that the Unenrol button is not there
  CheckNoUnenrolButton()
end


And(/^I Should See The ([\w\s]+) On The Page$/i) do |field_name|
  CheckCourseDetail(field_name)
end


Then(/^I Should See All The Courses I Am Enrolled To$/i) do
  CheckCoursesEnroled()
end

Then(/^I Should Be Able To Bulk Enrol Users To That Course$/) do
  GoToEnrolledUserPage()
  BulkEnrolUsersToThatCourse()
  VerifyAllSelectedUsersGotBulkEnrolledToTheCourse("#{$data_hash['course_id:']}")
end