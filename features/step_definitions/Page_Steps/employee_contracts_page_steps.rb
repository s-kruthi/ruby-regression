##TODO: Investigate wheather this is needed anymore or can be removed
def  GoToEmployeeContractsPageAsCompanyAdmin(admin_cog, employee_contracts_tab, employee_contract_list_path)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  sleep(2)
  goToDocumentsSection(employee_contracts_tab)
  sleep(2)
  goToItemLandingPage(employee_contract_list_path)
end

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
  SelectFromSelect2Input(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  sleep(1)
end

def EnterEmployeeContractDescriptionText(contract_desc_value, contract_desc_index)
  UseCkeditorToEnterText(contract_desc_value, contract_desc_index)
end

# def EnterEmployeeContractCode(contract_id, contract_value)
#   WaitForAnElementByXpathAndInputValue(contract_id, contract_value)
# end
#
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
end

def copy_a_client_contract()
end