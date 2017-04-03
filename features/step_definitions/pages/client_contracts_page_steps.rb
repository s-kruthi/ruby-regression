
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
  useSelect2InPutField(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
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
  selectFromDropDown(currency_option_id, currency_option_value)
  sleep(1)
end

def enterExcessFeeValue(excess_fee_id, excess_fee_value)
  WaitForAnElementByXpathAndInputValue(excess_fee_id, excess_fee_value)
end

def enterUserToleranceValue(user_tolerance_id, user_tolerance_value)
  WaitForAnElementByXpathAndInputValue(user_tolerance_id, user_tolerance_value)
end

def enterProductsSelectionValue()
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
  selectFromDropDown(is_cc_client_id, is_cc_client_value)
  sleep(1)

end

def enterClientContractContactDetails(contact_firstname_id, contact_firstname_value, contact_lastname_id, contact_email_id, contact_email_value, contact_address_id, contact_address_value)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
  sleep(1)
  useSelect2InPutField(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
end


def createAClientContractAndVerify(form_temp_save)
  WaitForAnElementByXpathAndTouch(form_temp_save)
  sleep(3)
end

def searchforAForFormTemplate(search_box_id, form_temp_search_txt, search_btn_id)
  WaitForAnElementByXpathAndInputValue(search_box_id, form_temp_search_txt)
  WaitForAnElementByXpathAndTouch(search_btn_id)
  sleep(2)
end

def hideTheFirstFormTemplatePlanFromTheTable(class_name, index_value, partial_link_text)
  WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
  sleep (1)
  PressEnterConfirm()
  sleep(1)
end
