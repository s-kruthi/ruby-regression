When(/^I Change "([^"]*)" Elmo Configuration To "([^"]*)"/i) do |elmo_configuration_name, elmo_configuration_value|
  # This is WIP
  ELMO_CONFIG_SETTINGS.each do |key, value|
    if key.eql? elmo_configuration_name
      puts "TEST"
      puts "#{key} current value: #{value}"
      break
    end
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
end

And(/^Verify That "Configuration Status" Is Displayed As "([^"]*)"$/i) do |config_status_value|
  pending
end