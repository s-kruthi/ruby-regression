And(/^I Can View The (.*) Named (.*)$/i) do | link_type, link_name |
  case link_type
    when "Learning Course"
      begin
        ClickOnFirstActivity(link_name)
      end
    
    else
      begin
        ClickOnLinkByText("//span[contains(.,'#{link_name}')]")
      end
  end
end

Then(/^I Should Be Able To "(Sign Up|Withdraw)" For That Session$/i) do |self_session_action|
  case self_session_action
    when "Sign Up"
      begin
        Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_SIGNUP_BUTTON_ID))
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_SIGNUP_SUCCESS_VERIFY_MSG))
      end
    
    when "Withdraw"
      begin
        Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_WITHDRAW_BUTTON_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_WITHDRAW_MSG_ID, F2F_SESSION_WITHDRAW_MSG_VALUE))
        Sleep_Until(PressConfirm())
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_WITHDRAW_SUCCESS_VERIFY_MSG))
      end
  end
end

And(/^I Enter CPD "([^"]*)" Details$/) do |arg|
  case arg
    when "New Category"
      EnterInputFieldText(CPD_CATEGORY_TITLE_ID, CPD_CATEGORY_TITLE_VALUE)
      EnterDescriptionText(CPD_CATEGORY_DESC_TXT_VALUE, 0)
    
    when "New Plan"
      EnterInputFieldText(CPD_PLAN_TITLE_ID, CPD_PLAN_TITLE_VALUE)
      EnterDescriptionText(CPD_PLAN_DESC_TXT_VALUE, 0)
      EnterStartDate(CPD_PLAN_START_DATE_ID, CPD_PLAN_START_DATE)
      EnterEndDate(CPD_PLAN_END_DATE_ID, CPD_PLAN_END_DATE)
      EnterInputFieldText(CPD_PLAN_POINTS_REQ_ID, CPD_PLAN_POINTS_REQ_VALUE)
  end
end

And(/^I Select CPD "(Category|Plan)" Named "([^"]*)"$/) do |arg1, arg2|
  case arg1
    when "Category"
      cpd_category_name_result = $daos.get_visible_cpd_category_by_name(arg2)
      if !cpd_category_name_result.nil?
        puts COLOR_BLUE + "Using CPD Plan '#{cpd_category_name_result[:name]}' with ID #{cpd_category_name_result[:id]}"
        SelectFromDropdown(CPD_PLAN_CATEGORY_DROPDOWN_ID, "#{cpd_category_name_result[:name]}")
      
      else
        puts COLOR_YELLOW + "CPD Category not found. Please check the database manually".upcase
        skip_this_scenario
      end
  
    when "Plan"
      cpd_plan_name_result = $daos.get_visible_cpd_plan_by_name(arg2)
      if !cpd_plan_name_result.nil?
        puts COLOR_BLUE + "Using CPD Plan '#{cpd_plan_name_result[:name]}' with ID #{cpd_plan_name_result[:id]}"
        SelectFromDropdown(CPD_PLAN_CATEGORY_DROPDOWN_ID, "#{cpd_plan_name_result[:name]}")
  
      else
        puts COLOR_YELLOW + "CPD Plan not found. Please check the database manually".upcase
        skip_this_scenario
      end
  end
end

Then(/^I Should Be Able To Add CPD "([^"]*)" Successfully$/i) do |arg|
  case arg
    when "New Category"
      ClickOnSaveButton(SAVE_BTN_ID)
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CPD_CATEGORY_SAVE_SUCCESS_TXT)
    
    when "New Plan"
      ClickOnSaveButton(SAVE_BTN_ID)
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CPD_PLAN_SAVE_SUCCESS_TXT)
  end
end

And(/^I Go To The Face To Face Session Of The Course$/i) do
  steps %{
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Search For The Randomly Created Course
  }
  ClickLinkButtonWithName('Edit')
  ClickOnATab('Sections')
  WaitForAnElementByPartialLinkTextAndTouch(SERVICE_FACE_TO_FACE_SESSION_NAME)
end

When(/^I Go To The Attendance Of The Session$/i) do
  ClickLinkButtonWithName('Attendance')
end

When(/^I Go To Attendance Page From Bulk Signup$/) do
  WaitForAnElementByPartialLinkTextAndTouch('Attendance')
end

Then(/^I Should Bulk Sign Up Users On Page$/i) do
  WaitForAnElementByPartialLinkTextAndTouch('Bulk Sign Up')
  @selected_user_amount = 5
  Sleep_Until(SelectUsersPage(@selected_user_amount))
  Sleep_Until(WaitForAnElementByIdAndTouch('enrol-btn'))
  PressConfirm()
  # The sleep to wait for the AJAX progress bar to finish
  sleep(20)
  VerifyCheckboxSelectedByCSS('.add-user', @selected_user_amount, 'user signup')
end

Then(/^I Should Bulk Sign Up All Users$/i) do
  before_enrol_num = GetNumberFromPagination()
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch('Bulk Sign Up'))
  Sleep_Until(WaitForAnElementByIdAndTouch('enrol-all-btn'))
  Sleep_Until(PressConfirm())
  # Wait 10 seconds for enrol all users processing
  sleep(10)
  # Wait for Bulk Enrol all user before cancel
  Sleep_Until(WaitForAnElementByCSSAndTouch('button[data-action="cancel"]'))
  # The sleep to wait for the AJAX progress bar to finish
  sleep(2)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch('Attendance'))
  after_enrol_num = GetNumberFromPagination()
  VerifyNumberChange(before_enrol_num, after_enrol_num, 'increase')
end

Then(/^I Should Bulk Mark Attendance All Users$/i) do
  BulkMarkFaceToFaceSessionAttendance('Fully Attended', 90, 'yes')
end

Given(/^That Session Is Created For A Face-to-Face Activity$/i) do
  steps %Q{
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Click On The New Course Button
    And   I Add New Course Details
    Then  I Should Be Able To Create A New Course
    Then  I Should Be Able To Add A "Face-to-Face" Activity
    And   I Open The Activity Named Test Face-to-Face On Sections List Page After Editing
    Then  I Should Be Able To "Create" A Session In The Face-to-Face Activity
    And   I Have Logged Out
  }
end
