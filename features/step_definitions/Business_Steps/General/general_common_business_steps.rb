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
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_triggerId").click)
    Sleep_Until(WaitForAnElementByXpathAndInputValue(SECURITY_PROFILES_USERINPUT_ID, trigger_name))
    Sleep_Until(ClickElement('xpath', "//span[@class='select2-match']"))
  else
    puts COLOR_YELLOW + "notification found, skipping adding same notification".upcase
    skip_this_scenario
  end  #  Recruitment.RecruitmentRequisitionWithdrawnTrigger
end


And(/^I Enter The Necessary Details For The Notification$/i) do
  Sleep_Until($driver.find_element(:id, "templateNotification_channels_0_subject").send_keys("Automation Notification"))
  UseCkeditorToEnterText("Automation Notification", 0)
  ClickOnSaveButton(SAVE_BTN_ID)
end


Then(/^I Should See That The Notification Was Created Successfully$/i) do
  expect($driver.current_url).to include ('/edit')
end

