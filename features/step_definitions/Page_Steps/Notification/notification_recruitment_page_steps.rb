def SelectNotificationTrigger(trigger_name)
  trigger_id = trigger_name.gsub(' ','')

  #check trigger already exists
  notification_exists = $daos.check_notification_exists(trigger_id)

  if notification_exists == 0
    # Click on the notification trigger dropdown so that it displays all currently available notification triggers
    Sleep_Until(ClickElement("id", NOTIFICATION_TRIGGER_DROPDOWN_ID))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(SECURITY_PROFILES_USERINPUT_ID, trigger_name))
    Sleep_Until(ClickElement('xpath', SELECT2_MATCHED_RESULT_ID))
  else
    puts COLOR_YELLOW + "notification found, skipping adding same notification".upcase
    skip_this_scenario
  end
end


def VerifyNotificationAction(action)
  case action
  when 'Created'
    expect($driver.current_url).to include ('/edit')
  when 'Edited'
    expect($daos.get_notification_details(@edited_title)).not_to be_nil
  when 'Copied'
    url_regex_pattern = /(\/list)$/
    expect($driver.current_url).to match url_regex_pattern
  when 'Deactivated', 'Activated'
    expect(GetTextAssociatedToElement('xpath', MODAL_ID)).to eq(NOTIFICATION_ACTDEACT_SUCCESS_MSG_VALUE)
    Sleep_Until(PressEnterOK())
  when 'Deleted'
    expect(GetTextAssociatedToElement('xpath', MODAL_ID)).to eq(NOTIFICATION_DEL_SUCCESS_MSG_VALUE)
    Sleep_Until(PressEnterOK())
  end
end


def SearchForNotification(notification_name)
  @notification_copy = $daos.get_notification_details(notification_name)

  if !@notification_copy.nil?
    Sleep_Until(ClickElement("id", NOTIFICATION_TYPE_DROPDOWN_ID))
    #filter for the notification type
    Sleep_Until(WaitForAnElementByXpathAndInputValue(SECURITY_PROFILES_USERINPUT_ID, 'Requisition Withdrawn'))
    Sleep_Until(ClickElement('xpath', SELECT2_MATCHED_RESULT_ID))

    #click arrow button of edit dropdown
    Sleep_Until(ClickElement('xpath', "//a[contains(@href, '#{@notification_copy[:id]}')]/following-sibling::button"))
  else
    puts COLOR_YELLOW + "notification not found, check manually".upcase
    skip_this_scenario
  end
end


def EditNotificationTitle(edit_title)
  @edited_title = edit_title
  Sleep_Until(ClickElement("xpath", "//a[contains(@href, '/edit/#{@notification_copy[:id]}')]"))
  ClearField('id', NOTIFICATION_TITLE_ID )
  WaitForAnElementByIdAndInputValue(NOTIFICATION_TITLE_ID , edit_title)
  ClickOnSaveButton(SAVE_BTN_ID)
end


def PerformNotificationAction(action)
  if action == "Activate"
    identifier = "//a[contains(@href, '/activation/#{@notification_copy[:id]}/1')]"
    match_text = MODAL_ACTIVATE_MSG_VALUE
  elsif action == "Deactivate"
    identifier = "//a[contains(@href, '/activation/#{@notification_copy[:id]}/0')]"
    match_text = MODAL_DEACTIVATE_MSG_VALUE
  else
    identifier = "//a[contains(@href, '/delete/#{@notification_copy[:id]}')]"
    match_text = MODAL_DELETE_MSG_VALUE
  end

  Sleep_Until($driver.find_element(:xpath, identifier).click)
  expect(GetTextAssociatedToElement('xpath', MODAL_ID)).to eq(match_text)
  Sleep_Until(PressEnterConfirm())
end



