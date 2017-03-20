Given(/^I Have Logged In as a Company Admin$/) do
  startWebDriver
  GoToThePage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,ELMO_COMP_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,ELMO_COMP_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


And(/^I Go To The Documents Form Templates Section$/) do
  GoToTheDocumentsFormTemplatePageAsCompanyAdmin(ADMIN_COG, DOCUMENTS_EXPAND, DOCUMENTS_LIST_PATH)
end

When(/^I click on Create Form Template Button$/) do
  GoToNewFormTemplateAddPage(CREATE_FORM_TEMPLATE_BTN)
end

And(/^I Enter New Form Template Details$/) do
  EnterFormTemplateDetails(FORM_TEMP_TITLE, FORM_TEMP_TITLE_TXT, CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, 3)
  EnterDescription(FORM_TEMP_DESC_TXT)
end

Then(/^I Should Be Able To Create A Form Template$/) do
  CreateAFormTemplateAndVerify(FORM_TEMPLATE_SAVE_BTN)
end


And(/^I Search For A Specific Form Template$/) do
  SearchAFormTemplate()
end

  Then(/^I Should Be Able To Hide A Specific Form Template$/) do
  HideAFormTemplateAndVerify()
  $driver.quit
end
