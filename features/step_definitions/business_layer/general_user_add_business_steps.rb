Given(/^I Have Logged In as a Company Admin to (.*) site$/) do |site_name|
  startWebDriver
  $site_name = ENV["URL"] if ENV["URL"] != nil
  puts "URL = " + ENV["URL"] if ENV["URL"] != nil
  go_to_site($site_name)
  EnterUsername(USER_NAME,COMP_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,COMP_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

And(/^I Go To The (.*) Section$/) do |menu_type|
  begin
      case menu_type
        when "General Users"
          begin
            go_to_the_sections(ADMIN_COG, GENERAL_EXPAND, USERS_LIST_PATH)
            $add_user_type = "EMP"
          end

        when "Onboarding Users"
          begin
            go_to_the_sections(ADMIN_COG, ONBOARDING_EXPAND, OB_USERS_LIST_PATH)
            $add_user_type = "OB"
          end

        when "Learning Courses"
          begin
            go_to_the_sections(ADMIN_COG, LEARNING_EXPAND, LEARNING_LIST_PATH)
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
            Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[2].click) if $driver.find_elements(:class, "dropdown-toggle")[2].displayed? == true
            Sleep_Until(go_to_the_navbar_sections(MENU_CONTRACTS_LINK))
            sleep (1)
          end

        when "Menu Succession"
          begin
            Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[2].click) if $driver.find_elements(:class, "dropdown-toggle")[2].displayed? == true
            Sleep_Until(go_to_the_navbar_sections(MENU_SUCCESSION_LINK))
            sleep (1)
          end

        when "Menu Reports"
          begin
            Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[2].click) if $driver.find_elements(:class, "dropdown-toggle")[2].displayed? == true
            Sleep_Until(go_to_the_navbar_sections(MENU_REPORTS_LINK))
            sleep (1)
          end
      end
  end
end


When(/^I Click On Add New User Button$/) do
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


And(/^I Enter New User Details$/) do
  create_users(11)
end

Then(/^I Should Be Able To Add (.*) New Users In To The System$/) do |total_number_of_users|
  $total = total_number_of_users.to_i
  add_user_details($total - 1)
  $driver.quit
end

And(/^I Click On (.*) Sub Tab$/) do |sub_tab_name|
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


When(/^I Click On (.*) Icon$/) do |click_edit_icon|
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


And(/^I Click On (.*) Button$/) do |add_contact_btn|
  begin
    case add_contact_btn
      when "Add Emergency Contact Details"
        begin
          Sleep_Until(click_on_a_sub_tab(ADD_EM_CONTACT_BTN_ID))
        end

      when "Add Next Of Kin"
        begin
          Sleep_Until(click_on_a_sub_tab(ADD_NOK_CONTACT_BTN_ID))
        end
    end
  end
end

And(/^I Use (.*)$/) do |add_contact_btn|
  begin
    case add_contact_btn
      when "Add Emergency Contact Details"
        begin
          Sleep_Until(click_on_a_sub_tab(ADD_EM_CONTACT_BTN_ID))
          Sleep_Until(enter_user_details(EM_USER__NAME_ID, EM_USER__NAME_VALUE))
          Sleep_Until(enter_user_details(EM_USER_RELATIONSHIP_ID, EM_USER_RELATIONSHIP_VALUE))
          Sleep_Until(enter_user_details(EM_USER_ADDRESS_ID, EM_USER_ADDRESS_VALUE))
          Sleep_Until(WaitForAnElementByIdAndInputValue(EM_USER_MOBILE_ID, EM_USER_MOBILE_VALUE))
          Sleep_Until(enter_user_details(EM_USER_EMAIL_ID, EM_USER_EMAIL_VALUE))
          Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
        end

      when "Add Next Of Kin Details"
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

Then(/^I Should Be Able To Add (.*) Details$/) do |contact_details|
  Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
  Sleep_Until(WaitForAnElementByXpathAndTouch(DONE_BTN_ID))
end