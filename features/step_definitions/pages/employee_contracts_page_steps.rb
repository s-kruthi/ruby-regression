
def  go_to_employee_contracts_page_as_company_admin(admin_cog, employee_contracts_tab, employee_contract_list_path)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  sleep(2)
  goToDocumentsSection(employee_contracts_tab)
  sleep(2)
  goToItemLandingPage(employee_contract_list_path)
end

def go_to_new_employee_contracts_page(employee_new_contract_btn)
  WaitForAnElementByXpathAndTouch(employee_new_contract_btn)
end

def enter_employee_contract_title(emp_contract_title_id, emp_contract_title_value)
  WaitForAnElementByXpathAndInputValue(emp_contract_title_id, emp_contract_title_value)
end

def enter_contract_description_text(emp_contract_desc_text_id, emp_contract_desc_value)
  WaitForAnElementByXpathAndInputValue(emp_contract_desc_text_id, emp_contract_desc_value)
end

def select_employee_contract_category(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  select_from_select2_input(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  sleep(1)
end

def enter_contract_description(contract_desc_value, contract_desc_index)
  use_ckeditor_to_enter_description(contract_desc_value, contract_desc_index)
end

# def enter_contract_code(contract_id, contract_value)
#   WaitForAnElementByXpathAndInputValue(contract_id, contract_value)
# end
#
def create_an_employee_contract(emp_contract_save_btn)
  WaitForAnElementByXpathAndTouch(emp_contract_save_btn)
end

#
# def enterIsActiveStatus(client_active_status_toggle)
#     WaitForAnElementByXpathAndTouch(client_active_status_toggle)
# end
#
# def enterStartDate(start_date_id, start_date_value)
#   WaitForAnElementByXpathAndInputValue(start_date_id, start_date_value)
#   WaitForAnElementByXpathAndTouch(start_date_id)
# end
#
# def enterEndDate(end_date_id, end_date_value)
#   WaitForAnElementByXpathAndInputValue(end_date_id, end_date_value)
#   WaitForAnElementByXpathAndTouch(end_date_id)
# end
#
# def enterIsUnlimitedUserValue(unlimited_user_id)
#     WaitForAnElementByXpathAndTouch(unlimited_user_id)
# end
#
# def enterSubscriberUserValue(subscriber_number_id, subscriber_number_value)
#   WaitForAnElementByXpathAndInputValue(subscriber_number_id, subscriber_number_value)
# end
#
# def enterCurrencyValue(currency_option_id, currency_option_value)
#   select_from_drop_down(currency_option_id, currency_option_value)
#   sleep(1)
# end
#
# def enterExcessFeeValue(excess_fee_id, excess_fee_value)
#   WaitForAnElementByXpathAndInputValue(excess_fee_id, excess_fee_value)
# end
#
# def enterUserToleranceValue(user_tolerance_id, user_tolerance_value)
#   WaitForAnElementByXpathAndInputValue(user_tolerance_id, user_tolerance_value)
# end
#
# def enterProductsSelectionValue(product_option_id, product_option_value_1, product_option_value_2, product_option_value_3)
#   select_from_drop_down(product_option_id, product_option_value_1)
#   select_from_drop_down(product_option_id, product_option_value_2)
#   select_from_drop_down(product_option_id, product_option_value_3)
# end
#
# def enterExceptionsTermsOfPaymentText(payment_terms_id, payment_terms_value)
#   WaitForAnElementByXpathAndInputValue(payment_terms_id, payment_terms_value)
# end
#
#
# def enterStorageAllocationValue(storage_alloc_id, storage_alloc_value)
#   WaitForAnElementByXpathAndInputValue(storage_alloc_id, storage_alloc_value)
# end
#
#
# def enterBandwidthAllocationValue(bandwidth_alloc_id, bandwidth_alloc_value)
#   WaitForAnElementByXpathAndInputValue(bandwidth_alloc_id, bandwidth_alloc_value)
# end
#
# def enterIsCreditCardClientValue(is_cc_client_id, is_cc_client_value)
#   select_from_drop_down(is_cc_client_id, is_cc_client_value)
#   sleep(1)
#
# end
#
# def enterClientContractContactDetails(contact_firstname_id, contact_firstname_value, contact_lastname_id, contact_lastname_value, contact_email_id, contact_email_value, contact_address_id, contact_address_value)
#   WaitForAnElementByXpathAndInputValue(contact_firstname_id, contact_firstname_value)
#   WaitForAnElementByXpathAndInputValue(contact_lastname_id, contact_lastname_value)
#   WaitForAnElementByXpathAndInputValue(contact_email_id, contact_email_value)
#   WaitForAnElementByXpathAndInputValue(contact_address_id, contact_address_value)
# end
#
#
# def searchForAclientContractAndVerify(search_field, search_value, search_btn, search_result)
#   WaitForAnElementByXpathAndInputValue(search_field,search_value)
#   Wait_For(2)
#   WaitForAnElementByXpathAndTouch(search_btn)
#   sleep (1)
#   VerifyAnElementExistByXPath(search_result,search_value)
#  end
#
# def verifySuccessMessage(success_alert_id, success_alert_value)
#   VerifyAnElementExistByXPath(success_alert_id,success_alert_value)
# end
#
# def editAclientContract(class_name, index_value, partial_link_text)
#   WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
#   sleep(1)
#   WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
#   sleep( 1)
# end
