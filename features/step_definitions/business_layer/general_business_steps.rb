# Given(/^I Have Logged In With Given Credential$/i) do |credential|
#
#   table = credential.hashes
#   role_type = []
#   login_name = []
#   login_pass = []
#   site_name = []
#
#   table.each do |row|
#     row.each do |key, value|
#       if key.eql? "login_type"
#         role_type << value
#       end
#         if key.eql? "login_name"
#           login_name << value
#         end
#         if key.eql? "login_password"
#           login_pass << value
#         end
#         if key.eql? "login_site"
#         site_name << value
#       end
#     end
#   end
#
#   puts "Role types: " + role_type.to_s
#   puts "Login Names: " + login_name.to_s
#   puts "Login Passwords: " + login_pass.to_s
#   puts "Site names: " + site_name.to_s
#
#
#   startWebDriver
#   # site_name = ENV["URL"] if ENV["URL"] != nil
#   # puts "Found ENV URL = " + ENV["URL"] if ENV["URL"] != nil
#   go_to_site(site_name[0].to_s)
#   EnterUsername(USER_NAME,login_name[0].to_s)
#   EnterPassword(PASS_WORD,login_pass[0].to_s)
#   LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
# end


Given(/^i have logged in as a (.*)$/i) do |login_name|
  startWebDriver
  go_to_site()

  case login_name
    when "ELMO Setup Admin"
      begin
        GoToThePage(ADMIN_SETUP_LANDING_PAGE)
        EnterUsername(USER_NAME,ELMO_ADMIN_USERNAME)
        EnterPassword(PASS_WORD,ELMO_ADMIN_PASSWORD)

        loginToSystem(LOGIN_BUTTON)

        GoToThePage(ADMIN_SETUP_LANDING_PAGE)
        EnterUsername(USER_NAME,ELMO_SETUP_ADMIN_USERNAME)
        EnterPassword(PASS_WORD,ELMO_SETUP_ADMIN_PASSWORD)
        loginToSystem(LOGIN_BUTTON)
      end

    when "ELMO Super Admin"
      begin
        EnterUsername(USER_NAME,ELMO_SUPER_USERNAME)
        EnterPassword(PASS_WORD,ELMO_SUPER_PASSWORD)
      end

    when "ELMO Admin"
      begin
        EnterUsername(USER_NAME,ELMO_ADMIN_USERNAME)
        EnterPassword(PASS_WORD,ELMO_ADMIN_PASSWORD)
      end

    when "Company Admin"
      begin
        EnterUsername(USER_NAME,COMP_ADMIN_USERNAME)
        EnterPassword(PASS_WORD,COMP_ADMIN_PASSWORD)
      end

    when "Learning Admin"
      begin
        EnterUsername(USER_NAME,LEARNING_ADMIN_USERNAME)
        EnterPassword(PASS_WORD,LEARNING_ADMIN_PASSWORD)
      end

    when "Recruitment Admin"
      begin
        EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
        EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
      end

    when "Leave Admin"
      begin
        EnterUsername(USER_NAME,LEAVE_COMPANY_ADMIN_USER)
        EnterPassword(PASS_WORD,LEAVE_COMPANY_ADMIN_PASS)
      end

    when "Company Manager"
      begin
        EnterUsername(USER_NAME,COMPANY_MANAGER_USER)
        EnterPassword(PASS_WORD,COMPANY_MANAGER_PASS)
      end

    when "Company Employee"
      begin
        EnterUsername(USER_NAME,COMPANY_EMPLOYEE_1_USER)
        EnterPassword(PASS_WORD,COMPANY_EMPLOYEE_1_PASS)
      end
  end

   LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN) if login_name != "ELMO Setup Admin"
end


And(/^I go to Admin Settings$/i) do
  goToAdminSettings(ADMIN_COG)
end


And(/^I Go To (.*) Under (.*) Section$/i) do |menu_type, menu_section|
  if menu_section == "Rewards"
    menu_section = "RewardsAdmin"
  end
  begin
      $section_name = "//a[@href='#collapse#{menu_section}']"
      $item_name = "//span[contains(.,'#{menu_type}')]"
      go_to_the_sections($section_name, $item_name)
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
            go_to_the_navbar_sections(MENU_PROFILE_LINK)
          end

        when "Menu My Team"
          begin
            go_to_the_navbar_sections(MENU_MY_TEAM_LINK)
          end

        when "Menu Learning"
          begin
            go_to_the_navbar_sections(MENU_LEARNING_LINK)
          end

        when "Menu Leave"
          begin
            go_to_the_navbar_sections(MENU_LEAVE_LINK)
          end

        when "Menu Documents"
          begin
            go_to_the_navbar_sections(MENU_DOCUMENTS_LINK)
          end

        when "Menu Performance"
          begin
            go_to_the_navbar_sections(MENU_PERFORMANCE_LINK)
          end

        when "Menu Recruitment"
          begin
            go_to_the_navbar_sections(MENU_RECRUITMENT_LINK)
          end

        when "Menu Careers"
          begin
            go_to_the_navbar_sections(MENU_CAREERS_LINK)
          end

        when "Menu Calender"
          begin
            go_to_the_navbar_sections(MENU_CALENDER_LINK)
          end

        when "Menu Contracts"
          begin
            Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
            Sleep_Until(go_to_the_navbar_sections(MENU_CONTRACTS_LINK))
            sleep (1)
          end

        when "Menu Succession"
          begin
            Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
            Sleep_Until(go_to_the_navbar_sections(MENU_SUCCESSION_LINK))
            sleep (1)
          end

        when "Menu Reports"
          begin
            Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
            Sleep_Until(go_to_the_navbar_sections(MENU_REPORTS_LINK))
            sleep (1)
          end
      end
  end
end


When(/^I Click On Add New User Button$/i) do
  begin
      case $add_user_type
        when "EMP"
          begin
            go_to_add_new_users_page(ADD_NEW_USER_BTN)
          end

        when "OB"
          begin
            go_to_add_new_users_page(OB_ADD_NEW_USER_BTN)
          end
    end
  end
end


And(/^I Enter New User Details$/i) do
  create_users(1)
end


Then(/^I Should Be Able To Add (.*) New Users In To The System$/i) do |total_number_of_users|
  $total = total_number_of_users.to_i
  add_user_details($total - 1)
  $driver.quit
end

And(/^I Click On (.*) Sub Tab$/i) do |sub_tab_name|
  begin
    case sub_tab_name
      when "Personal Details"
        begin
          Sleep_Until(click_on_a_sub_tab(SUB_TAB_PERSONAL_NAME_ID))
        end

      when "Payment Details"
        begin
          Sleep_Until(click_on_a_sub_tab(SUB_TAB_PAYMENT_NAME_ID))
        end
    end
  end
end


When(/^I Click On (.*) Icon$/i) do |click_edit_icon|
  begin
    case click_edit_icon
      when "Edit Emergency Contact Details"
        begin
          Sleep_Until(click_on_a_sub_tab(EDIT_EM_CONTACT_BTN_ID))
        end

      when "Edit Next Of Kin"
        begin
          Sleep_Until(click_on_a_sub_tab(EDIT_NOK_CONTACT_BTN_ID))
        end
    end
  end
end


And(/^I Click On Add (.*) Button$/i) do |add_contact_btn|
  begin
    case add_contact_btn
      when "Emergency Contact Details"
        begin
          Sleep_Until(click_on_a_sub_tab(ADD_EM_CONTACT_BTN_ID))
        end

      when "Next Of Kin"
        begin
          Sleep_Until(click_on_a_sub_tab(ADD_NOK_CONTACT_BTN_ID))
        end
    end
  end
end


And(/^I Use Add (.*) Details$/i) do |add_contact_btn|
  begin
    case add_contact_btn
      when "Emergency Contact"
        begin
          Sleep_Until(click_on_a_sub_tab(ADD_EM_CONTACT_BTN_ID))
          Sleep_Until(enter_user_details(EM_USER__NAME_ID, EM_USER__NAME_VALUE))
          Sleep_Until(enter_user_details(EM_USER_RELATIONSHIP_ID, EM_USER_RELATIONSHIP_VALUE))
          Sleep_Until(enter_user_details(EM_USER_ADDRESS_ID, EM_USER_ADDRESS_VALUE))
          Sleep_Until(WaitForAnElementByIdAndInputValue(EM_USER_MOBILE_ID, EM_USER_MOBILE_VALUE))
          Sleep_Until(enter_user_details(EM_USER_EMAIL_ID, EM_USER_EMAIL_VALUE))
          Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
        end

      when "Next Of Kin"
        begin
          Sleep_Until(click_on_a_sub_tab(ADD_NOK_CONTACT_BTN_ID))
          Sleep_Until(enter_user_details(EM_USER__NAME_ID, EM_USER__NAME_VALUE))
          Sleep_Until(enter_user_details(EM_USER_RELATIONSHIP_ID, EM_USER_RELATIONSHIP_VALUE))
          Sleep_Until(enter_user_details(EM_USER_ADDRESS_ID, EM_USER_ADDRESS_VALUE))
          Sleep_Until(WaitForAnElementByIdAndInputValue(EM_USER_MOBILE_ID, EM_USER_MOBILE_VALUE))
          Sleep_Until(enter_user_details(EM_USER_EMAIL_ID, EM_USER_EMAIL_VALUE))
        end
    end
  end
end

Then(/^I Should Be Able To Add (.*) Details$/i) do |contact_details|
  Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
  Sleep_Until(WaitForAnElementByXpathAndTouch(DONE_BTN_ID))
  sleep (1)
end


And(/^i search for a specific user named (.*)$/i) do |username_search_value|
  $username_search_value = username_search_value
  use_active_inactive_filter() if USE_ACTIVE_INACTIVE_FILTER.to_i == 1
  search_for_an_employee_contract_and_verify(USERNAME_SEARCH_ID, $username_search_value, USERNAME_SEARCH_BTN, USERNAME_SEARCH_RESULT_VALUE)
end


Then(/^I Should Be Able To use (.*) Action on The Specific User$/i) do |specified_action|
  begin
    case specified_action

    when "De-activate user"
        begin
          click_user_list_actions(ACTION_DROPDOWN_CLASS_NAME, ACTION_DROPDOWN_INDEX_VALUE, ACTION_DROPDOWN_DEACTIVATE_VALUE)
          verify_deleted_user(INACTIVE_CLASS_ID, INACTIVE_ATTRIBUTE_ID, INACTIVE_ATTRIBUTE_TEXT)
        end

    when "Edit User Profile"
        begin
          click_user_list_actions(ACTION_DROPDOWN_CLASS_NAME, ACTION_DROPDOWN_INDEX_VALUE, ACTION_DROPDOWN_EDIT_VALUE)
        end
      end
  end
end


And(/^i should be able to go to (.*) tab$/i) do |profile_tab_name|
     click_on_a_tab(profile_tab_name)
end

And(/^i should be able to fill in all profile related information$/i) do
  pending
  select_gender()
  enter_preferred_name()
  select_date_joined()
  select_terminate_date()
  select_employement_status()
  select_date_of_birth()
  enter_elders_id()
  select_hay_grade()
  select_employe()

end

And(/^i should be able to save the information successfully$/i) do
  click_on_save_button(SAVE_BTN_ID)
end

And(/^I Click on "([^"]*)" Button$/i) do |button_name|

  case button_name
    when "Create Filter"
      begin
        buttonxPath = "//button[contains(.,'#{button_name}')]"
        Sleep_Until($driver.find_elements(:xpath, buttonxPath).first.click)
      end

    else
      begin
        buttonxPath = "//a[contains(.,'#{button_name}')]"
        Sleep_Until(WaitForAnElementByXpathAndTouch(buttonxPath))
        end
  end
end
