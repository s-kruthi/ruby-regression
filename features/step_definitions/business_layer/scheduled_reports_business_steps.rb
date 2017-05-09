And(/^I Go To The Scheduled Reports Section$/) do
  goToTab(REPORTS_TAB_ID, 1)
  sleep (2)
  goToTab(SCH_REPORTS_TAB_ID, 0)
  sleep (1)
end

When(/^I click on Scheduled Report Button$/) do
  goToAddScheduledReportsPage(SCHD_REPORTS_BTN_ID)
  sleep( 2)
  end

And(/^I Enter Scheduled Report Details$/) do
  enterScheduledReportTitle(SCHD_REPORTS_NAME_ID, SCHD_REPORTS_NAME_VALUE)
  sleep (1)
  enterFrequency(SCHD_REPORTS_FREQ_ID, SCHD_REPORTS_FREQ_VALUE)
  sleep (1)
  enterStartandEndDate(SCHD_REPORTS_START_DATE_ID, SCHD_REPORTS_START_DATE_VALUE, SCHD_REPORTS_END_DATE_ID, SCHD_REPORTS_END_DATE_VALUE)
  sleep (1)
  selectAReport(REPORTS_NAME_ID, CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, REPORTS_NAME_FILTER_INDEX_VALUE)
  sleep(1)
  selectAScheduledReportFilter(FILTER_NAME_ID, CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, SCHD_REPORTS_FILTER_INDEX_VALUE)
  sleep (1)

  selectReportLevel(REPORTS_LEVEL_ID, REPORTS_LEVEL_VALUE)
  selectReportFormat(REPORTS_FORMAT_ID, REPORTS_FORMAT_VALUE)
  selectRecipients(RECIPIENT_FIELD_ID, RECIPIENT1_FIELD_VALUE, RRECIPIENT2_FIELD_VALUE, RECIPIENT1_RESULT_ID, RECIPIENT2_RESULT_ID)
  sleep (1)
  selectShowAllDataOption(SHOW_ALL_DATA_ID, SHOW_ALL_DATA_VALUE)
  sleep (1)
end


Then(/^I Should Be Able To Create A Scheduled Report$/) do
  enterSaveBtn(REPORTS_SAVE_BTN_ID)
  sleep (2)
  verifySuccessMessage(VERIFY_SAVE_SUCCESSFUL_ID, VERIFY_SAVE_SUCCESSFUL_VALUE)
  sleep(1)
  $driver.quit
end


Then(/^I Should Be Able To Search For A Specific Scheduled Report$/) do
  searchForAScheduledReportAndVerify(CONTRACT_SEARCH_ID, CONTRACT_SEARCH_VALUE, CONTRACT_SEARCH_BTN, CONTRACT_SEARCH_RESULT)
  sleep(1)
end

When(/^I Search For A Specific Scheduled Report$/) do
  searchForAScheduledReport(CONTRACT_SEARCH_ID, CONTRACT_SEARCH_VALUE, CONTRACT_SEARCH_BTN, CONTRACT_SEARCH_RESULT)
end

Then(/^I Should Be Able To Hide That Specific Scheduled Report$/) do
  hideAScheduledReport()
end

Then(/^I Should Be Able To Delete That Specific Scheduled Report$/) do
  deleteAScheduledReport()
  verifySuccessMessage(VERIFY_SAVE_SUCCESSFUL_ID, VERIFY_SAVE_SUCCESSFUL_VALUE)
  sleep(1)
  $driver.quit
  end