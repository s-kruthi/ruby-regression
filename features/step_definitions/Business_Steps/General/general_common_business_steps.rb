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