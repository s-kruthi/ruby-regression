Given(/^I Have Logged In as a Learning Admin User$/) do
  startWebDriver
  GoToThePage(ELMO_LEARNING_LANDING_PAGE)
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
  enter_course_retrain(COURSE_RETRAIN_INPUT_ID, COURSE_RETRAIN_INPUT_VALUE)
  enter_course_complete(COURSE_COMPLETE_INPUT_ID, COURSE_COMPLETE_INPUT_VALUE)
  enter_course_availability(COURSE_AVAILABILITY_INPUT_ID, COURSE_AVAILABILITY_INPUT_VALUE)
  enter_course_certificate_template(COURSE_CERTIFICATE_TEMPLATE_ID, COURSE_CERTIFICATE_TEMPLATE_VALUE)
  enter_course_self_enrol(COURSE_SELF_ENROLL_INPUT_ID, COURSE_SELF_ENROLL_INPUT_VALUE)
  enter_course_section_description(COURSE_SHOW_SEC_DESC_INPUT_ID, COURSE_SHOW_SEC_DESC_INPUT_VALUE)
end

Then(/^I Should Be Able To Create A New Course$/) do
  create_a_new_course_and_verify(FORM_TEMPLATE_SAVE_BTN)
  # sleep (1)
  verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, COURSE_VERIFY_SAVE_SUCCESSFUL_VALUE)
  sleep (1)
  $driver.quit
end


When(/^I Search For A Specific Course$/) do
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Edit The Specific Course$/) do
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM)
  $driver.quit
end

When(/^I Edit A Specific Course$/) do
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, COURSE_LIST_TITLE_VALUE, COURSE_SEARCH_BTN_ID)
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN,3, COURSE_LIST_ACTION_ITEM)
end


Then(/^I Should Be Able To Add A New (.*) Activity$/) do |course_activity_name|
  click_on_a_sub_tab(COURSE_SUB_TAB_SECTION_NAME_ID)
  sleep (2)
  add_a_new_section(COURSE_ADD_A_SECTION_BTN_ID)
  sleep (2)
  select_an_activity(course_activity_name)
  $driver.quit
end

# And(/^I Go To The Documents Categories Section$/) do
#   goToTheDocumentsAsCompanyAdmin(ADMIN_COG, DOCUMENTS_EXPAND, DOCUMENTS_CAT_LIST_PATH)
# end
#
# When(/^I click on Add Category Button$/) do
#   goToNewDocumentCategoryPage(CREATE_DOCUMENT_CATEGORY_BTN)
# end
#
# And(/^I Enter New Document Category Details$/) do
#   enterDocumentCategoryDetails(DOCUMENT_CATEGORY_TITLE_ID, DOCUMENT_CATEGORY_TITLE_TEXT)
#   enterDescription(DOCUMENT_CATEGORY_DESC_TXT, 0)
# end
#
# Then(/^I Should Be Able To Create A Document Category$/) do
#   createADocumentCategory(FORM_TEMPLATE_SAVE_BTN)
#   verifySuccessMessage(DOCUMENT_CAT_SAVE_SUCCESS_ID, DOCUMENT_CAT_SAVE_SUCCESS_VALUE)
#   $driver.quit
# end
#
#
# Then(/^I Should Be Able To Hide A Document Category$/) do
#   hideTheFirstDocumentCategoryFromTheTable(DOC_CAT_DROPDOWN,3, DOC_CAT_ACTION_ITEM)
#   sleep (1)
#   $driver.quit
# end
#
# Given(/^I Have Logged In As An Employee With Security Profile Access$/) do
#   startWebDriver
#   GoToThePage(DOCUMENT_ADMIN_PAGE)
#   EnterUsername(USER_NAME,DOC_SEC_PROF_USER)
#   EnterPassword(PASS_WORD,DOC_SEC_PROF_PASS)
#   LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
#   ValidateDocumentSectionisPresentUnderAdmin(DOCUMENT_PATH, DOC_TEXT,FORM_PATH,FORM_TEXT)
# end
#
# When(/^I Try To Access Documents Under Reports Tab$/) do
#   GoToReportsTab()
# end
#
# Then(/^I Should Be Able To View Pending Form Templates$/) do
#   VerifyThePendingFormTemplates()
# end
#
# When(/^I Have Revoked Access Through Role capability To View Doumnet Reports$/) do
#   RevokeDocumentViewAccessByUsingJmeterRubyService()
# end
#
# Then(/^I Shouldn't Be Able To View Reports Tab$/) do
#   GoToThePage(DOCUMENT_ADMIN_PAGE)
#   CheckReportsTabisUnavailable()
# #'roleType[capabilities][report][223]'=>'223',
#   GrantBackDocumentViewAccessByUsingJmeterRubyService()
# end
