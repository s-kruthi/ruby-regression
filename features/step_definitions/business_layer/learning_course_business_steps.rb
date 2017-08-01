Given(/^I Have Logged In as a Company Admin To Setup A Course$/) do
  startWebDriver
  GoToThePage(ADMIN_COURSE_PAGE)
  EnterUsername(USER_NAME,ADMIN_COURSE_USER)
  EnterPassword(PASS_WORD,ADMIN_COURSE_PASS)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


When(/^I Setup A Course To Edit The Section$/) do
  AddACoursesAndGoToCourseSection(ADD_COURSE_BTN)
  FillTheCourseFormAndSaveIt(COURSE_NAME_ID,COURSE_NAME_VAL,COURSE_CODE_ID,COURSE_CODE_VAL,SAVE_COURSE_ID)
end

And(/^I Try To Setup A Quiz Activity Under The Section$/) do
  GoToTheCourseSection(ADD_COURSE_SECTION)
end

Then(/^I Should be Able To Successfully Setup The Quiz Activity$/) do
  SetupTheQuizActivityAndSaveIt()
  #SearchForTheCourseAndDeleteIt(COURSE_NAME_VAL)
end




##############Omar's added course section#################

Given(/^I Have Logged In as a Learning Admin to (.*) site$/) do |site_name|
  startWebDriver
  site_name = ENV["URL"] if ENV["URL"] != nil
  puts "URL = " + ENV["URL"] if ENV["URL"] != nil
  go_to_site(site_name)
  EnterUsername(USER_NAME,LEARNING_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,LEARNING_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


And(/^I Go To The Courses Section$/) do
  go_to_the_learning_as_company_admin(ADMIN_COG, LEARNING_EXPAND, LEARNING_LIST_PATH)
end

When(/^I Click On The New Course Button$/) do
  go_to_new_course_add_page(CREATE_NEW_COURSE_BTN)
end

And(/^I Add New Course Details$/) do
  enter_course_title(NEW_COURSE_TITLE_ID, NEW_COURSE_TITLE_VALUE)
  # enter_course_category()
  enter_course_code(NEW_COURSE_CODE_ID, NEW_COURSE_CODE_VALUE)
  enter_course_description(NEW_COURSE_DESC_TEXT, 0)
  enter_course_retrain(COURSE_RETRAIN_INPUT_ID, COURSE_RETRAIN_INPUT_VALUE) if COURSE_RETRAIN.to_i == 1
  enter_course_retrain_open(COURSE_RETRAIN_OPEN_INPUT_ID, COURSE_RETRAIN_OPEN_INPUT_VALUE) if COURSE_RETRAIN.to_i == 1
  enter_course_complete(COURSE_COMPLETE_INPUT_ID, COURSE_COMPLETE_INPUT_VALUE)
  enter_course_availability(COURSE_AVAILABILITY_INPUT_ID, COURSE_AVAILABILITY_INPUT_VALUE)
  enter_course_certificate_template(COURSE_CERTIFICATE_TEMPLATE_ID, COURSE_CERTIFICATE_TEMPLATE_VALUE)
  enter_course_self_enrol(COURSE_SELF_ENROLL_INPUT_ID, COURSE_SELF_ENROLL_INPUT_VALUE)
  enter_course_section_description(COURSE_SHOW_SEC_DESC_INPUT_ID, COURSE_SHOW_SEC_DESC_INPUT_VALUE)
end

Then(/^I Should Be Able To Create A New Course$/) do
  create_a_new_course_and_verify(FORM_TEMPLATE_SAVE_BTN)
  Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, COURSE_VERIFY_SAVE_SUCCESSFUL_VALUE))
  $driver.quit
end


When(/^I Search For A Specific Course$/) do
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Edit The Specific Course$/) do
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM_EDIT)
  $driver.quit
end


Then(/^I Should Be Able To Delete The Specific Course$/) do
  delete_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM_DELETE)
  click_on_button_in_iframe(COURSE_DELETE_BTN_NAME_ID)
  $driver.quit
end

When(/^I Edit A Specific Course$/) do
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM_EDIT)
end


Then(/^I Should Be Able To Add A New (.*) Activity$/) do |course_activity_name|
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
  add_a_new_section(COURSE_ADD_A_SECTION_BTN_ID)
  select_an_activity(course_activity_name)
  create_an_activity(course_activity_name)
  $driver.quit
end

And(/^I Open A Specific Face-to-Face Activity$/) do
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
  click_on_first_f2f_activity(FIRST_F2F_ACTIVITY_LINK_TEXT)
end

Then(/^I Should Be Able To Create A Session In The Face-to-Face Activity$/) do
  click_add_f2f_session_btn(F2F_SESSION_ADD_SESSION_BTN)
end


Then(/^I Should Be Able To Delete A Specific Section$/) do
  click_on_a_sub_tab(SUB_TAB_SECTION_NAME_ID)
  delete_a_section(SECTION_TRASH_ICON_ID)
  $driver.quit
end

Then(/^I Should Be Able To Add All Notifications$/) do
  click_on_a_sub_tab(SUB_TAB_APROVAL_NOT_NAME_ID)
  create_all_notifications()
end