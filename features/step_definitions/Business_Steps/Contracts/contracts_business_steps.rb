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
  @contract_details = $daos.get_contract_contractlib

  if @contract_details.nil?
    puts COLOR_YELLOW + "No contracts found for the criteria, please check manually".upcase
    skip_this_scenario
  end

  search_for_an_employee_contract_and_verify(EMP_CONTRACT_SEARCH_ID, @contract_details[:name], EMP_CONTRACT_SEARCH_BTN, @contract_details[:name])
  sleep(1)
end

When(/^I Search For An(:? Hidden)? Employee Contract$/i) do | contract_type |
  if contract_type == ' Hidden'
    @contract_details = $daos.get_hiddencontract_contractlib
  else
    @contract_details = $daos.get_contract_contractlib
  end

  if @contract_details.nil?
    puts COLOR_YELLOW + "No contracts found for the criteria, please check manually".upcase
    skip_this_scenario
  end

  search_for_an_employee_contract_and_verify(EMP_CONTRACT_SEARCH_ID, @contract_details[:name], EMP_CONTRACT_SEARCH_BTN, @contract_details[:name])
  sleep(1)
end

Then(/^I Should Be Able To "(\w+)" An Employee Contract$/i) do | action |
 case action
  when "Edit"
   EditEmpContract(@contract_details[:id])
  when "Copy"
   CopyEmpContract(@contract_details[:id])
  when "Hide","Unhide"
    HideUnhideEmpContract(@contract_details[:id], action)
 end
end
