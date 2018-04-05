And(/^I Enter The Badge Title$/i) do
  badge_title = NEW_BADGE_TITLE
  Sleep_Until(EnterBadgeTitle(BADGE_TITLE_ID, badge_title))
end

And(/^I Upload The Badge Image$/i) do
  Sleep_Until(ClickUploadImage(BADGE_CREATE_UPLOADIMG_BTN_ID))
  Sleep_Until(SelectAnImage(BROWSE_FILE_ID, FILE_NAME))
  Sleep_Until(ClickDoneBtn(IMAGE_SUBMIT_BTN_ID))
end

And(/^I Select The Availability As (.*)$/i) do |availability_value|
  Sleep_Until(SelectBadgeAvailability(SELECT_AVAILABILITY_ID, availability_value))
end

Then(/^I Should Be Able To Create A New Badge Successfully$/i) do
  Sleep_Until(ClickSaveBadge(BADGE_CREATE_SAVE_BTN_ID))
  Sleep_Until(VerifySuccessAlertMessage(BADGE_SAVE_SUCCESS_ID, BADGE_SAVE_SUCCESS_VALUE))
end