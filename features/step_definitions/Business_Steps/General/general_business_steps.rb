Given(/^I Have Logged In As A (.*)$/i) do |login_name|
  startWebDriver
  GoToSite()

  case login_name
  when "ELMO Setup Admin"
    begin
      GoToThePage(ADMIN_SETUP_LANDING_PAGE)
      EnterUsername(USER_NAME, ELMO_ADMIN_USERNAME)
      EnterPassword(PASS_WORD, ELMO_ADMIN_PASSWORD)

      loginToSystem(LOGIN_BUTTON)

      GoToThePage(ADMIN_SETUP_LANDING_PAGE)
      EnterUsername(USER_NAME, ELMO_SETUP_ADMIN_USERNAME)
      EnterPassword(PASS_WORD, ELMO_SETUP_ADMIN_PASSWORD)
      loginToSystem(LOGIN_BUTTON)
    end

  when "ELMO Super Admin"
    begin
      EnterUsername(USER_NAME, ELMO_SUPER_USERNAME)
      EnterPassword(PASS_WORD, ELMO_SUPER_PASSWORD)
    end

  when "ELMO Admin"
    begin
      EnterUsername(USER_NAME, ELMO_ADMIN_USERNAME)
      EnterPassword(PASS_WORD, ELMO_ADMIN_PASSWORD)
    end

  when "Company Admin"
    begin
      EnterUsername(USER_NAME, COMP_ADMIN_USERNAME)
      EnterPassword(PASS_WORD, COMP_ADMIN_PASSWORD)
      username = COMP_ADMIN_USERNAME
    end

  when "Contract Admin"
    begin
      EnterUsername(USER_NAME, COMP_ADMIN_USERNAME)
      EnterPassword(PASS_WORD, COMP_ADMIN_PASSWORD)
      username = COMP_ADMIN_USERNAME
    end

  when "Learning Admin"
    begin
      EnterUsername(USER_NAME, LEARNING_ADMIN_USERNAME)
      EnterPassword(PASS_WORD, LEARNING_ADMIN_PASSWORD)
      username = LEARNING_ADMIN_USERNAME
    end

  when "Recruitment Admin"
    begin
      EnterUsername(USER_NAME, RECRUITMENT_ADMIN_USERNAME)
      EnterPassword(PASS_WORD, RECRUITMENT_ADMIN_PASSWORD)
      username = RECRUITMENT_ADMIN_USERNAME
    end

  when "Leave Admin"
    begin
      EnterUsername(USER_NAME, LEAVE_COMPANY_ADMIN_USER)
      EnterPassword(PASS_WORD, LEAVE_COMPANY_ADMIN_PASS)
      username = LEAVE_COMPANY_ADMIN_USER
    end

  when "Company Manager"
    begin
      EnterUsername(USER_NAME, COMPANY_MANAGER_USER)
      EnterPassword(PASS_WORD, COMPANY_MANAGER_PASS)
      username = COMPANY_MANAGER_USER
    end

  when "Company Employee"
    begin
      EnterUsername(USER_NAME, COMPANY_EMPLOYEE_1_USER)
      EnterPassword(PASS_WORD, COMPANY_EMPLOYEE_1_PASS)
      username = COMPANY_EMPLOYEE_1_USER
    end

  when "Specific Automation User"
    begin
      EnterUsername(USER_NAME, DOC_USERNAME)
      EnterPassword(PASS_WORD, DOC_PASSWORD)
      username = DOC_USERNAME
    end

  when "Specific Automation User Manager"
    begin
      EnterUsername(USER_NAME, DOC_MANAGER_NAME)
      EnterPassword(PASS_WORD, DOC_MANAGER_PASSWORD)
      username = DOC_MANAGER_NAME
    end
  end

  #getting the userid based on the username and saving for later
  @user_id = $daos.get_userid(username)

  LogInAndWaitForTheDashboard(LOGIN_BUTTON, ADMIN_PROFILE_DROPDOWN) if login_name != "ELMO Setup Admin"
end


And(/^I go to Admin Settings$/i) do
  Sleep_Until(GoToAdminSettings(ADMIN_COG))
end


And(/^I Go To (.*) Under (.*) Section$/i) do |menu_type, menu_section|

  if menu_section == "Rewards"
    menu_section = "RewardsAdmin"
  elsif menu_section == "HR Core"
    menu_section = "HRCore"
  end

  begin
    $section_name = "//a[@href='#collapse#{menu_section}']"
    $item_name = "//span[contains(.,'#{menu_type}')]"
    Sleep_Until(GoToSection($section_name, $item_name))
    $add_user_type = "EMP" if menu_type.include? "Users"
    $add_user_type = "OB" if menu_type.include? "Onboarding"
  end
end


And(/^I Go To The (.*) Section$/i) do |menu_type|
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
        GoToNavBarSection(MENU_LEAVE_LINK)
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
        Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
        Sleep_Until(GoToNavBarSection(MENU_REPORTS_LINK))
        sleep (1)
      end
    end
  end
end


And(/^I Enter New User Details$/i) do
  CreateUsers(1)
end


Then(/^I Should Be Able To Add (.*) New Users In To The System$/i) do |total_number_of_users|
  $total = total_number_of_users.to_i
  AddUserDetails($total)
end


And(/^I Click On (.*) Sub Tab$/i) do |sub_tab_name|
  begin
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


When(/^I Click On (.*) Icon$/i) do |click_edit_icon|
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

#TODO: Pending removal after code review, merged with existing step
# And(/^I Click On Add (.*) Button$/i) do |add_contact_btn|
#   begin
#     case add_contact_btn
#     when "Emergency Contact Details"
#       begin
#         Sleep_Until(ClickOnASubTab(ADD_EM_CONTACT_BTN_ID))
#       end
#
#     when "Next Of Kin"
#       begin
#         Sleep_Until(ClickOnASubTab(ADD_NOK_CONTACT_BTN_ID))
#       end
#     end
#   end
# end


And(/^I Use Add (.*) Details$/i) do |add_contact_btn|
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


Then(/^I Should Be Able To Add (.*) Details$/i) do |contact_details|
  Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
  Sleep_Until(WaitForAnElementByXpathAndTouch(DONE_BTN_ID))
  sleep (1)
end


And(/^I Search For A Specific User Named (.*)$/i) do |username_search_value|
  $username_search_value = username_search_value
  UseActiveInactiveFilter() if USE_ACTIVE_INACTIVE_FILTER.to_i == 1
  search_for_an_employee_contract_and_verify(USERNAME_SEARCH_ID, $username_search_value, USERNAME_SEARCH_BTN, USERNAME_SEARCH_RESULT_VALUE)
end


Then(/^I Should Be Able To use (.*) Action on The Specific User$/i) do |specified_action|
  begin
    case specified_action

    when "De-activate user"
      begin
        ClickUserListActions(ACTION_DROPDOWN_CLASS_NAME, ACTION_DROPDOWN_INDEX_VALUE, ACTION_DROPDOWN_DEACTIVATE_VALUE)
        VerifyDeletedUser(INACTIVE_CLASS_ID, INACTIVE_ATTRIBUTE_ID, INACTIVE_ATTRIBUTE_TEXT)
      end

    when "Edit User Profile"
      begin
        ClickUserListActions(ACTION_DROPDOWN_CLASS_NAME, ACTION_DROPDOWN_INDEX_VALUE, ACTION_DROPDOWN_EDIT_VALUE)
      end
    end
  end
end


And(/^I Should Be Able To Go To (.*) tab$/i) do |profile_tab_name|
  ClickOnATab(profile_tab_name)
end


And(/^I Should Be Able To Fill In All Profile Related Information$/i) do
  pending
  # select_gender()
  # enter_preferred_name()
  # select_date_joined()
  # select_terminate_date()
  # select_employement_status()
  # select_date_of_birth()
  # enter_elders_id()
  # select_hay_grade()
  # select_employe()
end


And(/^I Should Be Able To Save The Information Successfully$/i) do
  ClickOnSaveButton(SAVE_BTN_ID)
end


##//TODO: Review and Remova due to redundancy. Method has been moved to the following one
# When(/^I Click On Add New User Button$/i) do
#   begin
#     case $add_user_type
#     when "EMP"
#       begin
#         GoToAddNewUsersPage(ADD_NEW_USER_BTN)
#       end
#
#     when "OB"
#       begin
#         GoToAddNewUsersPage(OB_ADD_NEW_USER_BTN)
#       end
#     end
#   end
# end


And(/^I Click On "([^"]*)" Button$/i) do |button_name|

  case button_name

  when "Create Filter"
    begin
      buttonxPath = "//button[contains(.,'#{button_name}')]"
      Sleep_Until($driver.find_elements(:xpath, buttonxPath).first.click)
    end

  when "Add New User"
    begin
      case $add_user_type
      when "EMP"
        begin
          GoToAddNewUsersPage(ADD_NEW_USER_BTN)
        end

      when "OB"
        begin
          GoToAddNewUsersPage(OB_ADD_NEW_USER_BTN)
        end
      end
    end

  when "Add Emergency Contact Details"
    begin
      Sleep_Until(ClickOnASubTab(ADD_EM_CONTACT_BTN_ID))
    end

  when "Add Next Of Kin"
    begin
      Sleep_Until(ClickOnASubTab(ADD_NOK_CONTACT_BTN_ID))
    end

  when "Add New Note"
    begin
      Sleep_Until(WaitForAnElementByIdAndTouch(ADD_NOTE_USERPROFILE_ID))
    end

  else
    begin
      buttonxPath = "//a[contains(.,'#{button_name}')]"
      Sleep_Until(WaitForAnElementByXpathAndTouch(buttonxPath))
    end

  end
end


Then(/^I Should (Be Able|Not Be Able) To Access The Onboarding User Setup In Onboarding Section$/i) do |access_type|
  if access_type == "Be Able"
    Sleep_Until(VerifyAnElementExists("xpath", ONBOARDING_USER_SETUP_ID))
    steps %Q{
    And I Go To Onboarding User Setup Under Onboarding Section
    }
    Sleep_Until(VerifyAnElementExists("xpath", ACTIVITY_RESUME_TAB_ID))
    Sleep_Until(VerifyAnElementExists("xpath", ONBOARDING_SETUP_TAB_ID))
  elsif access_type == "Not Be Able"
    Sleep_Until(VerifyAnElementNotExist("xpath", ONBOARDING_USER_SETUP_ID))
  end
end
