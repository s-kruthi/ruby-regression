Given(/^That Legal Entity Is Enabled$/i) do
  CheckLegalEntityEnabled()
end


Then(/^I Should Be Able To See Legal Entities under General section$/i) do
  GoToASection(GENERAL_EXPAND)
  Sleep_Until(VerifyAnElementExists('xpath', LEGAL_ENTITIES_ID))
end


And(/^I Can (Add|Edit) A Legal Entity$/i) do |action|
  if action == 'Add'
    AddLegalEntity()
  else
    EditLegalEntity()
  end
end


Then(/^I Should Not See The ATO Details Tab$/i) do
  Sleep_Until(VerifyAnElementNotExist('xpath', '//a[@href="/admin/company/ato-details"]'))
end


Then(/^I Should See That Legal Entity Is Successfully Added$/i) do
  exists = $daos.check_legal_entity_exists(@abn_num)
  expect(exists[:presence]).to eq(1)
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LEGAL_ENTITY_SAVE_SUCCESSFUL_VALUE)
end


Then(/^I Should See That Legal Entity Is Updated Successfully$/i) do
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LEGAL_ENTITY_SAVE_SUCCESSFUL_VALUE)
end


And(/^I Click On Add Legal Entity Button$/i) do
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEGAL_ENTITY_ADD_ID))
end


When(/^I Enter An Valid ABN in the ABN Field$/i) do
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEGAL_ENTITY_ABN_ID, '50008458884'))
end


Then(/^I Should See The Corresponding Business Name As Suggestion$/i) do
  VerifyABNLookup()
end


And(/^I Should Be Able To Edit The Business Name$/i) do
  expect($driver.find_element(:id, 'legal_entity_businessName').enabled?).to be true
end


Then(/^I Should See That I Cannot Delete A Legal Entity$/i) do
  VerifyAnElementNotExist('xpath', '//button[@href="/admin/legal-entity/delete"]')
end


Then(/^I Should View Name, ABN, Is Default And Active Fields For Legal Entity$/i) do
  CheckPageDisplay()
end


And(/^I Edit The Default Legal Entity$/i) do
  #get default legal entity
  @legal_entity = $daos.get_default_entity_details()

  SearchToEdit(@legal_entity)
end


Then(/^I Should See That I Cannot Set The Entity To Inactive$/i) do
  expect($driver.find_element(:id,LEGAL_ENTITY_ISACTIVE_ID).enabled?).to be false
end


And(/^I Enter Existing Legal Entity Details$/i) do
  EnterExisitingEntityDetails()
end


Then(/^I Should Not Be Able To Create Legal Entities With Same ABN$/i) do
  Sleep_Until(WaitForAnElementByXPath(LEGAL_ENTITY_ABN_ALERT_ID))
  expect($driver.find_element(:xpath, LEGAL_ENTITY_ABN_ALERT_ID).attribute('id')).to eq(LEGAL_ENTITY_ABN_ID)
  expect($driver.find_element(:xpath, LEGAL_ENTITY_ALERT_TEXT_ID).text).to eq(LEGAL_ENTITY_ABN_IN_USE_ERR_VALUE)
end


Then(/^I Should See That I Cannot Set It As Not Default$/i) do
  Sleep_Until(WaitForAnElementByIdAndTouch(LEGAL_ENTITY_SAVE_ID))
  expect($driver.find_element(:id, LEGAL_ENTITY_ISACTIVE_ID).enabled?).to be false
  expect($driver.find_element(:id, LEGAL_ENTITY_ISDEF_ID).enabled?).to be false
  puts COLOR_GREEN + "There has to be one default legal entity, so cannot set it to not default".upcase
end


And(/^I Edit The Legal Entity Linked To User To Deactivate$/i) do
  EditLegalEntityLinkedToUser()
end


Then(/^I Should See That I Cannot Deactivate Legal Entity Linked To User$/i) do
  Sleep_Until(WaitForAnElementByXPath(LEGAL_ENTITY_ALERT_ID))
  expect($driver.find_element(:xpath, LEGAL_ENTITY_ALERT_TEXT_ID).text).to eq(LEGAL_ENTITY_LINKED_TO_USER_ERR_VALUE)
end