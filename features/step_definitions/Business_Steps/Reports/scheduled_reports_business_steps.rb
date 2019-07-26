And(/^I Go To The Scheduled Reports Section$/i) do
  goToTab(REPORTS_TAB_ID, 1)
  sleep (2)
  goToTab(SCH_REPORTS_TAB_ID, 0)
  sleep (1)
end

When(/^I click on Scheduled Report Button$/i) do
  goToAddScheduledReportsPage(SCHD_REPORTS_BTN_ID)
  sleep( 2)
  end

And(/^I Enter Scheduled Report Details$/i) do
  enterScheduledReportTitle(SCHD_REPORTS_NAME_ID, SCHD_REPORTS_NAME_VALUE)
  sleep (1)
  enterFrequency(SCHD_REPORTS_FREQ_ID, SCHD_REPORTS_FREQ_VALUE)
  sleep (1)
  enterStartandEndDate(SCHD_REPORTS_START_DATE_ID, SCHD_REPORTS_START_DATE_VALUE, SCHD_REPORTS_END_DATE_ID, SCHD_REPORTS_END_DATE_VALUE)
  sleep (1)
  selectAReport(REPORT_NAME_INDEX_NAME_ID, 0, REPORT_NAME_RESULT_ID, REPORTS_NAME_INDEX_VALUE)
  sleep(2)
  selectAScheduledReportFilter(REPORT_NAME_INDEX_NAME_ID, 0, REPORT_NAME_RESULT_ID, SCHD_REPORTS_FILTER_INDEX_VALUE)
  sleep (1)
  selectReportLevel(REPORTS_LEVEL_ID, REPORTS_LEVEL_VALUE)
  selectReportFormat(REPORTS_FORMAT_ID, REPORTS_FORMAT_VALUE)
  selectRecipients(RECIPIENT_FIELD_ID, RECIPIENT1_INPUT_VALUE, RECIPIENT2_INPUT_VALUE)
  sleep (1)
  selectShowAllDataOption(SHOW_ALL_DATA_ID, SHOW_ALL_DATA_VALUE)
  sleep (1)
end

Then(/^I Should Be Able To Create A Scheduled Report$/i) do
  enterSaveBtn(REPORTS_SAVE_BTN_ID)
  sleep (2)
  VerifySuccessAlertMessage(SCHD_REPORT_VERIFY_SAVE_SUCCESSFUL_ID, SCHD_REPORT_VERIFY_SAVE_SUCCESSFUL_VALUE)
  sleep(1)
  $driver.quit
end

Then(/^I Should Be Able To Search For A Specific Scheduled Report$/i) do
  searchForAScheduledReportAndVerify(SCHD_REPORT_SEARCH_ID, SCHD_REPORTS_NAME_VALUE, SCHD_REPORT_SEARCH_BTN_ID, SCHD_REPORT_SEARCH_RESULT_VALUE)
  sleep(1)
  $driver.quit
end

When(/^I Search For A Specific Scheduled Report$/i) do
  searchForAScheduledReport(SCHD_REPORT_SEARCH_ID, SCHD_REPORTS_NAME_VALUE, SCHD_REPORT_SEARCH_BTN_ID, SCHD_REPORT_SEARCH_RESULT_VALUE)
end

Then(/^I Should Be Able To Edit That Specific Scheduled Report$/i) do
  editAScheduledReport(SCHD_REPORT_EDIT_BTN_VALUE, 0)      #Edit the 1st available reseult
  $driver.quit
end

Then(/^I Should Be Able To Delete That Specific Scheduled Report$/i) do
  deleteAScheduledReport(SCHD_REPORT_DELETE_BTN_VALUE, 0) #Delete the 1st available reseult)
  sleep(2)
  VerifySuccessAlertMessage(SCHD_REPORT_VERIFY_DELETE_SUCCESSFUL_ID, SCHD_REPORT_VERIFY_DELETE_SUCCESSFUL_VALUE)
  sleep(1)
  PressEnterOK()
  sleep(1)
  $driver.quit
  end