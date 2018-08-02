
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
      case config_section_item
        when "Gender"
          config_section_item = config_section_item.downcase
        when "Payroll Number"
          config_section_item = "payrollnumber"
        when "Date Joined"
          config_section_item = "datejoined"
      end
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
  SelectFromDropDown(dropdown_id_xpath, dropdown_value)
end