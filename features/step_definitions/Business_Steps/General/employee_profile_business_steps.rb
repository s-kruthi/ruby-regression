
Given(/^I Am On The Employee's Payment Details Section$/i) do
  startWebDriver
  GoToThePage(EMPLOYEE_PROFILE_PAGE)
  EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

When(/^I Try To View The Payment Details Of An Employee For A Particular Employment Type$/i) do
  GoToPaymentDetailsSectionOfAParticularEmployee(EMPLOYMENT_DETAILS_SECTION)
end

And(/^I Should Be Able To Unmask The Rate And Salary Details By Tapping The Show Button$/i) do
  UnmaskAndViewRateAndSalaryDetailsForTheEmployee()
end

When(/^I Try To View The TFN Details Of An Employee$/i) do
  GoToTaxFileNumberSectionOfAParticularEmployee(TFN_DETAILS_SECTION)
end

And(/^I Should Be Able To Unmask The TFN Number By Tapping The Show Button$/i) do
  UnmaskAndViewTaxFileNumberDetailsForTheEmployee()
end

And(/^I Should Be Able To Click "(.*)" Sub-Tab$/i) do |sub_tab_name|

  case sub_tab_name

    when "Activity"
      begin
        Sleep_Until(ClickOnASubTab(SUB_TAB_ACTIVITY_NAME_ID))
      end

    when "Resume"
      begin
        Sleep_Until(ClickOnASubTab(SUB_TAB_RESUME_NAME_ID))
      end

    when "My Career"
      begin
        Sleep_Until(ClickOnASubTab(SUB_TAB_MYCAREER_NAME_ID))
      end

    when "Personal Details"
      begin
        Sleep_Until(ClickOnASubTab(SUB_TAB_PERSONAL_NAME_ID))
      end

    when "Payment Details"
      begin
        Sleep_Until(ClickOnASubTab(SUB_TAB_PAYMENT_NAME_ID))
      end

    when "Recognition"
      begin
        Sleep_Until(ClickOnASubTab(SUB_TAB_RECOGNITION_NAME_ID))
      end
  end
end

And(/^I Search An Employee Named "(.*)"$/i) do |employee_name|
  search_for_input(SEARCH_EMPLOYEE_INPUT_ID, employee_name, SEARCH_EMPLOYEE_BTN_ID)
  click_on_search_result(SEARCH_EMPLOYEE_LIST_CLASS)
end

Then(/^i should be able to view the employee profile for (.*) and verify email address (.*)$/i) do |employee_name, employee_email|
  verify_employee_profile(employee_name, employee_email)
end

And(/^I Set The Note Visibility To (.*)$/i) do |visibility_value|
  SetNoteVisibility(visibility_value)
end

And(/^I Click On (Add|Save) Note Button$/i) do |action|
  Sleep_Until(WaitForAnElementByIdAndTouch(NOTE_SUBMIT_ID))
  time_note_added = DateTime.now.strftime('%s').to_i
  @time_note_added = Time.at(time_note_added).strftime "%d/%m/%Y %-l:%M%p"
end

Then(/^I Should See That The Note Has Been (Added|Edited) Successfully$/i) do |action|
  CheckNoteAdded(action)
end

And(/^I Enter Note$/i) do
  Sleep_Until(UseCkeditorToEnterText(USER_PROFILE_NOTE_TEXT, 0))
end

And(/^I Add An Attachment To The Note$/i) do
  Sleep_Until(BrowseFileSelect(BROWSE_FILE_ID, FILE_NAME))
end

When(/^I Search For An Employee With Default Autopay Setting$/i) do
  SearchForUserWithDefaultAutopaySetting()
end

And(/^I Edit The User's Employment Details Section$/i) do
  #ensuring that the searched user is clicked
  if !@user_search.nil?
    element_id = '//tr[@data-url="/controlpanel/user-profile/' + @user_search[:user_id].to_s + '"]'
  else
    element_id = USER_SEARCHRESULT_ROW_ID
  end
  Sleep_Until(ClickElement('xpath', element_id))

  Sleep_Until(ClickOnASubTab(USER_PAYMENT_DETAILS_TAB_ID))
  Sleep_Until(WaitForAnElementByIdAndTouch(USER_PAYMENT_DETAILS_EDIT_BUTTON_ID))
end

Then(/^I Can View The Default Autopay Setting As (Yes|No)$/i) do |setting_value|
  #ensuring that the searched user is clicked
  element_id = '//tr[@data-url="/controlpanel/user-profile/'+@user_search[:user_id].to_s+'"]'
  Sleep_Until(ClickElement('xpath', element_id))

  Sleep_Until(ClickOnASubTab(USER_PAYMENT_DETAILS_TAB_ID))
  CheckAutopaySetting(setting_value)
end

When(/^I Search For An Employee With Employment Details$/i) do
  SearchForUserWithEmpDetails()
end

And(/^I Set The Autopay Setting As (Yes|No)$/i) do |setting_value|
  SetAutopay(setting_value)
end

Then(/^I Should Be Displayed With Autopay Message$/i) do
  Sleep_Until(VerifyAnElementExistByXPath(USER_PAYMENT_DETAILS_AUTOPAY_MODAL_ID, USER_PAYMENT_DETAILS_AUTOPAY_MSG))
end

Then(/^I Should Be Able To See The Autopay Setting Changed To (Yes|No)$/i) do |setting_value|
  CheckAutopaySetting(setting_value)
end

And(/^I Save The Payment Details Changes For Autopay$/i) do
  SaveAutopayChanges()
end

When(/^I (Edit|Delete) Note Added By Me$/i) do |action|
  Sleep_Until(WaitForAnElementByIdAndTouch(NOTES_SECTION_ID))
  if action == "Edit"
    EditNote()
  else
    DeleteNote()
  end
end

Then(/^I Should See That The Note Has Been Deleted Successfully$/i) do
  VerifyDeletionOfNote()
end

And(/^I Search For A User Named "([\w\s]+)"$/i) do |user_name|
  $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(user_name)
  Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
end

And(/^I View The User's Profile$/i) do
  ClickMenuOfFirstItemFromTable(SEARCH_RESULTS_ACTIONS_ID, "View Profile")
end

Then(/^I Should See That I Can Manage The Notes Added To The User$/i) do
  VerifyAnElementExists('xpath', NOTE_EDIT_BUTTON_ID)
  VerifyAnElementExists('xpath', NOTE_DEL_BUTTON_ID)
end

Then(/^I Should Not Be Able To See Notes Section$/i) do
  VerifyAnElementNotExist('id', NOTES_SECTION_ID)
end

And(/^I Set The Cost Centre From The Existing Cost Centres$/i) do
  sleep(2)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(USER_COST_CENTRE_SELECT2_ID, '%'))

  #waiting as making call to Elmo Payroll
  sleep(5)

  if ($driver.find_elements(:class, 'select2-no-results')[1].text == " No matches found")
    puts COLOR_YELLOW + "no cost centres exist in Elmo Payroll, hence cannot add cost centre for user".upcase
    skip_this_scenario
  end

  #selecting the first option from the results
  Sleep_Until(WaitForAnElementByClassAndTouch(SELECT2_DROPDOWN_RESULT_CLASS))
end

And(/^I Set The Position From The Existing Positions$/i) do
  sleep(3)
  # Sleep_Until(WaitForAnElementByIdAndTouch(USER_POSITION_SELECT2_ID))
  Sleep_Until(WaitForAnElementByIdAndTouch(USER_POSITION_FIELD_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(USER_POSITION_SELECT2_ID, '%'))

  #waiting to get all the positions loaded in the dropdown
  sleep(5)

  #get count of positions table
  positions_count = $daos.get_count_enabled_positions()

  if positions_count[:count] == 0
    if ($driver.find_elements(:class, 'select2-no-results')[1].text == " No matches found")
     puts COLOR_YELLOW + "No Positions exist, hence cannot set the position for user"
     skip_this_scenario
    end
  else
    #search results should be equal to count
    expect($driver.find_elements(:class,SELECT2_DROPDOWN_RESULT_CLASS).size).to eq(positions_count[:count])

    #selecting the first option from the results
    Sleep_Until(WaitForAnElementByClassAndTouch(SELECT2_DROPDOWN_RESULT_CLASS))
  end
end

And(/^I Set The Date of Birth As (\d{1,2}\/\d{1,2}\/\d{4})$/i) do |date_of_birth|
  steps %Q{
                  And   I Click On "Details" Tab
  }
  Sleep_Until(SelectDate(USER_DOB_FIELD_ID, date_of_birth))
end

When(/^I Search For An Employee With No Leave Policy$/i) do
  SearchForEmpWithNoLeavePolicy()
end

When(/^I Search For An Employee Associated With Single\/No Cost Centre$/i) do
  SearchForEmpNoCostCentre()
end

Then(/^I Should See The Placeholder For No Leave Policy$/i) do
  VerifyPlaceholder()
end

Then(/^I Should Be Able To Assign Leave Policy For The User$/i) do
  @leave_policy = $daos.get_nondefault_leave_policy()

  SetLeavePolicy(@leave_policy)

  Sleep_Until(WaitForAnElementByIdAndTouch(USER_PAYMENT_DETAILS_SAVE_ID))

  puts COLOR_GREEN + ("Assigned the Leave policy:" + @leave_policy + " to user:").upcase + @user_search[:first_name] + " " + @user_search[:last_name] +
           (" having user id: ").upcase + @user_search[:user_id].to_s
end

And(/^I Edit The User's Profile$/i) do
  EditUserProfile()
end

Then(/^I Should Be Able To Associate (\d+) Cost Centres To The User$/i) do | num_cost_centres |
  AssociateCostCentre(num_cost_centres)
end

And(/^I Should Be Able To Assign Split Percent Values For The Cost Centres$/i) do
  AssignCostCentreVal()
  ClickOnSaveButton(SAVE_BTN_ID)
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, USER_PROFILE_UPDATE_SUCCESS_MSG_VALUE))
end

And(/^I Associate (\d+) Cost Centres To The User$/i) do | num_cost_centres |
  steps %{
        Then  I Should Be Able To Associate #{num_cost_centres} Cost Centres To The User
  }
end

And(/^I Assign The Split Percent Values For The Cost Centres As ([0-9]*.[0-9]+) And ([0-9]*.[0-9]+)$/i) do | split_val1, split_val2 |
  AssignSplitVal(split_val1, split_val2)
end

Then(/^I Should Be Able To See The Error Message When Split % Does Not Sum Upto 100$/i) do
  ClickOnSaveButton(SAVE_BTN_ID)
  VerifyErrorAlertMessage(VERIFY_ALERT_ID, USER_PROFILE_UPDATE_ERR_MSG_VALUE)
  VerifyCostCentreSplitValErrMsg('sum_err')
end

Then(/^I Should Be Able To See The Error Message When Split % Are Decimal Values$/i) do
  ClickOnSaveButton(SAVE_BTN_ID)
  VerifyErrorAlertMessage(VERIFY_ALERT_ID, USER_PROFILE_UPDATE_ERR_MSG_VALUE)
  VerifyCostCentreSplitValErrMsg('decimal_err')
end

And(/^I Should Be Able To Click "([\w\s]+)" Sub-Tab Of Employee$/i) do | sub_tab_name |
  if sub_tab_name == 'Recognition'
    Sleep_Until(WaitForAnElementByXpathAndTouch((EMP_RECOGNITION_SUB_TAB_ID)))
  else
    if sub_tab_name.count(" ") > 0 then sub_tab_name = sub_tab_name.gsub(/\s/,'-') end
    identifier = sub_tab_name.downcase + "-tab"
    Sleep_Until(WaitForAnElementByIdAndTouch((identifier)))
  end
end
