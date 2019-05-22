When(/^I click on Add File Button$/i) do
  goToAddFilePage(ADD_FILE_BTN)
end

And(/^I Enter File Details$/i) do
  Sleep_Until(enterFileDetails(FILE_TITLE, FILE_TITLE_TXT))
  Sleep_Until(enterFileCategory(FILE_CATEGORY_ID, FILE_CATEGORY_VALUE))
  Sleep_Until(enterDescription(FILE_DESC_TXT, 0))
  selectALabel(FILE_ID, FILE_LABEL_ID, FILE_LABEL_ID_INDEX)
end

And(/^I Select A File$/i) do
  Sleep_Until(select_a_file(BROWSE_FILE_ID, DOCUMENT_FILE_NAME))
end

And(/^I Select Availability$/i) do
  Sleep_Until(selectFileAvailability(AVAIL_DROPDOWN_OPTION, AVAIL_DROPDOWN_VALUE))
end

Then(/^I Should Be Able To Create A File$/i) do
  ClickOnSaveButton(FORM_TEMPLATE_SAVE_BTN)
  VerifySuccessAlertMessage(FILE_SAVE_SUCCESSFUL_ID, FILE_SAVE_SUCCESSFUL_VALUE)
end

Then(/^I Should Be Able To Search For A Specific File$/i) do
  Sleep_Until(searchForAFileAndVerify(FILE_TEMP_SEARCH_BOX, FILE_TITLE_TXT, FILE_SEARCH_BTN_ID, FILE_SEARCH_RESULT))
end

Then(/^I Should Be Able To Delete A Specific File$/i) do
  Sleep_Until(deleteTheFirstFileFromTheTable(FILE_DROPDOWN,3, FILE_ACTION_DELETE))
end
