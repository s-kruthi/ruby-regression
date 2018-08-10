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


Given(/^That Cost Centre and Company\(Legal Entity\) Fields Are Enabled$/i) do
  steps %{
          Given That Cost Centre Field Is Visible
          And That Legal Entity Is Enabled
          }
end


Given(/^That ([\w\s]+) Field Is (Visible|Hidden)$/i) do |field_name, field_visibility|
  visible = CheckFieldVisibility(field_name)

  if field_visibility == 'Visible'
    expect(visible).not_to eq('0')
    @visible = true
  else
    expect(visible).to eq('0')
    @visible = false
  end
end


Then(/^I Can See That I Can Modify The ([\w\s\(\)]+) Settings$/i) do |field|
  steps %{And I Click On "#{field}" item from left side bar under "Built-In Hierarchies" section
          And I Click On "#{field}" item from left side bar under "Built-In Hierarchies" section
         }
end


Then(/^I Should Not Be Able To Access Cost Centres under HR Core section$/i) do
  GoToASection("//a[@href='#collapseHRCore']")
  sleep(2)
  Sleep_Until(VerifyAnElementNotExist('xpath','//a[@href="/admin/costCentre/"]'))
end


And(/^That ([\w\s]+) Field Is (Editable|Uneditable)$/i) do |field_name, field_editablity|
  editable = CheckFieldEditability(field_name)

  if field_editablity == 'Editable'
    expect(editable).not_to eq('1')
    @editable = true
  else
    expect(editable).to eq('1')
    @editable = false
  end
end