When(/^I Click On "([^"]*)" item from left side bar under "([^"]*)" section$/i) do |config_section_item, config_section_name|

  case config_section_name
    when "Contact Details"
      begin
        click_on_side_bar_item_custom(config_section_item, config_section_name)
        end

    when "Diversity Questions"
      begin
        click_on_side_bar_item_custom(config_section_item, config_section_name)
      end

    when "Payment Details"
      begin
        break
      end

  end

  click_on_side_bar_item(config_section_item, config_section_name)
end

And(/^I Click On "([^"]*)" Tab$/i) do |tab_name_id|
  click_on_a_tab(tab_name_id)
  sleep (3)
end


And(/^I select "([^"]*)" option to "([^"]*)"$/i) do |config_selection_name, config_selection_value|
end

And(/^I select "([^"]*)" dropdown to "([^"]*)"$/i) do |option_name, option_value|
end

Then(/^I Should Be Able To Save Configuration Details$/i) do
end

And(/^Verify That "Configuration Status" Is Displayed As "([^"]*)"$/i) do |config_status_value|
end


# And(/^$/i) do |module_name, toggle_btn_name|
#   click_on_toggle_button(module_name, toggle_btn_name)
# end
# Given(/^i have logged in as a (.*) to (.*) site$/i) do |login_name, site_name|
#   startWebDriver
#   $site_name = site_name
#   $site_name = (ENV["URL"] || ENV["url"]) if (ENV["URL"] || ENV["url"]) != nil
#   puts "URL OVERRIDE = " + $site_name.to_s if (ENV["URL"] || ENV["url"]) != nil
#   go_to_site($site_name)
#
#   case login_name
#     when "ELMO Setup Admin"
#       begin
#         GoToThePage(ADMIN_SETUP_LANDING_PAGE)
#         EnterUsername(USER_NAME,ELMO_ADMIN_USERNAME)
#         EnterPassword(PASS_WORD,ELMO_ADMIN_PASSWORD)
#
#         loginToSystem(LOGIN_BUTTON)
#
#         GoToThePage(ADMIN_SETUP_LANDING_PAGE)
#         EnterUsername(USER_NAME,ELMO_SETUP_ADMIN_USERNAME)
#         EnterPassword(PASS_WORD,ELMO_SETUP_ADMIN_PASSWORD)
#         loginToSystem(LOGIN_BUTTON)
#       end
#
#     when "ELMO Admin"
#       begin
#         EnterUsername(USER_NAME,ELMO_ADMIN_USERNAME)
#         EnterPassword(PASS_WORD,ELMO_ADMIN_PASSWORD)
#       end
#
#     when "Company Admin"
#       begin
#         EnterUsername(USER_NAME,COMP_ADMIN_USERNAME)
#         EnterPassword(PASS_WORD,COMP_ADMIN_PASSWORD)
#       end
#
#     when "Learning Admin"
#       begin
#         EnterUsername(USER_NAME,LEARNING_ADMIN_USERNAME)
#         EnterPassword(PASS_WORD,LEARNING_ADMIN_PASSWORD)
#       end
#
#     when "Recruitment Admin"
#       begin
#         EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
#         EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
#       end
#
#     when "Leave Admin"
#       begin
#         EnterUsername(USER_NAME,LEAVE_COMPANY_ADMIN_USER)
#         EnterPassword(PASS_WORD,LEAVE_COMPANY_ADMIN_PASS)
#       end
#   end
#
#   LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN) if login_name != "ELMO Setup Admin"
# end
#
# And(/^I go to Admin Settings$/i) do
#   goToAdminSettings(ADMIN_COG)
# end
#
# And(/^I Go To The (.*) Under (.*) Section$/i) do |menu_type, menu_section|
#   begin
#       $section_name = "//a[@href='#collapse#{menu_section}']"
#       $item_name = "//span[contains(.,'#{menu_type}')]"
#       go_to_the_sections($section_name, $item_name)
#       $add_user_type = "EMP" if menu_type.include? "Users"
#       $add_user_type = "OB" if menu_type.include? "Onboarding"
#   end
# end
#
# And(/^I Go To The (.*) Section$/i) do |menu_type|
#   begin
#     case menu_type
#
#       when "Contracts"
#         begin
#           goToClientContractsTab(CLIENT_CONTRACTS_TAB)
#         end
#
#         when "Menu Profile"
#           begin
#             go_to_the_navbar_sections(MENU_PROFILE_LINK)
#           end
#
#         when "Menu My Team"
#           begin
#             go_to_the_navbar_sections(MENU_MY_TEAM_LINK)
#           end
#
#         when "Menu Learning"
#           begin
#             go_to_the_navbar_sections(MENU_LEARNING_LINK)
#           end
#
#         when "Menu Leave"
#           begin
#             go_to_the_navbar_sections(MENU_LEAVE_LINK)
#           end
#
#         when "Menu Documents"
#           begin
#             go_to_the_navbar_sections(MENU_DOCUMENTS_LINK)
#           end
#
#         when "Menu Performance"
#           begin
#             go_to_the_navbar_sections(MENU_PERFORMANCE_LINK)
#           end
#
#         when "Menu Recruitment"
#           begin
#             go_to_the_navbar_sections(MENU_RECRUITMENT_LINK)
#           end
#
#         when "Menu Careers"
#           begin
#             go_to_the_navbar_sections(MENU_CAREERS_LINK)
#           end
#
#         when "Menu Calender"
#           begin
#             go_to_the_navbar_sections(MENU_CALENDER_LINK)
#           end
#
#         when "Menu Contracts"
#           begin
#             Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
#             Sleep_Until(go_to_the_navbar_sections(MENU_CONTRACTS_LINK))
#             sleep (1)
#           end
#
#         when "Menu Succession"
#           begin
#             Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
#             Sleep_Until(go_to_the_navbar_sections(MENU_SUCCESSION_LINK))
#             sleep (1)
#           end
#
#         when "Menu Reports"
#           begin
#             Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[1].click) if $driver.find_elements(:class, "dropdown-toggle")[1].displayed? == true
#             Sleep_Until(go_to_the_navbar_sections(MENU_REPORTS_LINK))
#             sleep (1)
#           end
#       end
#   end
# end
#
#
# When(/^I Click On Add New User Button$/i) do
#   begin
#       case $add_user_type
#         when "EMP"
#           begin
#             go_to_add_new_users_page(ADD_NEW_USER_BTN)
#           end
#
#         when "OB"
#           begin
#             go_to_add_new_users_page(OB_ADD_NEW_USER_BTN)
#           end
#     end
#   end
# end
#
#
# And(/^I Enter New User Details$/i) do
#   create_users(1)
# end
#
# Then(/^I Should Be Able To Add (.*) New Users In To The System$/i) do |total_number_of_users|
#   $total = total_number_of_users.to_i
#   add_user_details($total - 1)
#   $driver.quit
# end
#
# And(/^I Click On (.*) Sub Tab$/i) do |sub_tab_name|
#   begin
#     case sub_tab_name
#       when "Personal Details"
#         begin
#           Sleep_Until(click_on_a_sub_tab(SUB_TAB_PERSONAL_NAME_ID))
#         end
#
#       when "Payment Details"
#         begin
#           Sleep_Until(click_on_a_sub_tab(SUB_TAB_PAYMENT_NAME_ID))
#         end
#     end
#   end
# end
#
#
# When(/^I Click On (.*) Icon$/i) do |click_edit_icon|
#   begin
#     case click_edit_icon
#       when "Edit Emergency Contact Details"
#         begin
#           Sleep_Until(click_on_a_sub_tab(EDIT_EM_CONTACT_BTN_ID))
#         end
#
#       when "Edit Next Of Kin"
#         begin
#           Sleep_Until(click_on_a_sub_tab(EDIT_NOK_CONTACT_BTN_ID))
#         end
#     end
#   end
# end
#
#
# And(/^I Click On Add (.*) Button$/i) do |add_contact_btn|
#   begin
#     case add_contact_btn
#       when "Emergency Contact Details"
#         begin
#           Sleep_Until(click_on_a_sub_tab(ADD_EM_CONTACT_BTN_ID))
#         end
#
#       when "Next Of Kin"
#         begin
#           Sleep_Until(click_on_a_sub_tab(ADD_NOK_CONTACT_BTN_ID))
#         end
#     end
#   end
# end
#
# And(/^I Use Add (.*) Details$/i) do |add_contact_btn|
#   begin
#     case add_contact_btn
#       when "Emergency Contact"
#         begin
#           Sleep_Until(click_on_a_sub_tab(ADD_EM_CONTACT_BTN_ID))
#           Sleep_Until(enter_user_details(EM_USER__NAME_ID, EM_USER__NAME_VALUE))
#           Sleep_Until(enter_user_details(EM_USER_RELATIONSHIP_ID, EM_USER_RELATIONSHIP_VALUE))
#           Sleep_Until(enter_user_details(EM_USER_ADDRESS_ID, EM_USER_ADDRESS_VALUE))
#           Sleep_Until(WaitForAnElementByIdAndInputValue(EM_USER_MOBILE_ID, EM_USER_MOBILE_VALUE))
#           Sleep_Until(enter_user_details(EM_USER_EMAIL_ID, EM_USER_EMAIL_VALUE))
#           Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
#         end
#
#       when "Next Of Kin"
#         begin
#           Sleep_Until(click_on_a_sub_tab(ADD_NOK_CONTACT_BTN_ID))
#           Sleep_Until(enter_user_details(EM_USER__NAME_ID, EM_USER__NAME_VALUE))
#           Sleep_Until(enter_user_details(EM_USER_RELATIONSHIP_ID, EM_USER_RELATIONSHIP_VALUE))
#           Sleep_Until(enter_user_details(EM_USER_ADDRESS_ID, EM_USER_ADDRESS_VALUE))
#           Sleep_Until(WaitForAnElementByIdAndInputValue(EM_USER_MOBILE_ID, EM_USER_MOBILE_VALUE))
#           Sleep_Until(enter_user_details(EM_USER_EMAIL_ID, EM_USER_EMAIL_VALUE))
#         end
#     end
#   end
# end
#
# Then(/^I Should Be Able To Add (.*) Details$/i) do |contact_details|
#   Sleep_Until(WaitForAnElementByXpathAndTouch(SAVE_BTN_ID))
#   Sleep_Until(WaitForAnElementByXpathAndTouch(DONE_BTN_ID))
#   sleep (1)
# end
#
#
#
# Then(/^I Should Be Able To Delete The Specific User$/i) do
#   delete_the_user(ACTION_DROPDOWN_CLASS_NAME, ACTION_DROPDOWN_CLASS_INDEX_VALUE, ACTION_DROPDOWN_NAME_VALUE)
#   very_deleted_user(INACTIVE_CLASS_ID, INACTIVE_ATTRIBUTE_ID, INACTIVE_ATTRIBUTE_TEXT)
# end
#
# And(/^I Click on "([^"]*)" Button$/i) do |button_name|
#   buttonxPath = "//a[contains(.,'#{button_name}')]"
#   Sleep_Until(WaitForAnElementByXpathAndTouch(buttonxPath))
# end