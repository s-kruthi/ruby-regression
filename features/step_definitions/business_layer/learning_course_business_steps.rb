When(/^I Setup A Course To Edit The Section$/i) do
  AddACoursesAndGoToCourseSection(ADD_COURSE_BTN)
  FillTheCourseFormAndSaveIt(COURSE_NAME_ID,COURSE_NAME_VAL,COURSE_CODE_ID,COURSE_CODE_VAL,SAVE_COURSE_ID)
end

And(/^I Try To Setup A Quiz Activity Under The Section$/i) do
  GoToTheCourseSection(ADD_COURSE_SECTION)
end

Then(/^I Should be Able To Successfully Setup The Quiz Activity$/i) do
  SetupTheQuizActivityAndSaveIt()
end

When(/^I Click On The New Course Button$/i) do
  go_to_new_course_add_page(CREATE_NEW_COURSE_BTN)
end

And(/^I Add New Course Details$/i) do
  enter_course_title(NEW_COURSE_TITLE_ID, NEW_COURSE_TITLE_VALUE)
  # enter_course_category()
  enter_course_code(NEW_COURSE_CODE_ID, NEW_COURSE_CODE_VALUE)
  enter_course_description(NEW_COURSE_DESC_TEXT, 0)
  enter_course_retrain(COURSE_RETRAIN_INPUT_ID, COURSE_RETRAIN_INPUT_VALUE) if COURSE_RETRAIN.to_i == 1
  enter_course_retrain_open(COURSE_RETRAIN_OPEN_INPUT_ID, COURSE_RETRAIN_OPEN_INPUT_VALUE) if COURSE_RETRAIN_OPEN.to_i == 1
  enter_course_complete(COURSE_COMPLETE_INPUT_ID, COURSE_COMPLETE_INPUT_VALUE)
  enter_course_availability(COURSE_AVAILABILITY_INPUT_ID, COURSE_AVAILABILITY_INPUT_VALUE)
  enter_course_certificate_template(COURSE_CERTIFICATE_TEMPLATE_ID, COURSE_CERTIFICATE_TEMPLATE_VALUE) if COURSE_CERTIFICATE.to_i == 1
  enter_course_self_enrol(COURSE_SELF_ENROLL_INPUT_ID, COURSE_SELF_ENROLL_INPUT_VALUE)
  enter_course_section_description(COURSE_SHOW_SEC_DESC_INPUT_ID, COURSE_SHOW_SEC_DESC_INPUT_VALUE)
end

Then(/^I Should Be Able To Create A New Course$/i) do
  create_a_new_course_and_verify(FORM_TEMPLATE_SAVE_BTN)
  Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, COURSE_VERIFY_SAVE_SUCCESSFUL_VALUE))
  $driver.quit
end


When(/^I Search For A Specific Course Named (.*)$/i) do |course_name|
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, course_name, COURSE_SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Edit The Specific Course$/i) do
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
  $driver.quit
end


Then(/^I Should Be Able To Delete The Specific Course$/i) do
  delete_the_first_course_from_table(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_DELETE)
  click_on_button_in_iframe(COURSE_DELETE_BTN_NAME_ID)
  $driver.quit
end

When(/^I Edit A Specific Course Named (.*)$/i) do |course_name|
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, course_name, COURSE_SEARCH_BTN_ID)
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


Then(/^I Should Be Able To Add A New (.*) Activity$/i) do |course_activity_name|
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
  add_a_new_section(COURSE_ADD_A_SECTION_BTN_ID)
  select_an_activity(course_activity_name)
  create_an_activity(course_activity_name)
  $driver.quit
end

And(/^I Open A Specific Face-to-Face Activity Named (.*)$/i) do |f2f_activity_name|
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
  click_on_first_f2f_activity(f2f_activity_name)
end

Then(/^I Should Be Able To Create A Session In The Face-to-Face Activity$/i) do
  click_add_f2f_session_btn(F2F_SESSION_ADD_SESSION_BTN)
end


Then(/^I Should Be Able To Delete A Specific Section$/i) do
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
  delete_a_section(SECTION_TRASH_ICON_ID)
  $driver.quit
end

Then(/^I Should Be Able To Add All Notifications$/i) do
  click_on_a_sub_tab(SUB_TAB_APROVAL_NOT_NAME_ID)
  create_all_notifications()
end


And(/^I Click On The Menu Of A Specific Course$/i) do
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


Then(/^I Should Be Able To (.*) Of The Specific Course$/i) do |retrain_action|
  click_the_menu_of_first_course_from_table(COURSE_LIST_DROPDOWN, retrain_action)
  case retrain_action
    when "Fix Retrain"
      begin
        Sleep_Until(verifySuccessMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_FIX_SUCCESSFUL_VALUE))
      end

    when "Disable Retrain"
      begin
        Sleep_Until(verifySuccessMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_DISABLE_SUCCESSFUL_VALUE))
      end
  end
end

And(/^I select (.*) as (.*)$/i) do |dropdown_name, dropdown_value|

  case dropdown_name
    when "Employee Name"
      begin
        Sleep_Until(single_select_from_select2_input_dropdown(EMPLOYEE_NAME_DROPDOWN_ID, SELECT2_DROPDOWN_ID, dropdown_value, SELECT2_DROPDOWN_RESULT_CLASS))
      end
   end

end

Then(/^I Should Be Able to Create a Filter$/i) do
  Sleep_Until(click_on_save_button(FILTER_SUBMIT_BTN_ID))
end


And(/^See a Filtered List of Retrain Discrepancy Course Results for Learner (.*)$/i) do |learner_name|
  verify_filter_result(FILTER_RESULT_VERIFY_TABLE_ID, "#{learner_name.to_s}")
end