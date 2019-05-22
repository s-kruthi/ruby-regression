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
  VerifyAnElementExistByXPath(search_result,search_value)
end

def edit_a_client_contract(test_variable)
  pending
end

def copy_a_client_contract()
  pending
end