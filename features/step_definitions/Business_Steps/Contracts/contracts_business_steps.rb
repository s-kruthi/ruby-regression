When(/^I click on New Contract Button$/i) do
  GoToNewEmployeeContractsPage(EMPLOYEE_NEW_CONTRACT_BTN)
  end

And(/^I Enter New Employee Contract Details$/i) do
    EnterEmployeeContractTitle(EMP_CONTRACT_TITLE_ID, EMP_CONTRACT_DESC_VALUE)
    SelectEmployeeContractCategory(EMP_CONTRACT_CAT_INDEX_ID, 0, EMP_CONTRACT_CAT_RESULT_ID, 2) #Selects Recruitment from the dropdown
    EnterEmployeeContractDescriptionText(EMP_CONTRACT_DESC_TEXT_ID, EMP_CONTRACT_DESC_VALUE)       #Enter a contract description
    UseCkeditorToEnterText(EMP_CONTRACT_DESC_VALUE, 0) #Enter the Employee Contract Header Description
    UseCkeditorToEnterText(EMP_CONTRACT_DESC_VALUE, 1)  #Enter the Contract Body Description
    UseCkeditorToEnterText(EMP_CONTRACT_DESC_VALUE, 2)    #Enter the Contract Footer Description
end

Then(/^I Should Be Able To Create A New Contract$/i) do
  CreateAnEmployeeContract(EMP_CONTRACT_SAVE_BTN)
  VerifySuccessAlertMessage(EMP_CONTRACT_VERIFY_SAVE_SUCCESSFUL_ID, EMP_CONTRACT_VERIFY_SAVE_SUCCESSFUL_VALUE)
end

Then(/^I Should Be Able To Search For An Employee Contract$/i) do
  search_for_an_employee_contract_and_verify(EMP_CONTRACT_SEARCH_ID, EMP_CONTRACT_SEARCH_VALUE, EMP_CONTRACT_SEARCH_BTN, EMP_CONTRACT_SEARCH_RESULT)
  sleep(1)
end

When(/^I Search For An Employee Contract$/i) do
  search_for_an_employee_contract_and_verify(EMP_CONTRACT_SEARCH_ID, EMP_CONTRACT_SEARCH_VALUE, EMP_CONTRACT_SEARCH_BTN, EMP_CONTRACT_SEARCH_RESULT)
  sleep(1)
end

Then(/^I Should Be Able To Edit An Employee Contract$/i) do
  edit_a_client_contract(test_variable)
end

Then(/^I Should Be Able To Copy An Employee Contract$/i) do
  copy_a_client_contract()
end