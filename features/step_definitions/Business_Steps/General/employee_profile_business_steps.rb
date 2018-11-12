
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


Then(/^I Should Be Able To View Activity Sub-Tab$/i) do
  pending
  ##This requires logic change to determine the landing page as that one does not have a hyperlink
end


And(/^i should be able to click (.*) sub-tab$/i) do |sub_tab_name|

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


And(/^i search an employee named (.*)$/i) do |employee_name|
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
  element_id = '//tr[@data-url="/controlpanel/user-profile/'+@user_search[:user_id].to_s+'"]'
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


And(/^I Search For A User named ([\w\s]+)$/i) do |user_name|
  $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(user_name)
  Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
end


And(/^I View The User's Profile$/i) do
  ClickMenuOfFirstItemFromTable(SEARCH_RESULTS_ACTIONS_ID,"View Profile")
end


Then(/^I Should See That I Can Manage The Notes Added To The User$/i) do
  VerifyAnElementExists('xpath', NOTE_EDIT_BUTTON_ID)
  VerifyAnElementExists('xpath', NOTE_DEL_BUTTON_ID)
end


Then(/^I Should Not Be Able To See Notes Section$/i) do
  VerifyAnElementNotExist('id', 'notes-section')
end


And(/^I Set The Cost Centre From The Existing Cost Centres$/i) do
  sleep(2)
  Sleep_Until(WaitForAnElementByIdAndTouch(USER_COST_CENTRE_SELECT2_ID))
  $driver.find_elements(:class,SELECT2_DROPDOWN_ID)[5].send_keys('%')

  #waiting as making call to Elmo Payroll
  sleep(5)

  if ($driver.find_elements(:class, 'select2-no-results')[1].text == " No matches found")
    puts COLOR_YELLOW + "No Cost Centres exist in Elmo Payroll, hence cannot add cost centre for user".upcase
    skip_this_scenario
  end

  #selecting the first option from the results
  Sleep_Until(WaitForAnElementByClassAndTouch(SELECT2_DROPDOWN_RESULT_CLASS))
end


And(/^I Set The Position From The Existing Positions$/i) do
  sleep(2)
  Sleep_Until(WaitForAnElementByIdAndTouch(USER_POSITION_SELECT2_ID))
  $driver.find_elements(:class,SELECT2_DROPDOWN_ID)[5].send_keys('%')

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
  Sleep_Until(SelectDate(USER_DOB_FIELD_ID, date_of_birth))
end


