When(/^I click on Add File Button$/i) do
  goToAddFilePage(ADD_FILE_BTN)
end

And(/^I Enter File Details$/i) do
  enterFileDetails(FILE_TITLE, FILE_TITLE_TXT, CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, 5)
  enterDescription(FILE_DESC_TXT, 0)
  selectALabel(FILE_ID, FILE_LABEL_ID, FILE_LABEL_ID_INDEX)
end

And(/^I Select A File$/i) do
  select_a_file(BROWSE_FILE_ID, DOCUMENT_FILE_NAME)
end

And(/^I Select Availability$/i) do
  selectFileAvailability(AVAIL_DROPDOWN_OPTION, AVAIL_DROPDOWN_VALUE)
end

Then(/^I Should Be Able To Create A File$/i) do
  createAFile(FORM_TEMPLATE_SAVE_BTN)
  sleep(1)
  verifySuccessMessage(FILE_SAVE_SUCCESSFUL_ID, FILE_SAVE_SUCCESSFUL_VALUE)
  $driver.quit
end

Then(/^I Should Be Able To Search For A Specific File$/i) do
    searchForAFileAndVerify(FILE_TEMP_SEARCH_BOX, FILE_TITLE_TXT, FILE_SEARCH_BTN_ID, FILE_SEARCH_RESULT)
    sleep (1)
    $driver.quit
end

Then(/^I Should Be Able To Delete A Specific File$/i) do
  deleteTheFirstFileFromTheTable(FILE_DROPDOWN,3, FILE_ACTION_DELETE)
  sleep(1)
  $driver.quit
end