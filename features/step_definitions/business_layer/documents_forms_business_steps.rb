Given(/^I Have Logged In as a Company Admin$/) do
  startWebDriver
  GoToThePage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,ELMO_COMP_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,ELMO_COMP_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


And(/^I Go To The Documents Form Templates Section$/) do
  goToTheDocumentsFormTemplatePageAsCompanyAdmin(ADMIN_COG, DOCUMENTS_EXPAND, DOCUMENTS_LIST_PATH)
end

When(/^I click on Create Form Template Button$/) do
  goToNewFormTemplateAddPage(CREATE_FORM_TEMPLATE_BTN)
end

And(/^I Enter New Form Template Details$/) do
  enterFormTemplateDetails(FORM_TEMP_TITLE, FORM_TEMP_TITLE_TXT, CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, 3)
  enterDescription(FORM_TEMP_DESC_TXT)
end

Then(/^I Should Be Able To Create A Form Template$/) do
  createAFormTemplateAndVerify(FORM_TEMPLATE_SAVE_BTN)
end


When(/^I Search For A Specific Form Template$/) do
  searchforAForFormTemplate(FORM_TEMP_SEARCH_BOX, FORM_TEMP_TITLE_TXT, SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Hide A Specific Form Template$/) do
  hideTheFirstFormTemplatePlanFromTheTable(DROPDOWN,3, ACTION_ITEM)
  $driver.quit
end

