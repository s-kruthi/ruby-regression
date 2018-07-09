
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