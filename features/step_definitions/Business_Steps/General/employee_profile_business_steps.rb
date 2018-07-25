
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


And(/^I Click On Add Note Button$/i) do
  Sleep_Until(WaitForAnElementByIdAndTouch(NOTE_SUBMIT_ID))
  @time_note_added = (DateTime.now).strftime "%d/%m/%Y %l:%M%p"
end


Then(/^I Should See That The Note Has Been Added Successfully$/i) do
  CheckNoteAdded()
end


And(/^I Enter Note$/i) do
  Sleep_Until(UseCkeditorToEnterText(USER_PROFILE_NOTE_TEXT, 0))
end


And(/^I Add An Attachment To The Note$/i) do
  Sleep_Until(browse_file_select(BROWSE_FILE_ID, FILE_NAME))
end


When(/^I Search For An Employee With Default Autopay Setting$/i) do
 user = $daos.get_employee_with_default_autopay()
 $driver.find_element(:id, 'userSearch_name').send_keys(user[:first_name]+ ' ' + user[:last_name])
 $driver.find_element(:xpath, "//button[@title='Search']").click
end

And(/^I Edit The User's Employment Details Section$/i) do
  $driver.find_element(:id, 'editSection-employmentDetail').click
  $driver.find_element(:id, 'autopay').selected? #== true -> Yes or No
  byebug
  $driver.execute_script("$(#{element_id}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
  # Sleep_Until(VerifyAnElementExistByXPath('//div[@class="bootbox-body"]','You have turned auto pay on, normal hours will be automatically added and process for this employee in Payroll. Would you like to continue?'))
  # $driver.find_element(:css, "[data-bb-handler='yes']").click
  # sleep 2
  # byebug
  # $driver.find_element(:id, 'save').click #name='save' ,Save
  # $driver.find_element(:xpath, "//h4[@class='modal-title']").text == "Confirm Employment Details Update"
  # byebug
  # $driver.find_element(:xpath, '//button[@data-bb-handler="success"]').click
  # sleep 2
  # $driver.find_element(:xpath, "//div[@id='autopay-label']//span").text == "Yes"
end


Then(/^I Can View The Default Autopay Setting As No$/i) do
  ClickMenuOfFirstItemFromTable("//table//button[@data-toggle='dropdown']","View Profile")
  Sleep_Until(ClickOnASubTab("//a[contains(text(),'Payment Details')]"))
  $driver.find_element(:xpath, "//div[@id='autopay-label']//span").text == "No"
end
