And(/^I Enter The Placeholder Title/i) do
  time = Time.now
  placeholder_title = NEW_PLACEHOLDER_TITLE + time.strftime("%Y%m%d%H%M%S").to_s
  $placeholder_text_value = placeholder_title
  Sleep_Until(EnterPlaceholderTitle(PLACEHOLDER_TITLE_ID, placeholder_title))
end

And(/^I Choose The Type as "([^"]*)"/i) do | placeholder_type |
  Sleep_Until(SelectPlaceholderType(SELECT_TYPE_ID, placeholder_type))
end

And(/^I Enter The Placeholder Text/i) do
  placeholder_text = $placeholder_text_value
  Sleep_Until(EnterPlaceholderText(PLACEHOLDER_TEXT_ID, placeholder_text))
end

Then(/^I Should Be Able To Create A New Contract Placeholder/i) do
  Sleep_Until(ClickSavePlaceholder(PLACEHOLDER_CREATE_SAVE_BTN_ID))
  Sleep_Until(VerifyCreationSuccessMessage(PLACEHOLDER_SAVE_SUCCESS_ID, PLACEHOLDER_SAVE_SUCCESS_VALUE))
end

Then(/^I Should See The Default Value field Has a CK Editor/i) do
  Sleep_Until(WaitForAnElementByXPath(CONTRACT_PLACEHOLDER_CKEDITOR_ID))
end

And(/^I Should See That The Field Is Limited to (\d+) characters/i) do | max_value |
  Sleep_Until(VerifyMaxLength(TEXTAREA_DEFAULT_VALUE_ID,max_value))
end

And(/^I Should See The Instructional Text Indicating The Size Limitation/i) do
  Sleep_Until(WaitForAnElementByXPath(INSTRUCTIONAL_TEXT_ID))
end

When(/^I Search For Contract Placeholders Starting With "([^"]*)"/i) do | placeholder_name |
  SearchContractPlaceholder(placeholder_name)
end

Then(/^I Should Be Able To See The Placeholders/i) do
  pending
end

