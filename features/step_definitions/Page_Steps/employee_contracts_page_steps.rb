
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

def EnterEmployeeContractDescription_text(emp_contract_desc_text_id, emp_contract_desc_value)
  WaitForAnElementByXpathAndInputValue(emp_contract_desc_text_id, emp_contract_desc_value)
end

def SelectEmployeeContractCategory(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  SelectFromSelect2Input(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  sleep(1)
end

def EnterEmployeeContractDescription(contract_desc_value, contract_desc_index)
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

#
# def EnterIsActiveStatus(client_active_status_toggle)
#     WaitForAnElementByXpathAndTouch(client_active_status_toggle)
# end
#
# def EnterStartDate(start_date_id, start_date_value)
#   WaitForAnElementByXpathAndInputValue(start_date_id, start_date_value)
#   WaitForAnElementByXpathAndTouch(start_date_id)
# end
#
# def EnterEndDate(end_date_id, end_date_value)
#   WaitForAnElementByXpathAndInputValue(end_date_id, end_date_value)
#   WaitForAnElementByXpathAndTouch(end_date_id)
# end
#
# def EnterIsUnlimitedUserValue(unlimited_user_id)
#     WaitForAnElementByXpathAndTouch(unlimited_user_id)
# end
#
# def EnterSubscriberUserValue(subscriber_number_id, subscriber_number_value)
#   WaitForAnElementByXpathAndInputValue(subscriber_number_id, subscriber_number_value)
# end
#
# def EnterCurrencyValue(currency_option_id, currency_option_value)
#   SelectFromDropDown(currency_option_id, currency_option_value)
#   sleep(1)
# end
#
# def EnterExcessFeeValue(excess_fee_id, excess_fee_value)
#   WaitForAnElementByXpathAndInputValue(excess_fee_id, excess_fee_value)
# end
#
# def EnterUserToleranceValue(user_tolerance_id, user_tolerance_value)
#   WaitForAnElementByXpathAndInputValue(user_tolerance_id, user_tolerance_value)
# end
#
# def EnterProductsSelectionValue(product_option_id, product_option_value_1, product_option_value_2, product_option_value_3)
#   SelectFromDropDown(product_option_id, product_option_value_1)
#   SelectFromDropDown(product_option_id, product_option_value_2)
#   SelectFromDropDown(product_option_id, product_option_value_3)
# end
#
# def EnterExceptionsTermsOfPaymentText(payment_terms_id, payment_terms_value)
#   WaitForAnElementByXpathAndInputValue(payment_terms_id, payment_terms_value)
# end
#
#
# def EnterStorageAllocationValue(storage_alloc_id, storage_alloc_value)
#   WaitForAnElementByXpathAndInputValue(storage_alloc_id, storage_alloc_value)
# end
#
#
# def EnterBandwidthAllocationValue(bandwidth_alloc_id, bandwidth_alloc_value)
#   WaitForAnElementByXpathAndInputValue(bandwidth_alloc_id, bandwidth_alloc_value)
# end
#
# def EnterIsCreditCardClientValue(is_cc_client_id, is_cc_client_value)
#   SelectFromDropDown(is_cc_client_id, is_cc_client_value)
#   sleep(1)
#
# end
#
# def EnterClientContractContactDetails(contact_firstname_id, contact_firstname_value, contact_lastname_id, contact_lastname_value, contact_email_id, contact_email_value, contact_address_id, contact_address_value)
#   WaitForAnElementByXpathAndInputValue(contact_firstname_id, contact_firstname_value)
#   WaitForAnElementByXpathAndInputValue(contact_lastname_id, contact_lastname_value)
#   WaitForAnElementByXpathAndInputValue(contact_email_id, contact_email_value)
#   WaitForAnElementByXpathAndInputValue(contact_address_id, contact_address_value)
# end
#
#
#
# def VerifySuccessAlertMessage(success_alert_id, success_alert_value)
#   VerifyAnElementExistByXPath(success_alert_id,success_alert_value)
# end
#
# def EditAclientContract(class_name, index_value, partial_link_text)
#   WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
#   sleep(1)
#   WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
#   sleep( 1)
# end
