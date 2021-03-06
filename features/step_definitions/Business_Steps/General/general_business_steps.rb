Given(/^I Have Logged (In|Out)(:? As A? (.*))?$/i) do |login_action, login_name|
  case login_action
    when "In"
      startWebDriver
      
      GoToSite()
      
      login_details = GetLoginDetails(login_name)
      
      @username = login_details[0]
      @user_pwd = login_details[1]
      
      if login_name == "ELMO Setup Admin"
        GoToThePage(ADMIN_SETUP_LANDING_PAGE)
        EnterUsername(USER_NAME, ELMO_ADMIN_USERNAME)
        EnterPassword(PASS_WORD, ELMO_ADMIN_PASSWORD)
        loginToSystem(LOGIN_BUTTON)
        GoToThePage(ADMIN_SETUP_LANDING_PAGE)
      end
      EnterLoginDetails(@username, @user_pwd)
      VerifyUserExists(@username) if login_name != "ELMO Setup Admin"
      LogInAndWaitForTheDashboard(LOGIN_BUTTON, ADMIN_PROFILE_DROPDOWN)
    
    when "Out"
      begin
        nav_menu = $daos.get_nav_menu_setting()
        if nav_menu[:value] == '1'
          USER_PROFILE_MENU_ICON_ID = USER_PROFILE_VERTICALMENU_ICON_ID
        end
        LogOutFromTheDashboard(USER_PROFILE_MENU_ICON_ID, LOGOUT_BUTTON_ID)
      end
  end
end

And(/^I Go To Admin Settings$/i) do
  Sleep_Until(GoToAdminSettings())
end

And(/^I Go To "(.*)" Under "(.*)" Section$/i) do |menu_type, menu_section|
  
  if menu_section == "Rewards"
    menu_section = "RewardsAdmin"
  elsif menu_section == "HR Core"
    menu_section = "HRCore"
  elsif menu_section == "Leave Management"
    menu_section = "LeaveAdmin"
  end
  
  begin
    $section_name = "//a[@href='#collapse#{menu_section}']"
    $item_name = "//span[contains(.,'#{menu_type}')]"
    Sleep_Until(GoToSection($section_name, $item_name))
    $add_user_type = "EMP" if menu_type.include? "Users"
    $add_user_type = "OB" if menu_type.include? "Onboarding"
  end
end

And(/^I Go To The "(.*)" Section$/i) do |menu_type|
  begin
    case menu_type
      
      when "Contracts"
        begin
          goToClientContractsTab(CLIENT_CONTRACTS_TAB)
        end
      
      when "Menu Profile"
        begin
          GoToNavBarSection(MENU_PROFILE_LINK)
        end
      
      when "Menu My Team"
        begin
          GoToNavBarSection(MENU_MY_TEAM_LINK)
        end
      
      when "Menu Learning"
        begin
          GoToNavBarSection(MENU_LEARNING_LINK)
        end
      
      when "Menu Leave"
        begin
          Sleep_Until(GoToNavBarSection(MENU_LEAVE_LINK))
          sleep (2)
        end
      
      when "Menu Payroll"
        begin
          GoToNavBarSection(MENU_PAYROLL_LINK)
        end
      
      when "Menu Documents"
        begin
          GoToNavBarSection(MENU_DOCUMENTS_LINK)
        end
      
      when "Menu Performance"
        begin
          GoToNavBarSection(MENU_PERFORMANCE_LINK)
        end
      
      when "Menu Recruitment"
        begin
          GoToNavBarSection(MENU_RECRUITMENT_LINK)
        end
      
      when "Menu Careers"
        begin
          GoToNavBarSection(MENU_CAREERS_LINK)
        end
      
      when "Menu Calendar"
        begin
          GoToNavBarSection(MENU_CALENDER_LINK)
        end
      
      when "Menu Contracts"
        begin
          Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
          Sleep_Until(GoToNavBarSection(MENU_CONTRACTS_LINK))
          sleep (1)
        end
      
      when "Menu Succession"
        begin
          Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
          Sleep_Until(GoToNavBarSection(MENU_SUCCESSION_LINK))
          sleep (1)
        end
      
      when "Menu Reports"
        begin
          # Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
          Sleep_Until(GoToNavBarSection(MENU_REPORTS_LINK))
          sleep (1)
        end
    end
  end
end

Then(/^I Should Be Able To Add "(\d+)" New "(Non-ELMO|ELMO)" Users With "(.*)" As First Name And "(.*)" As Last Name(:? And "([^"]*)" As Manager)?$/i) do |arg1, arg2, arg3, arg4, arg5|
  i = 1
  while i <= arg1 do
    begin
      
      #Value of $add_user_type derived from Step 'I Go To "(.*)" Under "(.*)" Section' since Users and Onboarding users take different path. Email = firstname.lastname@email_suffix
      @@first_name = arg3
      @@last_name = arg4 + Time.now.strftime("%Y%m%d%H%M%S") if $add_user_type == "EMP"
      @@last_name = arg4 + ".ob." + Time.now.strftime("%Y%m%d%H%M%S") if $add_user_type == "OB"
      @@user_name = @@first_name + "." + @@last_name
      @@email_address = @@user_name + NEW_USER_DETAILS_MAP[:email_suffix_value]
      NEW_USER_DETAILS_MAP[:employee_number_value] = "EMP" + Time.now.strftime("%Y%m%d%H%M%S").to_s
    
      #Check if user already exists in the database or not. If exists, skip the current creation and continue with the loop. Else, create the user
      user_list_result = $daos.get_userid(@@user_name)
      if !user_list_result.nil?
        puts COLOR_YELLOW + "User #{user_list_result} already exists in the database. Creating next user".upcase
        $user_found = 1
        next
      else
        $user_found = 0
        begin
          CreateUsers(arg2, @@first_name, @@last_name, arg5, NEW_USER_DETAILS_MAP[:start_date_value])
        
          #Case used to click on different buttons since Users click on 'Add New User' and Onboarding users click on 'New Onboarding User' button
          case $add_user_type
            when "EMP"
              #The following steps help set the role type as well immediately after creating the user within the loop. Change the value to 'Manager' for manager Roletype or others
              steps %Q{
                  And   I Click On "Role" Tab
                  And   I Select "Role" Classic Dropdown As "Employee"
                  }
              Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_NAV_LINK)) unless i >= arg1
              Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_NEW_USER_BTN)) unless i >= arg1
            when "OB"
              Sleep_Until(WaitForAnElementByXpathAndTouch(OB_USER_NAV_LINK)) unless i >= arg1
              Sleep_Until(WaitForAnElementByXpathAndTouch(OB_ADD_NEW_USER_BTN)) unless i >= arg1
          end
        end
        i = i + 1
      end
    end
  end
  puts COLOR_YELLOW + "All users to be created are already existing. Scenario has been skipped".upcase if $user_found == 1

#Skip the rest of the scenario since it's no longer valid
  skip_this_scenario if $user_found == 1
end

Then(/^I Should Be Able To Add A New "(Non-ELMO|ELMO)" User With "(.*)" As First Name And "(.*)" As Last Name(:? And "([^"]*)" As Manager)?(:? And "([^"]*)" As Role)?$/i) do |arg1, arg2, arg3, arg4, arg5|
  CreateAUser(arg1, arg2, arg3, arg4, arg5)
end

Given(/^I Have Logged In As (An Employee|Vendor) Using The Username "(.*)" And Password "(.*)"$/i) do |user_type, user_name, user_pwd|
  @username = user_name
  @user_pwd = user_pwd
  
  if user_type == 'Vendor'
    @vendor_login = 1
  end
  
  steps %{And I Have Logged In As A #{user_type}}
end


Given(/^I Have Created A New User$/i) do
  user_first_name = 'payroll_auto' + Time.now.strftime("%Y%m%d%H%M%S")
  steps %Q{
        Given I Have Logged In as a Payroll Admin
        And   I Go To Admin Settings
        And   I Go To "Users" Under "General" Section
        When  I Click On "Add New User" Button
        Then  I Should Be Able To Add A New "Non-ELMO" User With "#{user_first_name}" As First Name And "test" As Last Name}
end

And(/^I Click On "(.*)" Sub Tab$/i) do |sub_tab_name|
  begin
    #Since these are derived using href, case is used to differentiate between specific ones
    case sub_tab_name
      when "Personal Details"
        begin
          Sleep_Until(ClickOnASubTab(SUB_TAB_PERSONAL_NAME_ID))
        end
      
      when "Payment Details"
        begin
          Sleep_Until(ClickOnASubTab(SUB_TAB_PAYMENT_NAME_ID))
        end
    end
  end
end

When(/^I Click On "(.*)" Icon$/i) do |click_edit_icon|
  begin
    case click_edit_icon
      when "Edit Emergency Contact Details"
        begin
          Sleep_Until(ClickOnASubTab(EDIT_EM_CONTACT_BTN_ID))
        end
      
      when "Edit Next Of Kin"
        begin
          Sleep_Until(ClickOnASubTab(EDIT_NOK_CONTACT_BTN_ID))
        end
    end
  end
end

And(/^I Use Add "(.*)" Details$/i) do |add_contact_btn|
  begin
    case add_contact_btn
      when "Emergency Contact"
        begin
          Sleep_Until(ClickOnASubTab(ADD_EM_CONTACT_BTN_ID))
          Sleep_Until(EnterUserDetails(EM_USER__NAME_ID, EM_USER__NAME_VALUE))
          Sleep_Until(EnterUserDetails(EM_USER_RELATIONSHIP_ID, EM_USER_RELATIONSHIP_VALUE))
          Sleep_Until(EnterUserDetails(EM_USER_ADDRESS_ID, EM_USER_ADDRESS_VALUE))
          Sleep_Until(WaitForAnElementByIdAndInputValue(EM_USER_MOBILE_ID, EM_USER_MOBILE_VALUE))
          Sleep_Until(EnterUserDetails(EM_USER_EMAIL_ID, EM_USER_EMAIL_VALUE))
          Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
        end
      
      when "Next Of Kin"
        begin
          Sleep_Until(ClickOnASubTab(ADD_NOK_CONTACT_BTN_ID))
          Sleep_Until(EnterUserDetails(EM_USER__NAME_ID, EM_USER__NAME_VALUE))
          Sleep_Until(EnterUserDetails(EM_USER_RELATIONSHIP_ID, EM_USER_RELATIONSHIP_VALUE))
          Sleep_Until(EnterUserDetails(EM_USER_ADDRESS_ID, EM_USER_ADDRESS_VALUE))
          Sleep_Until(WaitForAnElementByIdAndInputValue(EM_USER_MOBILE_ID, EM_USER_MOBILE_VALUE))
          Sleep_Until(EnterUserDetails(EM_USER_EMAIL_ID, EM_USER_EMAIL_VALUE))
        end
    end
  end
end

Then(/^I Should Be Able To Add "(.*)" Details$/i) do |contact_details|
#  Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
  Sleep_Until(WaitForAnElementByXpathAndTouch(DONE_BTN_ID))
  sleep(1)
end

And(/^I Search For A Specific User Named (.*)$/i) do |username_search_value|
  @username_search_value = username_search_value
  UseActiveInactiveFilter() if USE_ACTIVE_INACTIVE_FILTER.to_i == 1
  @username_search_result_value = "//td[contains(.,'#{username_search_value}@elmodev.com')]"
  search_for_an_employee_contract_and_verify(USERNAME_SEARCH_ID, username_search_value, USERNAME_SEARCH_BTN, @username_search_result_value)
end

Then(/^I Should Be Able To Use "(.*)" Action On The Specific User$/i) do |specified_action|
  begin
    case specified_action
      
    when "De-activate User"
      #need to check epms_config for enableTerminateUser to be 0
        begin
          Sleep_Until(ClickUserListActions(SEARCH_RESULTS_ACTIONS_ID, ACTION_DROPDOWN_INDEX_VALUE, ACTION_DROPDOWN_DEACTIVATE_VALUE))
          VerifyUserDeactivated()

          # set user back to active
          SetUserActive(@username_search_value)
          # VerifyDeletedUser(INACTIVE_CLASS_ID, INACTIVE_ATTRIBUTE_ID, INACTIVE_ATTRIBUTE_TEXT)
        end
      
    when "Edit User Profile"
        begin
          ClickUserListActions(SEARCH_RESULTS_ACTIONS_ID, 0, ACTION_DROPDOWN_EDIT_VALUE)
        end
    end
  end
end

And(/^I Should Be Able To Go To (.*) tab$/i) do |profile_tab_name|
  ClickOnATab(profile_tab_name)
end

And(/^I Should Be Able To Fill In All Profile Related Information$/i) do
  EnterUserProfileDetails()
end

And(/^I Should Be Able To Save The Information Successfully$/i) do
  ClickOnSaveButton(SAVE_BTN_ID)
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, EDIT_USER_PROFILE_SAVE_SUCCESS_VALUE))
end

Then(/^I Should (Be Able|Not Be Able) To Access The Onboarding User Setup In Onboarding Section$/i) do |access_type|
  if access_type == "Be Able"
    Sleep_Until(VerifyAnElementExists("xpath", ONBOARDING_USER_SETUP_ID))
    steps %Q{
    And I Go To "Onboarding User Setup" Under "Onboarding" Section
    }
    Sleep_Until(VerifyAnElementExists("xpath", ACTIVITY_RESUME_TAB_ID))
    Sleep_Until(VerifyAnElementExists("xpath", ONBOARDING_SETUP_TAB_ID))
  elsif access_type == "Not Be Able"
    Sleep_Until(VerifyAnElementNotExist("xpath", ONBOARDING_USER_SETUP_ID))
  end
end

And(/^I Click On "([^"]*)" Breadcrumb Menu$/i) do |arg|
  breadcrumb_xpath = "//a[contains(.,'#{arg}')]"
  Sleep_Until(WaitForAnElementByXpathAndTouch(breadcrumb_xpath))
end

Then(/^I Should Be Able to (Notify|Activate) All Users$/i) do |action|
  Sleep_Until(PressConfirm())
  
  if $add_user_type == 'EMP'
    onboarding = 0
  else
    onboarding = 1
  end
  
  #get count of users that need to be activated
  count_users_tobeactivated = $daos.get_count_userstobeactivated(onboarding)
  
  #confirm background process when users are more than 4
  if count_users_tobeactivated[:count] >= 4
    $driver.find_elements(:xpath, BACKGRNDPROCESS_CONFIRM_ID).last.click
    
    #waiting for background process to complete
    sleep(5)
  end
  
  if action == 'Notify'
    VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, USER_NOTIFY_SUCCESS_MSG_VALUE)
  else
    VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, USER_ACTIVATE_SUCCESS_MSG_VALUE)
  end
end

Then(/^I Should See That The Default Entity Is Set For the User's Company Field$/i) do
  default_legal_entity = $daos.get_default_entity_details()
  sleep(2)
  field_value = $driver.find_element(:id, USER_LEGAL_ENTITY_FIELD_ID).text
  
  #comparing the value from the db with the page
  expect(field_value.split("\n")[0]).to eq(default_legal_entity[:business_name])
  puts COLOR_GREEN + "User is set with the default legal entity for company field".upcase
end

And(/^I Click On The Profile Tab Of The([^\"]*) User$/i) do |user_type|
  Sleep_Until(WaitForAnElementByXpathAndTouch(USER_PROFILE_TAB_ID))
end

When(/^I Choose To Edit An Existing User's Profile$/i) do
  steps %{Then I Should Be Able To Use "Edit User Profile" Action On The Specific User}
end

Then(/^I Can See That I Can Choose To Set The Company Legal Entity From The Existing Entities$/i) do
  # get count from legal entity table
  legal_entity = $daos.get_count_active_legal_entity()
  
  Sleep_Until(WaitForAnElementByIdAndTouch(USER_LEGAL_ENTITY_FIELD_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(USER_LEGAL_ENTITY_SELECT2_ID, '%'))
  sleep(4)
  
  # search results should be equal to count
  expect($driver.find_elements(:class, SELECT2_DROPDOWN_RESULT_CLASS).size).to eq(legal_entity[:count])
end

Then(/^I Should See The Cost Centre Field$/i) do
  Sleep_Until(VerifyAnElementExists('id', USER_COST_CENTRE_FIELD_ID))
end

And(/^I Can See That I Choose To Set The Cost Centre From The Existing Cost Centres$/i) do
  sleep(2)
  
  Sleep_Until(WaitForAnElementByXpathAndInputValue(USER_COST_CENTRE_SELECT2_ID, '%'))
  
  #wait as making call to Elmo Payroll
  sleep(5)
  
  result_count = $driver.find_elements(:class, SELECT2_DROPDOWN_RESULT_CLASS).size
  if result_count > 0
    expect($driver.find_elements(:class, SELECT2_DROPDOWN_RESULT_CLASS).size).to be > 0
  else
    puts COLOR_BLUE + "No Cost Centres Found, please check ELMO Payroll for cost codes manually"
    skip_this_scenario
  end
end

When(/^I Edit "(.*)" Details$/i) do |contact_type|
  Sleep_Until(ClickOnASubTab(USER_PERSONAL_DETAILS_TAB_ID))
  EditContactDetails(contact_type)
end

Then(/^I Can See The Suburb\/Town\/City Field$/i) do
  CheckFieldInPersonalDetails()
end

And(/^The Necessary User Fields Are Setup$/i) do
  UserProfileSetupThroughJmeter()
end
