Given(/^I Have Logged (In|Out)(:? As A? (.*))?$/i) do |login_action, login_name|
  case login_action
    when "In"
      startWebDriver
      GoToSite()
      
      begin
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
              username = ELMO_ADMIN_USERNAME
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
        if !@user_id.nil?
          puts COLOR_BLUE + "Id: '#{@user_id[:id]}', Username: #{@user_id[:username]}, is_elmo: '#{@user_id[:is_elmo]}', is_notified: '#{@user_id[:is_notified]}', confirmed: '#{@user_id[:confirmed]}', is_deleted: '#{@user_id[:is_deleted]}'"
        
        else
          puts COLOR_YELLOW + "Unable to retrieve User ID. Please check the database manually".upcase
          skip_this_scenario
        end
        LogInAndWaitForTheDashboard(LOGIN_BUTTON, ADMIN_PROFILE_DROPDOWN) if login_name != "ELMO Setup Admin"
      end
    
    when "Out"
      begin
        LogOutFromTheDashboard(USER_PROFILE_MENU_ICON_ID, LOGOUT_BUTTON_ID)
      end
  end
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


Then(/^I Should Be Able To Add (\d+) New "(Non-ELMO|ELMO)" Users In To The System With "(.*)" As First Name And "(.*)" As Last Name(:? And "([^"]*)" As Manager Username)?$/i) do |arg1, arg2, arg3, arg4, arg5|
  #This step also sets the roletype to the specified value
  i = 1  #Change it if the starting suffix value needs to be from a different value
  total = i + arg1  #Total number of users to be created
  for loop in i..total do
    begin
      @@first_name = arg3 + loop.to_s
      @@last_name = arg4 + loop.to_s if $add_user_type == "EMP" #Value of $add_user_type derived from Step 'I Go To (.*) Under (.*) Section' since Users and Onboarding users take different path
      @@last_name = arg4 + loop.to_s + ".ob" if $add_user_type == "OB"
      @@user_name = @@first_name + "." + @@last_name
      byebug
      @@email_address = @@user_name + NEW_USER_DETAILS_MAP[:email_prefix_value] #Email = firstname.lastname@email_suffix

      #Check if user already exists in the database or not. If exists, skip the current creation and continue with the loop. Else, create the user
      user_list_result = $daos.get_userid(@@user_name)
      if !user_list_result.nil?
        puts COLOR_YELLOW + "User #{user_list_result} already exists in the database. Creating next user".upcase
        $user_found = 1
        next
      
      else
        $user_found = 0
        begin
          CreateUsers(loop, arg2, @@first_name, @@last_name, arg5)
          steps %Q{
                  And   I Click On "Role" Tab
                  And   I Select "Role" Classic Dropdown As "Employee"
                  }              #Helps set the role type as well immediately after creating the user within the loop. Change the value to 'Manager' for manager Roletype or others
          case $add_user_type    #Case used to click on different buttons since Users click on 'Add New User' and Onboarding users click on 'New Onboarding User' button
            when "EMP"
              Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_NAV_LINK)) unless loop >= total
              Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_NEW_USER_BTN)) unless loop >= total
  
            when "OB"
              Sleep_Until(WaitForAnElementByXpathAndTouch(OB_USER_NAV_LINK)) unless loop >= total
              Sleep_Until(WaitForAnElementByXpathAndTouch(OB_ADD_NEW_USER_BTN)) unless loop >= total
          end
        end
      end
      
    end
  end
  
  puts COLOR_YELLOW + "All users to be created are already existing. Scenario has been skipped".upcase if $user_found == 1
  skip_this_scenario if $user_found == 1 #Skip the rest of the scenario since it's no longer valid
end


And(/^I Click On (.*) Sub Tab$/i) do |sub_tab_name|
  begin
    case sub_tab_name       #Since these are derived using href, case is used to differentiate between specific ones
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


And(/^I Click On "([^"]*)" Breadcrumb Menu$/) do |arg|
  breadcrumb_xpath = "//a[contains(.,'#{arg}')]"
  Sleep_Until(WaitForAnElementByXpathAndTouch(breadcrumb_xpath))
end


Then(/^I Should Be Able to Notify All Users$/) do
  Sleep_Until(PressConfirm())
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, USER_NOTIFY_SUCCESS_MSG_VALUE)
end