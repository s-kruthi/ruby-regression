When(/^I click on New Contract Button$/i) do
  go_to_new_employee_contracts_page(EMPLOYEE_NEW_CONTRACT_BTN)
  end

And(/^I Enter New Employee Contract Details$/i) do
    enter_employee_contract_title(EMP_CONTRACT_TITLE_ID, EMP_CONTRACT_DESC_VALUE)
    select_employee_contract_category(EMP_CONTRACT_CAT_INDEX_ID, 0, EMP_CONTRACT_CAT_RESULT_ID, 2) #Selects Recruitment from the dropdown
    enter_contract_description_text(EMP_CONTRACT_DESC_TEXT_ID, EMP_CONTRACT_DESC_VALUE)       #Enter a contract description
    enter_contract_description(EMP_CONTRACT_DESC_VALUE, 0) #Enter the Employee Contract Header Description
    enter_contract_description(EMP_CONTRACT_DESC_VALUE, 1)  #Enter the Contract Body Description
    # enter_employee_contract_header_image()
    enter_contract_description(EMP_CONTRACT_DESC_VALUE, 2)    #Enter the Contract Footer Description
    # enter_employee_contract_footer_image()
    sleep (1)
end

Then(/^I Should Be Able To Create A New Contract$/i) do
  create_an_employee_contract(EMP_CONTRACT_SAVE_BTN)
  sleep (2)
  VerifySuccessAlertMessage(EMP_CONTRACT_VERIFY_SAVE_SUCCESSFUL_ID, EMP_CONTRACT_VERIFY_SAVE_SUCCESSFUL_VALUE)
  $driver.quit
end


Then(/^I Should Be Able To Search For An Employee Contract$/i) do
  search_for_an_employee_contract_and_verify(EMP_CONTRACT_SEARCH_ID, EMP_CONTRACT_SEARCH_VALUE, EMP_CONTRACT_SEARCH_BTN, EMP_CONTRACT_SEARCH_RESULT)
  sleep(1)
  # $driver.quit
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