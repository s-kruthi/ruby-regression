When(/^I Click On The New Course Button$/i) do
  ClickOnAButtonByXPath(CREATE_NEW_COURSE_BTN)
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
  ClickOnSaveButton(SAVE_BTN_ID)
  Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, COURSE_VERIFY_SAVE_SUCCESSFUL_VALUE))
end


When(/^I Search For A Specific Course Named (.*)$/i) do |course_search_name|
  course_list_result = $daos.get_visible_course_list_by_name(course_search_name)
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, course_list_result, COURSE_SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Edit The Specific Course$/i) do
  ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


When(/^I Edit A Specific Course Named (.*)$/i) do |course_search_name|
  course_list_result = $daos.get_visible_course_list_by_name(course_search_name)

  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, course_list_result, COURSE_SEARCH_BTN_ID)
  ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


And(/^I Open A Specific Activity Named (.*)$/i) do |f2f_activity_name|
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  ClickOnFirstActivity(f2f_activity_name)
end


Then(/^I Should Be Able To Add A (.*) Activity$/i) do |course_activity_name|
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  AddANewSection(COURSE_ADD_A_SECTION_BTN_ID)

  case course_activity_name
    when 'Acknowledgement'
      CreateAnActivity(course_activity_name)
    else
      SelectAnActivity(course_activity_name)
      CreateAnActivity(course_activity_name)
  end
end


Then(/^I Should Be Able To (Edit|Delete) A (.*) Activity Named (.*)$/i) do |course_activity_action, course_activity_type, course_activity_title|
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)

  ModifyACourseActivity(course_activity_action, course_activity_title)
  EditACourseActivity(course_activity_type)
  # #get course id from url
  # #course_id = $driver.current_url.split('/')[6]
  #
  # #check if activity exists, if not create activity
  # # AddANewSection(COURSE_ADD_A_SECTION_BTN_ID),SelectAnActivity(course_activity_type),CreateAnActivity(course_activity_type)
  #
  # case course_activity_type
  #   when "Acknowledgement"
  #     count = $daos.get_course_activity(course_id)
  #
  #   when "ELMO Module"
  #   when "ELMO Survey"
  #   when "Face-to-Face"
  #   when "Quiz"
  #   when "SCORM Package"
  #   when "File"
  #   when "Label"
  #   when "Page"
  #   when "Post"
  #   when "ELMO Survey (new)"
  # end
end


Then(/^I Should Be Able To (Create|Edit|Delete|Copy|Cancel) A Session In The Face-to-Face Activity$/i) do |modify_session_type|
  case modify_session_type
  when 'Create'
    ClickOnAButtonByXPath(F2F_SESSION_ADD_SESSION_BTN)
    AddSessionDetails()
    ClickOnSaveButton(SAVE_BTN_ID)
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))

  when 'Edit'
    ClickMenuOfFirstItemFromTable(LIST_DROPDOWN, F2F_SESSION_LIST_ACTION_ITEM_EDIT)
    EditSessionDetails()
    ClickOnSaveButton(SAVE_BTN_ID)
    PressConfirm()
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))

  when 'Delete'
    ClickMenuOfFirstItemFromTable(LIST_DROPDOWN, F2F_SESSION_LIST_ACTION_ITEM_DELETE)
    PressConfirm()
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_SUCCESSFUL_DELETION_VALUE))

  when 'Copy'
    ClickMenuOfFirstItemFromTable(LIST_DROPDOWN, F2F_SESSION_LIST_ACTION_ITEM_COPY)
    ClickOnOKButton(OK_BTN_ID)
    ClickOnSaveButton(SAVE_BTN_ID)
    Sleep_Until(PressConfirm())
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))

  when 'Cancel'
    ClickMenuOfFirstItemFromTable(LIST_DROPDOWN, F2F_SESSION_LIST_ACTION_ITEM_CANCEL)
    Sleep_Until(PressConfirm())
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_SUCCESSFUL_DELETION_VALUE))
  end
end


Then(/^I Should Be Able To Delete A Specific Section$/i) do
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  DeleteASection(SECTION_TRASH_ICON_ID)
end


Then(/^I Should Be Able To Add All Notifications$/i) do
  ClickOnASubTab(SUB_TAB_APPROVAL_NOTIFICATION_NAME_ID)
  CreateAllNotifications()
end


And(/^I Click On The Menu Of A Specific Course Named (.*)$/i) do |course_search_name|
  course_list_result = $daos.get_visible_course_list_by_name(course_search_name)
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, course_list_result, COURSE_SEARCH_BTN_ID)
  ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
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


And(/^I Have Enrolled For An Assigned quiz Course (.*)$/i) do |course_name|
  GoToCourseCatalogueSection(COURSE_CATALOGUE_LTEXT)
  SearchTheAssignedCourse(course_name)
  Sleep_Until(VerifyAnElementExistByCSS("span[title=\"#{course_name}\"]", course_name))
  WaitForAnElementByCSSAndTouch(CRS_REQUEST_BTN)
  sleep(2)
  WaitForAnElementByIdAndInputValue(CRS_RQST_ID, CRS_RQST_TXT)
  WaitForAnElementByIdAndTouch(CRS_REQUEST_SBMT)
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
  DeleteTheExistingCourseEnrolment('392')
  ReEnrolTheCandidateForCourse()
end


And(/^I (Edit|Delete) A Specific Face-to-Face Activity Named (.*)$/i) do |activity_action, f2f_activity_name|
  F2F_ACTIVITY_NAME = f2f_activity_name
  F2F_ACTIVITY_ACTION = activity_action
  ## TODO: Query DB for course ection. If found proceed with search else create section
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  ModifyACourseActivity(F2F_ACTIVITY_ACTION, F2F_ACTIVITY_NAME)
end


When(/^I Set (.*) Settings To (.*)$/i) do |label_name, label_value|
  CheckActivitySettings(label_name, label_value)
  ClickOnSaveButton(SAVE_BTN_ID)
  if label_name == 'Compulsory'
    Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID,SURVEY_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  else
    Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_SETTINGS_SAVE_VALUE))
  end
end


#TODO: Pending Review and removal
# Then(/^I Should Be Able To Save The Session with the Specified Settings$/i) do
#   ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
#   ModifyACourseActivity(F2F_ACTIVITY_NAME, F2F_ACTIVITY_TYPE)
#   VerifyFaceToFaceActivitySettings()
# end


When(/^I Leave Current Edit Page For List$/) do
  Sleep_Until(WaitForAnElementByXpathAndTouch(PRECEDING_BREAD_LIST_XPATH))
end


Then(/^I Should Edit The ([\s\w]+) .* Name And Description$/) do |edit_target|
  FillTitleAndDescriptionFieldAndSave(edit_target)
end


And(/^I Search For Created Course In The Scenario$/) do
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @unique_course_name, COURSE_SEARCH_BTN_ID)
end


And(/^I Change The Created Course Enrolment With (\w+) Being (\w+)$/) do |role_type, enrolled|
  HandleEnrolmentOfCourse(role_type, enrolled)
end


And(/^I Go To The Sections Of The Created Course$/) do
  WaitForAnElementByLinkTextAndTouch("Courses")
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @unique_course_name, COURSE_SEARCH_BTN_ID)
  ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
  ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
end


#### Quiz section Martinma123
#### ModifyQuizTitleDescription specific for quiz activity due to Save button duplicated
Then(/^I Should Edit The Quiz activity$/) do
  ModifyQuizTitleDescription()
end


And(/^I Verify That Default Settings For Quiz Is Correct$/) do
  VerifySettingsOfQuizActivity()
end


And(/^I Should Change Quiz Settings$/) do
  ChangeQuizSettings()
end


And(/^Modifying Settings Of Quiz Activity Is (\w+)$/) do |setting_ability|
  CheckAbilityToModifyQuizSettings(setting_ability)
end


Given(/^The Lock course with enrolments Is Configured To (Yes|No)$/i) do |elmo_config_option|
  steps %Q{
    Given I Have Logged In As A ELMO Admin
    And I go to Admin Settings
    And I Go To General Setup under General section
    And I Click On "ELMO Configuration" Tab
    When I Change "Lock course with enrolments" ELMO Configuration To "#{elmo_config_option}"
    Then  I Should Be Able To Save Configuration Details
        }
  $driver.quit
end


And(/^Courses Have User Enrolments$/i) do
  pending
end


When(/^I Search For A Course With Active User Enrolments$/i) do
  pending
end


Then(/^I Should Not Be Able To Delete Any Course Related Activities$/i) do
  pending
  #check that does not contain delete button for activities- //a[contains(@class,'del-activity')]
  #this doesnt work -> does not contain trash icon - //span[contains(@class,'glyphicon-trash')] since del section is hidden
  #check that does not contain delete section button - //a[contains(@class,'del-section')]
end


And(/^I Should Be Able To Only Add Non-Recordable Activities$/i) do
  pending
end


And(/^I Should Not Be Able To Add New Sections$/i) do
  pending
  # check that the page does not contain Add section button - WaitForAnElementByXpathAndTouch(course_add_a_section_btn_id))
  # check that the Sections tab has the lock symbol - //span[contains(@class,'glyphicon-lock')]
end


And(/^I Should Be Able To Only Edit Existing Activities For The Course$/i) do
  pending
end


And(/^I Edit The Course$/i) do
  pending
  #call the step - I Edit A Specific Course Named DO NOT DELETE
end


Then(/^I Should Be Able To (Edit|Delete) A Specific ELMO Survey Activity Named (.*)$/i) do |activity_type, survey_activity_name|
    SURVEY_ACTIVITY_NAME = survey_activity_name
    SURVEY_ACTIVITY_TYPE = activity_type
    ## TODO: Query DB for course activity. If found proceed with search else create activity
    ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
    ModifyACourseActivity(SURVEY_ACTIVITY_NAME, SURVEY_ACTIVITY_TYPE)
end

Given(/^A Company Admin Creates A New Course With Unique Name$/i) do
  steps %Q{
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
      }
end

And(/^I Open The Activity Named (.*) From The Sections List$/i) do |f2f_activity_name|
  step 'I Leave Current Edit Page For List'
  ClickOnFirstActivity(f2f_activity_name)
end

Then(/^I Should Be Able To Verify The Session Details As Per Created$/i) do
  Sleep_Until(WaitForAnElementByCSSAndTouch(F2F_SESSION_DROPDOWN_CSS))
  Sleep_Until(WaitForAnElementByCSSAndTouch(F2F_SESSION_DETAILS_CSS))
  VerifyColumnTextsMatchExpectedCSS(F2F_SESSION_DETAILS_COLUMN_CSS, FACE_TO_FACE_SESSION_VALUES)
  Sleep_Until(PressModalClose())
end

Then(/^I Should Be Able To Verify The Session Details As Per Copied$/i) do
  Sleep_Until(WaitForAnElementByCssAndTouchTheIndex(F2F_SESSION_DROPDOWN_CSS, 1))
  Sleep_Until(WaitForAnElementByCssAndTouchTheIndex(F2F_SESSION_DETAILS_CSS, 1))
  VerifyColumnTextsMatchExpectedCSS(F2F_SESSION_DETAILS_COLUMN_CSS, FACE_TO_FACE_SESSION_VALUES)
  Sleep_Until(PressModalClose())
end