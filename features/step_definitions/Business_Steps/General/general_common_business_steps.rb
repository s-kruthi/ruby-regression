=begin
NOTE: This file contains all the re-usable step definitions used within the 'General' section in TMS platform under 'Admiinstration->General' section
Any re-usable business steps should be added/moved in here
=end


And(/^I Click On "([^"]*)" Button$/i) do |button_name|
  case button_name
    when "Create Filter"
      begin
        buttonxPath = "//button[contains(.,'#{button_name}')]"
        Sleep_Until($driver.find_elements(:xpath, buttonxPath).first.click)
        sleep(3)
      end
    
    when "Add New User"
      begin
        case $add_user_type
          when "EMP"
            begin
              GoToAddNewUsersPage(ADD_NEW_USER_BTN)
            end
          
          when "OB"
            begin
              GoToAddNewUsersPage(OB_ADD_NEW_USER_BTN)
            end
        end
      end
    
    when "Add Emergency Contact Details"
      begin
        Sleep_Until(ClickOnASubTab(ADD_EM_CONTACT_BTN_ID))
      end
    
    when "Add Next Of Kin"
      begin
        Sleep_Until(ClickOnASubTab(ADD_NOK_CONTACT_BTN_ID))
      end
    
    when "Add New Note"
      begin
        Sleep_Until(WaitForAnElementByIdAndTouch(ADD_NOTE_USERPROFILE_ID))
      end
    
    else
      begin
        buttonxPath = "//a[contains(.,'#{button_name}')]"
        Sleep_Until(WaitForAnElementByXpathAndTouch(buttonxPath))
      end
  end
end


# NOTE: This method currently fill out the details in 'Position', 'Department' and 'Locations' section. Things like 'Course', 'Skills', 'Goals' sections can also be added
And(/^I Add New "([^"]*)" Details$/i) do |enter_details_type|
  EnterNewTypeDetails(enter_details_type)
end


# NOTE: This method currently verifies the 'Success' alert flush message displayed for 'Position', 'Department' and 'Locations' section. Things like 'Course', 'Skills', 'Goals' sections can also be added
Then(/^I Should Be Able To Successfully Create a New "([^"]*)"$/i) do |verify_new_type_creation|
  VerifyNewTypeCreated(verify_new_type_creation)
end


And(/^I Select The "([^"]*)" Notification Trigger$/i) do | trigger_name |
  trigger_id = trigger_name.gsub(' ','')

  #check trigger already exists
  notification_exists = $daos.check_notification_exists(trigger_id)

  if notification_exists == 0
    # Click on the notification trigger dropdown so that it displays all currently available notification triggers
    Sleep_Until(ClickElement("id", "s2id_templateNotification_triggerId"))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(SECURITY_PROFILES_USERINPUT_ID, trigger_name))
    Sleep_Until(ClickElement('xpath', "//span[@class='select2-match']"))
  else
    puts COLOR_YELLOW + "notification found, skipping adding same notification".upcase
    skip_this_scenario
  end  #  Recruitment.RecruitmentRequisitionWithdrawnTrigger
end


And(/^I Enter The Necessary Details For The Notification$/i) do
  Sleep_Until(WaitForAnElementByIdAndInputValue(NOTIFICATION_DESC_ID, NOTIFICATION_DESC_VALUE))
  UseCkeditorToEnterText(NOTIFICATION_DESC_VALUE, 0)
  ClickOnSaveButton(SAVE_BTN_ID)
end


Then(/^I Should See That The Notification Was "([\w]+)" Successfully$/i) do | action |
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


When(/^I Search For "([^"]*)" Notification$/i) do | notification_name |
  @notification_copy = $daos.get_notification_details(notification_name)

  if !@notification_copy.nil?
    Sleep_Until(ClickElement("id", "s2id_notifier-triggers"))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(SECURITY_PROFILES_USERINPUT_ID, 'Requisition Withdrawn'))
    Sleep_Until(ClickElement('xpath', "//span[@class='select2-match']"))

    #click arrow button of edit dropdown
    Sleep_Until(ClickElement('xpath', "//a[contains(@href, '#{@notification_copy[:id]}')]/following-sibling::button"))
  else
    puts COLOR_YELLOW + "notification not found, check manually".upcase
    skip_this_scenario
  end
end


And(/^I Create A Copy Of The Notification$/i) do
  Sleep_Until(ClickElement('xpath', "//a[contains(@href, '/copy/#{@notification_copy[:id]}')]"))
end


And(/^I Edit The Title To Be "([^"]*)"$/i) do | edit_title |
  @edited_title = edit_title
  Sleep_Until(ClickElement("xpath", "//a[contains(@href, '/edit/#{@notification_copy[:id]}')]"))
  ClearField('id', NOTIFICATION_TITLE_ID )
  WaitForAnElementByIdAndInputValue(NOTIFICATION_TITLE_ID , edit_title)
  ClickOnSaveButton(SAVE_BTN_ID)
end


And(/^I "(Deactivate|Activate|Delete)" The Notification$/i) do | action |

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



