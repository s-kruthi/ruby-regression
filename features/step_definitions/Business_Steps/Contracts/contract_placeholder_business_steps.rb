And(/^I Enter The Contract Placeholder Title/i) do
  time = Time.now
  contract_placeholder_title = NEW_CONTRACT_PLACEHOLDER_TITLE + time.strftime("%Y%m%d%H%M%S").to_s
  $contract_placeholder_text_value = contract_placeholder_title
  Sleep_Until(EnterContractPlaceholderTitle(CONTRACT_PLACEHOLDER_TITLE_ID, contract_placeholder_title))
end

And(/^I Choose The Type as "([^"]*)"/i) do | contract_placeholder_type |
  Sleep_Until(SelectContractPlaceholderType(CONTRACT_PLACEHOLDER_SELECT_TYPE_ID, contract_placeholder_type))
end

And(/^I Enter The Contract Placeholder Text/i) do
  contract_placeholder_text = $contract_placeholder_text_value
  Sleep_Until(EnterContractPlaceholderText(CONTRACT_PLACEHOLDER_TEXT_ID, contract_placeholder_text))
end

Then(/^I Should Be Able To Create A New Contract Placeholder/i) do
  Sleep_Until(ClickSaveContractPlaceholder(CONTRACT_PLACEHOLDER_CREATE_SAVE_BTN_ID))
  Sleep_Until(VerifyContractPlaceholderCreationSuccessMessage(CONTRACT_PLACEHOLDER_SAVE_SUCCESS_ID, CONTRACT_PLACEHOLDER_SAVE_SUCCESS_VALUE))
end

Then(/^I Should See The Default Value field Has a CK Editor/i) do
  Sleep_Until(WaitForAnElementByXPath(CONTRACT_PLACEHOLDER_CKEDITOR_ID))
end

And(/^I Should See That The Field Is Limited to (\d+) characters/i) do | max_value |
  Sleep_Until(VerifyMaxLength(CONTRACT_TEXTAREA_DEFAULT_VALUE_ID,max_value))
end

And(/^I Should See The Instructional Text Indicating The Size Limitation/i) do
  Sleep_Until(WaitForAnElementByXPath(CONTRACT_PLACEHOLDER_INSTRUCTIONAL_TEXT_ID))
end

When(/^I Search For Contract Placeholders Starting With "([^"]*)"/i) do | contract_placeholder_name |
  CONTRACT_PLACEHOLDER_NAME = contract_placeholder_name
  SearchContractPlaceholder(CONTRACT_PLACEHOLDER_SEARCH_BOX_ID, CONTRACT_PLACEHOLDER_NAME, CONTRACT_PLACEHOLDER_SEARCH_BTN_ID)
end

Then(/^I Should Be Able To See The Contract Placeholders/i) do
  Sleep_Until(VerifyContractPlaceholderSearch(CONTRACT_PLACEHOLDER_SEARCH_RESULTS_ID, CONTRACT_PLACEHOLDER_NAME))
end

