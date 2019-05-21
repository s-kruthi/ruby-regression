When(/^I Change "([^"]*)" Elmo Configuration To "([^"]*)"/i) do |elmo_configuration_name, elmo_configuration_value|
  begin
  ELMO_CONFIG_SETTINGS.each do |key, value|
    if key.to_s.eql? elmo_configuration_name
      if $driver.find_element(:xpath, "#{value}").displayed?
        Sleep_Until(SelectFromDropdown("#{value}", elmo_configuration_value))
        $configuration_found = 1
      end
    end
  end

  puts COLOR_RED + "The specified Configuration cannot be found. Please check Test Data Section." if $configuration_found != 1

  rescue Exception => e
  puts COLOR_BLUE + "INFO: " + e.message
  end
end


When(/^I Click On "([^"]*)" Item From Left Side Bar Under "([^"]*)" Section$/i) do |config_section_item, config_section_name|
  case config_section_name
  when "Contact Details"
    begin
      ClickOnSideBarItemCustom(config_section_item, config_section_name)
    end

  when "Diversity Questions"
    begin
      ClickOnSideBarItemCustom(config_section_item, config_section_name)
    end

  when "Payment Details"
    begin
      pending
    end
  end
  ClickOnSideBarItem(config_section_item, config_section_name)
end


And(/^I Click On "([^"]*)" Tab$/i) do |tab_name_id|
  ClickOnATab(tab_name_id)
  sleep (3)
end


Then(/^I Should Be Able To Save Configuration Details$/i) do
  ClickOnSaveButton(ELMO_CONFIG_SAVE_ID)
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, ELMO_CONFIG_VERIFY_SAVE_SUCCESSFUL_VALUE)
end


And(/^Verify That "Configuration Status" Is Displayed As "([^"]*)"$/i) do |config_status_value|
  pending
end


Given(/^The "([a-zA-Z\s]+)" Configure The "([\s\w]+)" To ([\s\w]+)$/i) do |admin_type, configure_name, configured_value|
  steps %Q{
    Given I Have Logged In As A #{admin_type}
    And I Go To Admin Settings
    And I Go To "General Setup" Under "General" Section
    And I Click On "ELMO Configuration" Tab
    When I Change "#{configure_name}" ELMO Configuration To "#{configured_value}"
    Then I Should Be Able To Save Configuration Details
  }
  $driver.quit
end


When(/^I Click On The Branding Selection Field$/i) do
  Sleep_Until(ClickElement('id', ELMO_CONFIG_BRANDING_ID))
end


Then(/^I Can Choose ([\w\s]+) As The Branding Selection Field$/i) do | branding_selection_value |
  Sleep_Until(SelectFromDropdown(ELMO_CONFIG_BRANDING_SELECT_ID , branding_selection_value))
end


Given(/^Contracts Is Disabled For New (:?OB )?Users$/i) do |user_type|
  steps %Q{
    Given I Have Logged In As A ELMO Admin
    And I Go To Admin Settings
    And I Go To "General Setup" Under "General" Section
    And I Click On "ELMO Configuration" Tab
    When I Change "New #{user_type}User Contract" ELMO Configuration To "Disabled"
    Then I Should Be Able To Save Configuration Details
  }
  $driver.quit
end


And(/^I Edit (\d+) Custom User Field[s]? In User Profile Setup$/i) do | num_custom_fields |
  @custom_user_fields = $daos.get_custom_user_field_details(num_custom_fields).all

  @custom_user_fields.each do | details |
    puts COLOR_BLUE + "Editing the custom user field: "+ details[:name].upcase
  end
end


And(/^I Click On The (\w+) Item From Left Side Bar Under "Custom User Fields" section$/i) do | field_num |
  case field_num
    when 'First'
      item_name = @custom_user_fields[0][:shortname]
    when 'Second'
      item_name = @custom_user_fields[1][:shortname]
    when 'Third'
      item_name = @custom_user_fields[2][:shortname]
  end

  steps %Q{
    When  I Click On "#{item_name}" item from left side bar under "Custom User Fields" section
  }
end


When(/^I Set The Client Country As ([\s\w]+)$/i) do | country |
  SetClientCountry(country)
end
