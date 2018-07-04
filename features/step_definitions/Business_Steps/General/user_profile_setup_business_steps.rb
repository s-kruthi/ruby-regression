And(/^I Select Enabled Toggle To "([^"]*)"$/i) do |config_selection_value|
  ToggleEnableDisable(config_selection_value)
end


And(/^I Select "([^"]*)" Dropdown To "([^"]*)"$/i) do |option_name, option_value|
  SetUserfieldConfig(option_name, option_value)
end


Then(/^I Should Be Able To Save The (.*) Configuration$/i) do |config_section|
  @config_section = config_section

  #using submit since element doesnt have visible/displayed property
  Sleep_Until($driver.find_element(:id, "#{config_section}-save").submit)
end


And(/^I Verify That The Configuration Status Is (Saved|Unsaved)$/i) do |save_status|
  if @save_status == "Changed"
    #check for element to have saved text
    config_save_id = @config_section + '-status'
    Sleep_Until(VerifyAnElementExistById(config_save_id, save_status))
  else
    puts COLOR_BLUE + "Config was not changed"
  end
end
