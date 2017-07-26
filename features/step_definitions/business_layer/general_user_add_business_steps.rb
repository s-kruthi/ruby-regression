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
end

# Then(/^I Should Be Able To Create A New Course$/) do
#   create_a_new_course_and_verify(FORM_TEMPLATE_SAVE_BTN)
#   Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, COURSE_VERIFY_SAVE_SUCCESSFUL_VALUE))
#   $driver.quit
# end
#
#
# When(/^I Search For A Specific Course$/) do
#   search_a_course(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
# end
#
#
# Then(/^I Should Be Able To Edit The Specific Course$/) do
#   edit_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM_EDIT)
#   $driver.quit
# end
#
#
# Then(/^I Should Be Able To Delete The Specific Course$/) do
#   delete_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM_DELETE)
#   click_on_button_in_iframe(COURSE_DELETE_BTN_NAME_ID)
#   $driver.quit
# end
#
# When(/^I Edit A Specific Course$/) do
#   search_a_course(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
#   edit_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM_EDIT)
# end
#
#
# Then(/^I Should Be Able To Add A New (.*) Activity$/) do |course_activity_name|
#   click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
#   add_a_new_section(COURSE_ADD_A_SECTION_BTN_ID)
#   select_an_activity(course_activity_name)
#   create_an_activity(course_activity_name)
#   $driver.quit
# end
#
# And(/^I Open A Specific Face-to-Face Activity$/) do
#   click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
#   click_on_first_f2f_activity(FIRST_F2F_ACTIVITY_LINK_TEXT)
# end
#
# Then(/^I Should Be Able To Create A Session In The Face-to-Face Activity$/) do
#   click_add_f2f_session_btn(F2F_SESSION_ADD_SESSION_BTN)
# end
#
#
# Then(/^I Should Be Able To Delete A Specific Section$/) do
#   click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
#   delete_a_section(SECTION_TRASH_ICON_ID)
#   $driver.quit
# end
#
# Then(/^I Should Be Able To Add All Notifications$/) do
#   click_on_a_sub_tab(SUB_TAB_APROVAL_NOT_NAME_ID)
#   create_all_notifications()
# end