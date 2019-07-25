def GoToNewEmployeeContractsPage(employee_new_contract_btn)
  WaitForAnElementByXpathAndTouch(employee_new_contract_btn)
end

def EnterEmployeeContractTitle(emp_contract_title_id, emp_contract_title_value)
  WaitForAnElementByXpathAndInputValue(emp_contract_title_id, emp_contract_title_value)
end

def EnterEmployeeContractDescriptionText(emp_contract_desc_text_id, emp_contract_desc_value)
  WaitForAnElementByXpathAndInputValue(emp_contract_desc_text_id, emp_contract_desc_value)
end

def SelectEmployeeContractCategory(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  SelectFromSelect2Dropdown(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  sleep(1)
end

def CreateAnEmployeeContract(emp_contract_save_btn)
  WaitForAnElementByXpathAndTouch(emp_contract_save_btn)
end

def search_for_an_employee_contract_and_verify(search_field, search_value, search_btn, search_result)
  WaitForAnElementByXpathAndInputValue(search_field,search_value)
  Wait_For(2)
  WaitForAnElementByXpathAndTouch(search_btn)
  sleep (1)
  search_result_id = "//td[contains(.,'" + search_result + "')]"
  VerifyAnElementExistByXPath(search_result_id,search_value)
end

def EditEmpContract(contract_id)
  edit_contract_id = '//a[contains(@href, "/edit/'+ contract_id.to_s+'")]'
  WaitForAnElementByXpathAndTouch(edit_contract_id)
  WaitForAnElementByXpathAndClearValue(EMP_CONTRACT_DESC_TEXT_ID)
  EnterEmployeeContractDescriptionText(EMP_CONTRACT_DESC_TEXT_ID, EMP_CONTRACT_DESC_VALUE)
  CreateAnEmployeeContract(EMP_CONTRACT_SAVE_BTN)
  VerifySuccessAlertMessage(EMP_CONTRACT_VERIFY_SAVE_SUCCESSFUL_ID, EMP_CONTRACT_VERIFY_SAVE_SUCCESSFUL_VALUE)
end

def CopyEmpContract(contract_id)
  WaitForAnElementByXpathAndTouch(SEARCH_RESULTS_ACTIONS_ID)
  copy_contract_id = '//a[contains(@href, "/copy/'+ contract_id.to_s+'")]'
  Sleep_Until(WaitForAnElementByXpathAndTouch(copy_contract_id))
  Sleep_Until(VerifyAnElementExistByXPath(MODAL_ID, EMP_CONTRACT_VERIFY_COPY_SUCCESSFUL_VALUE))
  Sleep_Until(PressEnterOK())
end

def HideUnhideEmpContract(contract_id, action)
  WaitForAnElementByXpathAndTouch(SEARCH_RESULTS_ACTIONS_ID)
  if action == "Hide"
    contract_id = '//a[contains(@href, "/hide/'+ contract_id.to_s+'")]'
  else
    contract_id = '//a[contains(@href, "/unhide/'+ contract_id.to_s+'")]'
  end
    Sleep_Until(WaitForAnElementByXpathAndTouch(contract_id))
  VerifySuccessAlertMessage(EMP_CONTRACT_VERIFY_SAVE_SUCCESSFUL_ID, EMP_CONTRACT_VERIFY_VISIBILITY_SUCCESSFUL_VALUE)
end