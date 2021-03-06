
def ToggleEnableDisable(config_selection_value)

  if @auto_generate == 1
    userfield_togglebutton_id = @config_section_name + '-' + @config_section_item + '-employeeNumberAutoGeneration'
    userfield_toggle_id = '//label[@id="' + @config_section_name + '-' + @config_section_item + '-employeeNumberAutoGenerationLabel"]'
  else
    #example: //label[@id="User Details-expiryDate-enabled"]
    userfield_toggle_id = '//label[@id="' + @config_section_name + '-' + @config_section_item + '-enabled"]'
    userfield_togglebutton_id = @config_section_name + '-' + @config_section_item + '-toggleEnable'
  end

 #check if enabled or disabled
 if $driver.find_element(:id, userfield_togglebutton_id).attribute('checked')
   puts COLOR_BLUE + "Field is already Enabled"
   field_status = "Enabled"
 else
   puts COLOR_BLUE + "Field is already Disabled"
   field_status = "Disabled"
 end

 if field_status == "Enabled" && config_selection_value == "Disabled"
    Sleep_Until(WaitForAnElementByXpathAndTouch(userfield_toggle_id))
    @save_status = "Changed"
    puts COLOR_GREEN + "Field has been Disabled"

 elsif field_status == "Disabled" && config_selection_value == "Enabled"
    Sleep_Until(WaitForAnElementByXpathAndTouch(userfield_toggle_id))
    @save_status = "Changed"
    puts COLOR_GREEN + "Field has been Enabled"
 end
end

def SetUserfieldConfig(option_name, option_value)
  #if selected option is same as option value then keep @save_status=unchanged else @save_status=changed
  case option_name
    when 'Required', 'Visible', 'Editable', 'Profile'
      option_name = option_name.downcase
    when 'Force Unique'
      option_name = 'forceUnique'
    when 'Self Registration'
      option_name = 'selfRegistration'
  end

  userfield_id = @config_section_name + '-' + @config_section_item + '-' + option_name

  selected_value = GetSelectedValueFromDropdown("//select[@id='#{userfield_id}']")

  if selected_value != option_value
    Sleep_Until(SelectFromDropdown("//select[@id='#{userfield_id}']", option_value))
    @save_status = "Changed"
    puts COLOR_BLUE + "Field has been set with the specified value"
  else
    puts COLOR_BLUE + "Field is already set with the value"
  end
end

def GetSelectedValueFromDropdown(dropdown_identifier)
    begin
      dropdown_list = $driver.find_element(:xpath, dropdown_identifier)
      select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
      return select_list.first_selected_option.text
    end
end

def CheckFieldVisibility(field_name)
  case field_name
    when 'Company Legal Entity'
      name = 'userFieldsVisible_legalEntity'
    when 'Cost Centre'
      name = 'userFieldsVisible_costCentre'
  end

  field_visibility = $daos.get_epms_config_enabled(name)

  if !field_visibility.nil?
    if field_visibility[:value] == '1'
      puts COLOR_BLUE + "Field is visible to Everyone"
    elsif field_visibility[:value] == '0'
      puts COLOR_BLUE + "Field is not Visible"
    elsif field_visibility[:value] == '2'
      puts COLOR_BLUE + "Field is visible by Company Admin Only"
    elsif field_visibility[:value] == '3'
      puts COLOR_BLUE + "Field is editable by Manager and Company Admin Only"
    end

    return field_visibility[:value]
  else
    puts COLOR_BLUE + 'Field ' + field_name + ' is not Enabled in Config'
    skip_this_scenario
  end

end

def CheckFieldEditability(field_name)
  case field_name
    when 'Company Legal Entity'
      name = 'userFieldsLocked_legalEntity'
    when 'Cost Centre'
      name = 'userFieldsLocked_costCentre'
  end

  field_editability = $daos.get_epms_config_enabled(name)

  if !field_editability.nil?
    if field_editability[:value] == '0'
      puts COLOR_BLUE + "Field is editable by Everyone"
    elsif field_editability[:value] == '1'
      puts COLOR_BLUE + "Field is not Editable"
    elsif field_editability[:value] == '2'
      puts COLOR_BLUE + "Field is editable by Company Admin Only"
    elsif field_editability[:value] == '3'
      puts COLOR_BLUE + "Field is editable by Manager and Company Admin Only"
    end

    return field_editability[:value]
  else
    puts COLOR_BLUE + 'Field ' + field_name + ' is not Enabled in Config'
    skip_this_scenario
  end
end
