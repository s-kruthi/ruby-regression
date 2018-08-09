
def ToggleEnableDisable(config_selection_value)

  #example: //label[@id="User Details-expiryDate-enabled"]
  userfield_toggle_id = '//label[@id="' + @config_section_name + '-' + @config_section_item + '-enabled"]'

 #check if enabled or disabled
 if $driver.find_element(:id, @config_section_name + '-' + @config_section_item + '-toggleEnable').attribute('checked')
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
    Sleep_Until(SelectFromDropDown("//select[@id='#{userfield_id}']", option_value))
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
    else
      puts COLOR_BLUE + "Field is Hidden/visible to Nobody"
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

  field_editablity = $daos.get_epms_config_enabled(name)

  if !field_editablity.nil?
    if field_editablity[:value] == '0'
      puts COLOR_BLUE + "Field is editable to Everyone"
    else
      puts COLOR_BLUE + "Field is not Editable"
    end

    return field_editablity[:value]
  else
    puts COLOR_BLUE + 'Field ' + field_name + ' is not Enabled in Config'
    skip_this_scenario
  end
end
