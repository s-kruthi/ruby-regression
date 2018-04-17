When(/^I Setup A Course To Edit The Section$/i) do
  AddACoursesAndGoToCourseSection(ADD_COURSE_BTN)
  FillTheCourseFormAndSaveIt(COURSE_NAME_ID, COURSE_NAME_VAL, COURSE_CODE_ID, COURSE_CODE_VAL, SAVE_COURSE_ID)
end


And(/^I Try To Setup A Quiz Activity Under The Section$/i) do
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  AddANewSection(COURSE_ADD_A_SECTION_BTN_ID)
  SelectAnActivity("Quiz")
end


Then(/^I Should be Able To Successfully Setup The Quiz Activity$/i) do
  SetupTheQuizActivityAndSaveIt()
end


When(/^I Click On The New Course Button$/i) do
  GoToNewCourseAddPage(CREATE_NEW_COURSE_BTN)
end


And(/^I Add New Course Details$/i) do
  EnterCourseTitle(NEW_COURSE_TITLE_ID, NEW_COURSE_TITLE_VALUE)
  EnterCourseCode(NEW_COURSE_CODE_ID, COURSE_CODE_VAL)
  EnterCourseDescription(NEW_COURSE_DESC_TEXT, 0)
  EnterCourseRetrain(COURSE_RETRAIN_INPUT_ID, COURSE_RETRAIN_INPUT_VALUE) if COURSE_RETRAIN.to_i == 1
  EnterCourseRetrainOpen(COURSE_RETRAIN_OPEN_INPUT_ID, COURSE_RETRAIN_OPEN_INPUT_VALUE) if COURSE_RETRAIN_OPEN.to_i == 1
  EnterCourseComplete(COURSE_COMPLETE_INPUT_ID, COURSE_COMPLETE_INPUT_VALUE)
  EnterCourseAvailability(COURSE_AVAILABILITY_INPUT_ID, COURSE_AVAILABILITY_INPUT_VALUE)
  EnterCourseCertificateTemplate(COURSE_CERTIFICATE_TEMPLATE_ID, COURSE_CERTIFICATE_TEMPLATE_VALUE) if COURSE_CERTIFICATE.to_i == 1
  EnterCourseSelfEnrol(COURSE_SELF_ENROLL_INPUT_ID, COURSE_SELF_ENROLL_INPUT_VALUE)
  EnterCourseSectionDescription(COURSE_SHOW_SEC_DESC_INPUT_ID, COURSE_SHOW_SEC_DESC_INPUT_VALUE)
end


Then(/^I Should Be Able To Create A New Course$/i) do
  ClickOnAButtonByXPath(FORM_TEMPLATE_SAVE_BTN)
  Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, COURSE_VERIFY_SAVE_SUCCESSFUL_VALUE))
end


When(/^I Search For A Specific Course Named (.*)$/i) do |course_name|
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, course_name, COURSE_SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Edit The Specific Course$/i) do
  EditFirstCourseFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


Then(/^I Should Be Able To Delete The Specific Course$/i) do
  DeleteTheFirstCourseFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_DELETE)
  Sleep_Until(CourseActionConfirm(COURSE_DELETE_BTN_NAME_ID))
  VerifySuccessAlertMessage(COURSE_DELETE_SUCCESSFUL_ID, COURSE_DELETE_SUCCESSFUL_VALUE)
end


When(/^I Edit A Specific Course Named (.*)$/i) do |course_name|
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, course_name, COURSE_SEARCH_BTN_ID)
  EditFirstCourseFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


Then(/^I Should Be Able To Add A New (.*) Activity$/i) do |course_activity_name|
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  AddANewSection(COURSE_ADD_A_SECTION_BTN_ID)
  SelectAnActivity(course_activity_name)
  CreateAnActivity(course_activity_name)
end


And(/^I Open A Specific Face-to-Face Activity Named (.*)$/i) do |f2f_activity_name|
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  ClickOnFirstActivity(f2f_activity_name)
end


Then(/^I Should Be Able To Create A Session In The Face-to-Face Activity$/i) do
  # pending
  ClickOnAButtonByXPath()
end


Then(/^I Should Be Able To Delete A Specific Section$/i) do
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  DeleteASection(SECTION_TRASH_ICON_ID)
end


Then(/^I Should Be Able To Add All Notifications$/i) do
  ClickOnASubTab(SUB_TAB_APPROVAL_NOTIFICATION_NAME_ID)
  CreateAllNotifications()
end


And(/^I Click On The Menu Of A Specific Course$/i) do
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
  EditFirstCourseFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


Then(/^I Should Be Able To (.*) Of The Specific Course$/i) do |retrain_action|
  ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, retrain_action)
  case retrain_action
    when "Fix Retrain"
      begin
        Sleep_Until(VerifySuccessAlertMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_FIX_SUCCESSFUL_VALUE))
      end

    when "Disable Retrain"
      begin
        Sleep_Until(VerifySuccessAlertMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_DISABLE_SUCCESSFUL_VALUE))
      end
  end
end


And(/^I select (.*) as (.*)$/i) do |dropdown_name, dropdown_value|

  case dropdown_name
    when "Employee Name"
      begin
        Sleep_Until(SelectSingleFromSelect2InputDropdown(EMPLOYEE_NAME_DROPDOWN_ID, SELECT2_DROPDOWN_ID, dropdown_value, SELECT2_DROPDOWN_RESULT_CLASS))
      end
  end

end


Then(/^I Should Be Able to Create a Filter$/i) do
  Sleep_Until(ClickOnSaveButton(FILTER_SUBMIT_BTN_ID))
end


And(/^See a Filtered List of Retrain Discrepancy Course Results for Learner (.*)$/i) do |learner_name|
  VerifyFilterResult(FILTER_RESULT_VERIFY_TABLE_ID, "#{learner_name.to_s}")
end


Then(/^I Should Be Able To View The Face-To-Face Activity Session List$/i) do
  WaitForFaceToFaceSessionListAndVerify(F2F_SESSION_HEADING_ID, F2F_SESSION_HEADING_VALUE)
  WaitForFaceToFaceSessionListAndVerify(F2F_SESSION_TITLE_ID, F2F_TITLE_VALUE)
end


And(/^I Should Be Able to Sort The The Face-To-Face Activity Session List By (.*)$/i) do |sorting_order_type|
  FindFaceToFaceSessionSortingColumnByClass(F2F_SESSION_SORTING_CLASS_ID, sorting_order_type)
  SortFaceToFaceSessionListByType(sorting_order_type)
  VerifyFaceToFaceSessionSortingOrderByClass(F2F_SESSION_SORTING_ORDER_ID)
  SortFaceToFaceSessionListByType(sorting_order_type)
  VerifyFaceToFaceSessionSortingOrderByClass(F2F_SESSION_SORTING_ORDER_ID)
end


And(/^I Can View The Enrolled Users For That Particular Course$/) do
  GoToTheEnrolledUserSectionOfThatParticularCourse(DROPDOWN_KEY_CSS, 0, ENROLLED_USER_LTXT, MANUAL_ENROLL_LTXT)
end


When(/^I Try To Refresh The Enrolments For That Particular Course$/) do
  ClickAndRefreshEnrollmentsForAParticularCourse(DROPDOWN_KEY_CSS, 0, REFRESH_ENROLMENT_LTXT, REFRESH_ID)
  PressConfirm()
  Sleep_Until(WaitForAnElementByClass("close-btn"))
  PressEnterClose()
end


And(/^I Have Interacted With An Assigned F2F Course (.*)$/i) do |course_name|
  GoToCourseCatalogueSection(COURSE_CATALOGUE_LTEXT)
  SearchTheAssignedCourse(course_name)
  Sleep_Until(VerifyAnElementExistByCSS(F2F_COURSE_TITLE_CSS, course_name))
  SignUpForASession(ENROLLED_BUTTON, ACTIVITY_NAME, SIGNUP_BUTTON)
end


And(/^I Have Interacted With An Assigned quiz Course (.*)$/i) do |course_name|
  GoToCourseCatalogueSection(COURSE_CATALOGUE_LTEXT)
  SearchTheAssignedCourse(course_name)
  Sleep_Until(VerifyAnElementExistByCSS("span[title=\"#{course_name}\"]", course_name))
  FillUpQuizSection(ENROLLED_BUTTON, ACTIVITY_NAME, SUBMIT_QUIZ_BUTTON, QUIZ_ANSWER)
  sleep(2)
  WaitForAnElementByPartialLinkTextAndTouch(course_name)
end


Then(/^I Should See The Course (.*) Status Reset To Not Yet Started$/i) do |course_name|
  GoToCourseEnrolmentsSection(COURSE_ENROLMENT_LTEXT)
  SearchTheAssignedCourseInEnrollmentSection(course_name)
  VerifyTheStatusAsNotYetStarted()
end


And(/^I Withdraw The Candidate From Session$/) do
  WithdrawTheCandidateFromF2FSession()
end


And(/^I Validate the Status As In Progress$/) do
  VerifyTheStatusAsInProgress()
end


And(/^I Re Enrol The Candidate For The Activity$/) do
  DeleteTheExistingEnrolmentAndReEnrolTheCandidate()
end


And(/^I Edit A Specific Face-to-Face Activity Named (.*)$/i) do |f2f_activity_name|
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  EditACourseActivity(F2F_ACTIVITY_EDIT_LINK)
end


When(/^I Set (.*) Settings To (.*)$/i) do |label_name, label_value|
  CheckFaceToFaceActivitySettings(label_name, label_value)
  ClickOnAButtonByXPath(F2F_SAVE_BTN_ID)
  Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_SETTINGS_SAVE_VALUE))
end


Then(/^I Should Be Able To Create A Session In The Face\-to\-Face Activity with the Specified Settings$/i) do
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  EditACourseActivity(F2F_ACTIVITY_EDIT_LINK)
  VerifyFaceToFaceActivitySettings()
end

