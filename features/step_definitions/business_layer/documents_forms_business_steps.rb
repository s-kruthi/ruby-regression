Given(/^I Have Logged In as a Company Admin$/) do
  startWebDriver
  GoToThePage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,COMP_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,COMP_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


And(/^I Go To The Documents Form Templates Section$/) do
  goToTheDocumentsAsCompanyAdmin(ADMIN_COG, DOCUMENTS_EXPAND, DOCUMENTS_LIST_PATH)
end

When(/^I click on Create Form Template Button$/) do
  goToNewFormTemplateAddPage(CREATE_FORM_TEMPLATE_BTN)
end

And(/^I Enter New Form Template Details$/) do
  enterFormTemplateDetails(FORM_TEMP_TITLE, FORM_TEMP_TITLE_TXT, CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, 3)
  enterDescription(FORM_TEMP_DESC_TXT, 0)
end

Then(/^I Should Be Able To Create A Form Template$/) do
  createAFormTemplateAndVerify(FORM_TEMPLATE_SAVE_BTN)
  findIdOfDocumentInstance()
  $driver.quit
end


When(/^I Search For A Specific Form Template$/) do
  searchforAForFormTemplate(FORM_TEMP_SEARCH_BOX, FORM_TEMP_TITLE_TXT, SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Hide A Specific Form Template$/) do
  hideTheFirstFormTemplatePlanFromTheTable(FORM_DROPDOWN,3, FORM_ACTION_ITEM)
  $driver.quit
end

And(/^I Go To The Documents Categories Section$/) do
  goToTheDocumentsAsCompanyAdmin(ADMIN_COG, DOCUMENTS_EXPAND, DOCUMENTS_CAT_LIST_PATH)
end

When(/^I click on Add Category Button$/) do
  goToNewDocumentCategoryPage(CREATE_DOCUMENT_CATEGORY_BTN)
end

And(/^I Enter New Document Category Details$/) do
  enterDocumentCategoryDetails(DOCUMENT_CATEGORY_TITLE_ID, DOCUMENT_CATEGORY_TITLE_TEXT)
  enterDescription(DOCUMENT_CATEGORY_DESC_TXT, 0)
end

Then(/^I Should Be Able To Create A Document Category$/) do
  createADocumentCategory(FORM_TEMPLATE_SAVE_BTN)
  verifySuccessMessage(DOCUMENT_CAT_SAVE_SUCCESS_ID, DOCUMENT_CAT_SAVE_SUCCESS_VALUE)
  $driver.quit
end


Then(/^I Should Be Able To Hide A Document Category$/) do
  hideTheFirstDocumentCategoryFromTheTable(DOC_CAT_DROPDOWN,3, DOC_CAT_ACTION_ITEM)
  sleep (1)
  $driver.quit
end