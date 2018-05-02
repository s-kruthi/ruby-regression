When(/^I Change "([^"]*)" Elmo Configuration To "([^"]*)"/i) do |elmo_configuration_name, elmo_configuration_value|
  begin
  ELMO_CONFIG_SETTINGS.each do |key, value|
    if key.to_s.eql? elmo_configuration_name
      if ($driver.find_element(:xpath, "#{value}").displayed?) == true
        Sleep_Until(SelectFromDropDown("#{value}", elmo_configuration_value)) #if Sleep_Until($driver.find_element(:xpath, "#{value}").displayed? == true)
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


And(/^I Select "([^"]*)" Option To "([^"]*)"$/i) do |config_selection_name, config_selection_value|
  pending
end


And(/^I Select "([^"]*)" Dropdown To "([^"]*)"$/i) do |option_name, option_value|
  pending
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
    And I go to Admin Settings
    And I Go To General Setup under General section
    And I Click On "ELMO Configuration" Tab
    When I Change "#{configure_name}" ELMO Configuration To "#{configured_value}"
    Then I Should Be Able To Save Configuration Details
        }

end