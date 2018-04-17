When(/^I change "([^"]*)" elmo configuration To "([^"]*)"/i) do | elmo_configuration_name, elmo_configuration_value |
pending
end

When(/^I Click On "([^"]*)" item from left side bar under "([^"]*)" section$/i) do |config_section_item, config_section_name|

  case config_section_name
  when "Contact Details"
    begin
      click_on_side_bar_item_custom(config_section_item, config_section_name)
    end

  when "Diversity Questions"
    begin
      click_on_side_bar_item_custom(config_section_item, config_section_name)
    end

  when "Payment Details"
    begin
      pending
    end
  end

  click_on_side_bar_item(config_section_item, config_section_name)
end

And(/^I Click On "([^"]*)" Tab$/i) do |tab_name_id|
  ClickOnATab(tab_name_id)
  sleep (3)
end


And(/^I select "([^"]*)" option to "([^"]*)"$/i) do |config_selection_name, config_selection_value|
end

And(/^I select "([^"]*)" dropdown to "([^"]*)"$/i) do |option_name, option_value|
end

Then(/^I Should Be Able To Save Configuration Details$/i) do
end

And(/^Verify That "Configuration Status" Is Displayed As "([^"]*)"$/i) do |config_status_value|
end