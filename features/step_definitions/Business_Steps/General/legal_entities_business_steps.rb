Given(/^That Legal Entity Is Enabled$/i) do
  CheckLegalEntityEnabled()
end


Then(/^I Should Be Able To See Legal Entities under General section$/i) do
  GoToASection(GENERAL_EXPAND)
  Sleep_Until(VerifyAnElementExists('xpath', LEGAL_ENTITIES_ID))
end


And(/^I Can Add A Legal Entity$/i) do
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEGAL_ENTITY_ADD_ID))
  abn_num = random_abn()
  byebug
end


Then(/^I Should Not See The ATO Details Tab$/i) do
  Sleep_Until(VerifyAnElementNotExist('xpath', '//a[@href="/admin/company/ato-details"]'))
end