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

def selectAReport(cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, report_name_filter_index_value)
  sleep (1)
  select_from_select2_input(cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, report_name_filter_index_value)
  sleep (1)
end

def selectAScheduledReportFilter(cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, schd_report_filter_index_value)
    select_from_select2_input(cat_pos_index_arrow_id, cat_pos_index_arrow_value, cat_pos_index_class, schd_report_filter_index_value)
    sleep (1)
end

def selectReportLevel(report_level_id, report_level_value)
    select_from_drop_down(report_level_id, report_level_value)
end

def selectReportFormat(report_format_id, report_format_value)
  select_from_drop_down(report_format_id, report_format_value)
end

def selectRecipients(recipient_field_id, recipient1_input_value, recipient2_input_value)
  $driver.find_element(:id, recipient_field_id).send_keys(recipient1_input_value)
  sleep(2)
  $driver.find_element(:id, recipient_field_id).send_keys(:return)
  sleep(1)
  $driver.find_element(:id, recipient_field_id).send_keys(recipient2_input_value)
  sleep(2)
  $driver.find_element(:id, recipient_field_id).send_keys(:return)
  sleep(1)
end

def selectShowAllDataOption(show_all_data_id, show_all_data_value)
  select_from_drop_down(show_all_data_id, show_all_data_value)
end

def enterSaveBtn(save_btn_id)
  WaitForAnElementByXpathAndTouch(save_btn_id)
end

def searchForAScheduledReportAndVerify(schd_report_search_id, schd_reports_name_value, schd_report_search_btn_id, schd_report_search_result_value)
  sleep (3)
  WaitForAnElementByXpathAndInputValue(schd_report_search_id,schd_reports_name_value)
  sleep (2)
  WaitForAnElementByXpathAndTouch(schd_report_search_btn_id)
  sleep (1)
  VerifyAnElementExistByXPath(schd_report_search_result_value,schd_reports_name_value)
end

def searchForAScheduledReport(schd_report_search_id, schd_reports_name_value, schd_report_search_btn_id, schd_report_search_result_value)
  sleep (3)
  WaitForAnElementByXpathAndInputValue(schd_report_search_id,schd_reports_name_value)
  sleep (2)
  WaitForAnElementByXpathAndTouch(schd_report_search_btn_id)
  sleep (1)
  VerifyAnElementExistByXPath(schd_report_search_result_value,schd_reports_name_value)
end

def editAScheduledReport(schd_report_edit_btn_id, schd_report_edit_btn_index_value)
  WaitForAnElementByXpathAndTouchTheIndex(schd_report_edit_btn_id, schd_report_edit_btn_index_value)
  sleep(1)
end

def deleteAScheduledReport(schd_report_delete_btn_value, schd_report_delete_index_value)
  sleep(1)
  WaitForAnElementByXpathAndTouchTheIndex(schd_report_delete_btn_value, schd_report_delete_index_value)
  sleep (1)
  PressEnterConfirm()
  sleep (1)
end