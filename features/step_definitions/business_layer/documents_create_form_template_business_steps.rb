Given(/^I Have Logged In as a Company Admin$/) do
  startWebDriver
  GoToThePage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,ELMO_COMP_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,ELMO_COMP_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


When(/^I Go To The Documents Form Templates Section$/) do
  GoToTheDocumentsFormTemplatePageAsCompanyAdmin(ADMIN_COG, DOCUMENTS_EXPAND, DOCUMENTS_LIST_PATH)
end


Then(/^I Should Be Able To Create A Form Template$/) do
  CreateAFormTemplateAndVerify(CREATE_FORM_TEMPLATE_BTN, FORM_TEMPLATE_TITLE, FORM_TEMPLATE_TITLE_TEXT, FORM_TEMPLATE_CATEGORY, FORM_TEMPLATE_SAVE_BTN)
end


And(/^I Search For A Specific Form Template$/) do
  SearchAFormTemplate()
end

  Then(/^I Should Be Able To Hide A Specific Form Template$/) do
  HideAFormTemplateAndVerify()
  $driver.quit
end
