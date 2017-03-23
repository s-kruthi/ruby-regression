
And(/^I Go To The Documents Files Section$/) do
  goToTheDocumentsAsCompanyAdmin(ADMIN_COG, DOCUMENTS_EXPAND, FILES_LIST_PATH)
end

When(/^I click on Add File Button$/) do
  goToAddFilePage(ADD_FILE_BTN)
end

And(/^I Enter File Details$/) do
  enterFileDetails(FILE_TITLE, FILE_TITLE_TXT, CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, 5)
  enterDescription(FILE_DESC_TXT)
  selectALabel(FILE_ID, FILE_LABEL_ID, FILE_LABEL_ID_INDEX)
end

And(/^I Select A File$/) do
  selectAfile(BROWSE_FILE_ID, FILE_NAME)
end

And(/^I Select Availability$/) do
  selectFileAvailability(AVAIL_DROPDOWN_OPTION)
end


Then(/^I Should Be Able To Create A File$/) do
  createAFileAndVerify(FORM_TEMPLATE_SAVE_BTN)
end


When(/^I Search For A Specific File$/) do
  searchforAForFormTemplate(FORM_TEMP_SEARCH_BOX, FORM_TEMP_TITLE_TXT, SEARCH_BTN_ID)
end


Then(/^I Should Be Able To See The File In The Search Result$/) do
  hideTheFirstFormTemplatePlanFromTheTable(DROPDOWN,3, ACTION_ITEM)
end

And(/^I Should Be Able To Delete A Specific File$/) do
  $driver.quit
end