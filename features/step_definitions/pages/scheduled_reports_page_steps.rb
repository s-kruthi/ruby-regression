def goToTab(link, index)
  WaitForAnElementByXpathAndTouchTheIndex(link, index)
end


def goToAddScheduledReportsPage(schd_reports_btn)
  WaitForAnElementByXpathAndTouch(schd_reports_btn)
end

def enterScheduledReportTitle(schd_report_name_id, schd_report_name_value)
    WaitForAnElementByXpathAndInputValue(schd_report_name_id, schd_report_name_value)
end

def enterFrequency(schd_report_freq_id, schd_report_freq_value)
  sleep(1)
  select_from_drop_down(schd_report_freq_id, schd_report_freq_value)
end

def enterStartandEndDate(report_start_date_id, report_start_date_value, report_end_date_id, report_end_date_value)
  WaitForAnElementByXpathAndInputValue(report_start_date_id, report_start_date_value)
  WaitForAnElementByXpathAndTouch(report_start_date_id)
  WaitForAnElementByXpathAndInputValue(report_end_date_id, report_end_date_value)
  WaitForAnElementByXpathAndTouch(report_end_date_id)
end

def selectAReport(reports_name_id, cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, report_name_filter_index_value)
  WaitForAnElementByXpathAndTouch(reports_name_id)
  sleep (2)
  select_from_select2_input(cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, report_name_filter_index_value)
  sleep(3)
end

def selectAScheduledReportFilter(filter_name_id, cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, schd_report_filter_index_value)
    WaitForAnElementByXpathAndTouch(filter_name_id)
    select_from_select2_input(cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, schd_report_filter_index_value)
end

def selectReportLevel(report_level_id, report_level_value)
    select_from_drop_down(report_level_id, report_level_value)
end

def selectReportFormat(report_format_id, report_format_value)
  select_from_drop_down(report_format_id, report_format_value)
end

def selectRecipients(reports_select_id, recipient_field_id, recipient1_field_value, recipient2_field_value, recipient1_result_id, recipient2_result_id)
  WaitForAnElementByXpathAndTouch(reports_select_id)
  WaitForAnElementByXpathAndInputValue(recipient_field_id, recipient1_field_value)
  sleep(2)
  WaitForAnElementByXpathAndTouch(recipient1_result_id)
  sleep (1)
  WaitForAnElementByXpathAndInputValue(recipient_field_id, recipient2_field_value)
  sleep(2)
  WaitForAnElementByXpathAndTouch(recipient2_result_id)
end

def selectShowAllDataOption(show_all_data_id, show_all_data_value)
  select_from_drop_down(show_all_data_id, show_all_data_value)
end

def enterSaveBtn(save_btn_id)
  WaitForAnElementByXpathAndTouch(save_btn_id)
end

#
# 
# def enterSubDomainName(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
#   select_from_select2_input(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
#   sleep(1)
# end
# 
# def enterContractCode(contract_id, contract_value)
#   WaitForAnElementByXpathAndInputValue(contract_id, contract_value)
# end
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
#   def createAClientContract(form_temp_save)
#   WaitForAnElementByXpathAndTouch(form_temp_save)
# end
# 
# def searchForAclientContractAndVerify(search_field, search_value, search_btn, search_result)
#   WaitForAnElementByXpathAndInputValue(search_field,search_value)
#   Wait_For(3)
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
