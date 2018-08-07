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
end


Then(/^I Should See That Legal Entity Is Updated Successfully$/i) do

end