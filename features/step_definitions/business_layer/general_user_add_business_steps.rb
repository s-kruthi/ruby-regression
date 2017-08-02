Given(/^I Have Logged In as a Company Admin to (.*) site$/) do |site_name|
  startWebDriver
  site_name = ENV["URL"] if ENV["URL"] != nil
  puts "URL = " + ENV["URL"] if ENV["URL"] != nil
  go_to_site(site_name)
  EnterUsername(USER_NAME,COMP_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,COMP_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

And(/^I Go To The (.*) Section$/) do |user_type|
  begin
      case user_type
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

        when "Profile"
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


And(/^I Enter (\d+) New User Details$/) do |total_number_of_users|
  total = total_number_of_users.to_i
  add_user_details(total)
end

Then(/^I Should Be Able To Add New Users In To The System$/) do
  verifySuccessMessage(ADD_USER_SAVE_SUCCESS_ID, ADD_USER_SAVE_SUCCESS_VALUE)
end

Then(/^I Should Be Able To Add A New (.*) Activity$/) do |course_activity_name|
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
  add_a_new_section(COURSE_ADD_A_SECTION_BTN_ID)
  select_an_activity(course_activity_name)
  create_an_activity(course_activity_name)
  $driver.quit
end
