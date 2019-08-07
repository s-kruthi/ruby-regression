When(/^I Click On The Enrol Button For A Course$/i) do
  EnrolToCourse()
end

Then(/^I Should See The Success Message For The "(Enrolment|Unenrolment)"$/i) do | enrolment_unerolment |
  if enrolment_unerolment == "Enrolment"
    SUCCESS_MSG_VALUE = ENROL_SUCCESS_MSG_VALUE
  else
    SUCCESS_MSG_VALUE = UNENROLL_SUCCESS_MSG_VALUE
  end
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SUCCESS_MSG_VALUE))
end

And(/^I Should See That I Am (Enrolled|Unenrolled) To The Course$/i) do | enrolment_unenrolment |
  if enrolment_unenrolment == "Enrolled"
    VerifyEnrolmentToCourse()
  else
    VerifyUnenrolmentToCourse()
  end
end

And(/^The User Has Enrolled To A Course With Self-Unenroll Set To (Yes|No)$/i) do |self_unenroll_allowed|
  CheckUserEnrolledCourse(self_unenroll_allowed)
end

And(/^I Search For The Course I Have Enrolled To$/i) do
  puts COLOR_BLUE + "Using Course '#{@course[:fullname]}' with id '#{@course[:course_id]}'"
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @course[:fullname], COURSE_SEARCH_BTN_ID)
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

Then(/^I Should Be Able To Bulk Enrol Users To That Course$/i) do
  GoToEnrolledUserPage()
  BulkEnrolUsersToThatCourse()
  VerifyAllSelectedUsersGotBulkEnrolledToTheCourse("#{@details[:course_id]}")
end

And(/^I Search For The Randomly Created Course Under Enrolment$/i) do
  Sleep_Until(SearchForTheCourseUnderEnrolmentTab("#{$randomly_created_course}"))
end

When(/^I Choose To Refresh The Enrolment For Completed Activity$/i) do
  sleep(4)
  Sleep_Until(ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, "Refresh Enrolment"))
end

When(/^I Refresh The Enrolment For That Activity$/i) do
  Sleep_Until(WaitForAnElementByClassAndTouch(ACTIVITY_REFRESH))
end

When(/^I Refresh The Enrolment For All The Activities$/i) do
  Sleep_Until(WaitForAnElementByClassAndTouch(ALL_ACTIVITY_REFRESH))
end

Then(/^I Should See The Activity Successfully Marked As Not Yet Started$/i) do
  Sleep_Until(VerifyAnElementExistByClass(ACTIVITY_REFRESH_STATUS_NS, "Not Yet Started"))
  Sleep_Until(WaitForAnElementByXpathAndTouch(ACTIVITY_REFRESH_MODAL_CLOSE ))
end

And(/^I Should See The Course Status Successfully Marked As (.*)$/i) do |course_status|
  case course_status

  when "In Progress"
  Sleep_Until(VerifyAnElementExistByClass(ACTIVITY_REFRESH_STATUS_IP, "In Progress"))

  when "Not Yet Started"
  Sleep_Until(VerifyAnElementExistByClass(ACTIVITY_REFRESH_STATUS_NS, "Not Yet Started"))

  when "Completed"
    Sleep_Until(VerifyAnElementExistByClass(ACTIVITY_REFRESH_STATUS_CO, "Completed"))
  end
end

And(/^I Have Course and User Details Of Enrolment$/i) do
 @details = $daos.get_enrolment_details
 if @details.nil?
   puts COLOR_YELLOW + "no such course found".upcase
   skip_this_scenario
 end
end

And(/^I Go To The Enrolled User Section Of The Course$/i) do
  Sleep_Until(GoToSpecificCourseEnrolmentSection(@details[:course_id].to_s))
end


When(/^I Search For The Course With Enrolment$/i) do
  Sleep_Until(SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @details[:course_name], COURSE_SEARCH_BTN_ID))
end

And(/^I Select The Enrolled User From Employee Name$/i) do
  @emp_name = @details[:name]
  steps %{
    And I Select "Employee Name" Select2 Dropdown As "#{@emp_name}"}
end

And(/^I See A Filtered List Of Course Enrolment Returning The User In The User Filter$/i) do
  steps %{
      And I See A Filtered List Of Course Enrolment Returning User "#{@emp_name}"}
end

Given(/^I Have Course With No Enrolments$/i) do
  @details = $daos.get_coursedetails_noenrolments
  if @details.nil?
    puts COLOR_YELLOW + "no such course found".upcase
    skip_this_scenario
  end
end

When(/^I Search For The Course With No Enrolments$/i) do
  Sleep_Until(SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @details[:course_name], COURSE_SEARCH_BTN_ID))
end