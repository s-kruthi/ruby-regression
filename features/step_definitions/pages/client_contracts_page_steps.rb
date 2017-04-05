
def loginToSystem(tag_name)
  TouchLoginButton(tag_name)
  Wait_For(3)
  puts $driver.title
end

def goToClientContractsTab(client_contracts_tab)
  WaitForAnElementByXpathAndTouch(client_contracts_tab)
end


def goToAddClientContractsPage(client_contract_add_btn)
  WaitForAnElementByXpathAndTouch(client_contract_add_btn)
end


def enterSubDomainName(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  select_from_select2_input(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  sleep(1)
end

def enterContractCode(contract_id, contract_value)
  WaitForAnElementByXpathAndInputValue(contract_id, contract_value)
end

def enterIsActiveStatus(client_active_status_toggle)
    WaitForAnElementByXpathAndTouch(client_active_status_toggle)
end

def enterStartDate(start_date_id, start_date_value)
  WaitForAnElementByXpathAndInputValue(start_date_id, start_date_value)
  WaitForAnElementByXpathAndTouch(start_date_id)
end

def enterEndDate(end_date_id, end_date_value)
  WaitForAnElementByXpathAndInputValue(end_date_id, end_date_value)
  WaitForAnElementByXpathAndTouch(end_date_id)
end

def enterIsUnlimitedUserValue(unlimited_user_id)
    WaitForAnElementByXpathAndTouch(unlimited_user_id)
end

def enterSubscriberUserValue(subscriber_number_id, subscriber_number_value)
  WaitForAnElementByXpathAndInputValue(subscriber_number_id, subscriber_number_value)
end

def enterCurrencyValue(currency_option_id, currency_option_value)
  select_from_drop_down(currency_option_id, currency_option_value)
  sleep(1)
end

def enterExcessFeeValue(excess_fee_id, excess_fee_value)
  WaitForAnElementByXpathAndInputValue(excess_fee_id, excess_fee_value)
end

def enterUserToleranceValue(user_tolerance_id, user_tolerance_value)
  WaitForAnElementByXpathAndInputValue(user_tolerance_id, user_tolerance_value)
end

def enterProductsSelectionValue(product_option_id, product_option_value_1, product_option_value_2, product_option_value_3)
  select_from_drop_down(product_option_id, product_option_value_1)
  select_from_drop_down(product_option_id, product_option_value_2)
  select_from_drop_down(product_option_id, product_option_value_3)
end

def enterExceptionsTermsOfPaymentText(payment_terms_id, payment_terms_value)
  WaitForAnElementByXpathAndInputValue(payment_terms_id, payment_terms_value)
end


def enterStorageAllocationValue(storage_alloc_id, storage_alloc_value)
  WaitForAnElementByXpathAndInputValue(storage_alloc_id, storage_alloc_value)
end


def enterBandwidthAllocationValue(bandwidth_alloc_id, bandwidth_alloc_value)
  WaitForAnElementByXpathAndInputValue(bandwidth_alloc_id, bandwidth_alloc_value)
end

def enterIsCreditCardClientValue(is_cc_client_id, is_cc_client_value)
  select_from_drop_down(is_cc_client_id, is_cc_client_value)
  sleep(1)

end

def enterClientContractContactDetails(contact_firstname_id, contact_firstname_value, contact_lastname_id, contact_lastname_value, contact_email_id, contact_email_value, contact_address_id, contact_address_value)
  WaitForAnElementByXpathAndInputValue(contact_firstname_id, contact_firstname_value)
  WaitForAnElementByXpathAndInputValue(contact_lastname_id, contact_lastname_value)
  WaitForAnElementByXpathAndInputValue(contact_email_id, contact_email_value)
  WaitForAnElementByXpathAndInputValue(contact_address_id, contact_address_value)
end

  def createAClientContract(form_temp_save)
  WaitForAnElementByXpathAndTouch(form_temp_save)
end

def searchForAclientContractAndVerify(search_field, search_value, search_btn, search_result)
  WaitForAnElementByXpathAndInputValue(search_field,search_value)
  Wait_For(3)
  WaitForAnElementByXpathAndTouch(search_btn)
  sleep (1)
  VerifyAnElementExistByXPath(search_result,search_value)
 end

def verifySuccessMessage(success_alert_id, success_alert_value)
  VerifyAnElementExistByXPath(success_alert_id,success_alert_value)
end

def editAclientContract(class_name, index_value, partial_link_text)
  WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
  sleep( 1)
end
