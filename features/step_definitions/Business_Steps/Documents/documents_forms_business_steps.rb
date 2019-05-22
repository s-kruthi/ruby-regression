When(/^I click on Create Form Template Button$/i) do
  goToNewFormTemplateAddPage(CREATE_FORM_TEMPLATE_BTN)
end

And(/^I Enter New Form Template Details$/i) do
  Sleep_Until(enterFormTemplateDetails(FORM_TEMP_TITLE, FORM_TEMP_TITLE_TXT))
  Sleep_Until(SingleSelectFromSelect2Dropdown(DOCUMENT_CATEGORY_ID, DOCUMENT_CATEGORY_DROPDOWN_SEARCH_CLASS, DOCUMENT_CATEGORY_TITLE_TEXT , DOCUMENT_CATEGORY_DROPDOWN_RESULT_CLASS))
  Sleep_Until(enterDescription(FORM_TEMP_DESC_TXT, 0))
end

Then(/^I Should Be Able To Create A Form Template$/i) do
  createAFormTemplateAndVerify(FORM_TEMPLATE_SAVE_BTN)
  findIdOfDocumentInstance()
end

When(/^I Search For A Specific Form Template$/i) do
  searchforAForFormTemplate(FORM_TEMP_SEARCH_BOX, FORM_TEMP_TITLE_TXT, SEARCH_BTN_ID)
end

Then(/^I Should Be Able To Hide A Specific Form Template$/i) do
  hideTheFirstFormTemplatePlanFromTheTable(FORM_DROPDOWN,3, FORM_ACTION_ITEM)
end

When(/^I click on Add Category Button$/i) do
  goToNewDocumentCategoryPage(CREATE_DOCUMENT_CATEGORY_BTN)
end

And(/^I Enter New Document Category Details$/i) do
  enterDocumentCategoryDetails(DOCUMENT_CATEGORY_TITLE_ID, DOCUMENT_CATEGORY_TITLE_TEXT)
  enterDescription(DOCUMENT_CATEGORY_DESC_TXT, 0)
end

Then(/^I Should Be Able To Create A Document Category$/i) do
  createADocumentCategory(FORM_TEMPLATE_SAVE_BTN)
  VerifySuccessAlertMessage(DOCUMENT_CAT_SAVE_SUCCESS_ID, DOCUMENT_CAT_SAVE_SUCCESS_VALUE)
end

Then(/^I Should Be Able To Hide A Document Category$/i) do
  hideTheFirstDocumentCategoryFromTheTable(DOC_CAT_DROPDOWN,3, DOC_CAT_ACTION_ITEM)
  sleep (1)
end

Given(/^I Have Logged In As An Employee With Security Profile Access$/i) do
   startWebDriver
   GoToThePage(DOCUMENT_ADMIN_PAGE)
  EnterUsername(USER_NAME,DOC_SEC_PROF_USER)
  EnterPassword(PASS_WORD,DOC_SEC_PROF_PASS)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
   ValidateDocumentSectionisPresentUnderAdmin(DOCUMENT_PATH, DOC_TEXT,FORM_PATH,FORM_TEXT)
end

When(/^I Try To Access Documents Under Reports Tab$/i) do
  GoToReportsTab()
end

Then(/^I Should Be Able To View Pending Form Templates$/i) do
  VerifyThePendingFormTemplates()
end

When(/^I Have Revoked Access Through Role capability To View Doumnet Reports$/i) do
  RevokeDocumentViewAccessByUsingJmeterRubyService()
end

Then(/^I Shouldn't Be Able To View Reports Tab$/i) do
  GoToThePage(DOCUMENT_ADMIN_PAGE)
  CheckReportsTabisUnavailable()
#'roleType[capabilities][report][223]'=>'223',
  GrantBackDocumentViewAccessByUsingJmeterRubyService()
end
