Given(/^That Legal Entity Is Enabled$/i) do
  CheckLegalEntityEnabled()
end


Then(/^I Should Be Able To See Legal Entities under General section$/i) do
  GoToASection(GENERAL_EXPAND)
  Sleep_Until(VerifyAnElementExists('xpath', LEGAL_ENTITIES_ID))
end


And(/^I Can (Add|Edit) A Legal Entity$/i) do |action|
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEGAL_ENTITY_ADD_ID))
  abn_num = random_abn()
  #check db for abn is not in use
  byebug
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ABN_ID, abn_num))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_BUS_NAME_ID, (LEGAL_ENTITY_BUS_NAME +Time.now.strftime("%Y%m%d%H%M%S").to_s)))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ADDR1_ID, LEGAL_ENTITY_ADDR1))
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_SUBURB_ID, LEGAL_ENTITY_ADDR1))
  Sleep_Until(SelectFromDropDown(LEGAL_ENTITY_STATE_DROPDOWN_ID, 'Australia'))
  byebug
end


Then(/^I Should Not See The ATO Details Tab$/i) do
  Sleep_Until(VerifyAnElementNotExist('xpath', '//a[@href="/admin/company/ato-details"]'))
end