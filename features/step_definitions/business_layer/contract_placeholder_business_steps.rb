And(/^I Enter The Placeholder Title/i) do
  placeholder_title = NEW_PLACEHOLDER_TITLE
  Sleep_Until(EnterPlaceholderTitle(PLACEHOLDER_TITLE_ID, placeholder_title))
end

And(/^I Choose The Type as "([^"]*)"/i) do | placeholder_type |
  Sleep_Until(SelectPlaceholderType(SELECT_TYPE_ID, placeholder_type))
end

And(/^I Enter The Placeholder Text/i) do
  placeholder_text = NEW_PLACEHOLDER_TITLE
  Sleep_Until(EnterPlaceholderText(PLACEHOLDER_TEXT_ID, placeholder_text))
end

Then(/^I Should Be Able To Create A New Contract Placeholder/i) do
  Sleep_Until(ClickSavePlaceholder(PLACEHOLDER_CREATE_SAVE_BTN_ID))
  Sleep_Until(VerifyCreationSuccessMessage(PLACEHOLDER_SAVE_SUCCESS_ID, PLACEHOLDER_SAVE_SUCCESS_VALUE))
end