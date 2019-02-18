
def ClickOnSideBarItem(config_section_item, config_section_name)
  case config_section_name
    when "User Details"
      case config_section_item
        when 'Profile Image'
          config_section_item = 'img'
        when 'First Name'
          config_section_item = 'firstName'
        when 'Last Name'
          config_section_item = 'lastName'
        when 'Username', 'Email', 'Manager', 'Mobile', 'Country', 'Timezone'
          config_section_item = config_section_item.downcase
        when 'Date of Birth'
          config_section_item = 'dateOfBirth'
        when 'Start Date'
          config_section_item = 'startDate'
        when 'Expiry Date'
          config_section_item = 'expiryDate'
        when 'State/Region'
          config_section_item = 'state'
        when 'Employee Number'
          config_section_item = 'employeeNumber'
      end

    when "Built-In Hierarchies"
      case config_section_item
        when 'Cost Centre'
          config_section_item = "costCentre"
        when 'Company(Legal Entity)'
          config_section_item = "legalEntity"
        else
          config_section_item = config_section_item.downcase
      end

    when "Custom User Fields"
      config_section_name = 'CUF'
  end

  @config_section_name = config_section_name
  @config_section_item = config_section_item

  Sleep_Until($driver.find_elements(:id, "#{config_section_name}-#{config_section_item}-button").first.click)
end

def ClickOnSideBarItemCustom(config_section_item, config_section_name)
 $driver.find_element(:id, user_config_selection[:config_section_item])
end


def click_on_toggle_button(module_name, toggle_btn_name)
  Sleep_Until($driver.find_element(:id, module_name).find_element(:class, toggle_btn_name).click)
  sleep (1)
end


def ConfigureLockCourseWithEnrolments(dropdown_id_xpath, dropdown_value)
  SelectFromDropdown(dropdown_id_xpath, dropdown_value)
end


def SetClientCountry(country)
  case country
  when 'Australia'
    country_code = 'AU'
  when 'New Zealand'
    country_code = 'NZ'
  else
    country_code = 'AU,NZ'
  end

  client_country = $daos.get_epms_config_enabled('clientCountry')[:value]

  if client_country != country_code
    if client_country == 'AU,NZ' && (country_code == 'AU' || country_code == 'NZ')
      Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_VISIBILITY_CLEAR_ID))
      Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_VISIBILITY_CLEAR_ID))
      Sleep_Until(SelectFromDropdown(ELMO_CONFIG_CLIENT_COUNTRY_ID, "#{country}"))

    elsif (client_country == 'NZ' && country_code == 'AU') || (client_country == 'AU' && country_code == 'NZ')
      Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_VISIBILITY_CLEAR_ID))
      Sleep_Until(SelectFromDropdown(ELMO_CONFIG_CLIENT_COUNTRY_ID, "#{country}"))

    else
      Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_VISIBILITY_CLEAR_ID))
      Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_VISIBILITY_CLEAR_ID))
      Sleep_Until(SelectFromDropdown(ELMO_CONFIG_CLIENT_COUNTRY_ID, "Australia"))
      Sleep_Until(SelectFromDropdown(ELMO_CONFIG_CLIENT_COUNTRY_ID, "New Zealand"))
      puts "3"
    end
    puts COLOR_BLUE + ("client country is now set to " + country).upcase

  else
    puts COLOR_BLUE + ("client country is already set to " + country).upcase
  end
  
end