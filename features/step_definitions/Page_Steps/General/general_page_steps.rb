def GoToSite()
  $site_alias = (ENV["URL"] || ENV["url"]) || 'tmsfull'
  $site_type = (ENV["TYPE"] || ENV["type"]) || 'staging'
  $site_url = "https://" + "#{$site_alias}" + ".elmotalent.com.au/dashboard" if ($site_type.to_s == "prod" || $site_type.to_s == "PROD")
  $site_url = "https://" + "#{$site_alias}" + ".dev.elmodev.com/dashboard" if ($site_type.to_s == "staging" || $site_type.to_s == "STAGING")
  puts "SERVER MODE = " + $site_type.to_s if (ENV["TYPE"] || ENV["type"]) != nil
  $driver.navigate.to($site_url)
end


def GoToSection(general_expand, users_list_path)
  GoToASection(general_expand)
  sleep(2)
  GoToItemLandingPage(users_list_path)
end


def GoToAdminSettings(admin_cog)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
end


def GoToASection(section_expand)
  Sleep_Until(WaitForAnElementByXpathAndTouch(section_expand))
end


def GoToNavBarSection(link_to_click)
  Sleep_Until($driver.find_elements(:xpath, link_to_click).last.click)
end


def GoToAddNewUsersPage(add_new_user_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(add_new_user_btn))
end



def CreateUsers(loop, arg2, arg3, arg4, arg5)
  begin
    Sleep_Until(EnterUserDetails(NEW_USER_FIRST_NAME_ID, @@first_name))
    Sleep_Until(EnterUserDetails(NEW_USER_LAST_NAME_ID, @@last_name))
    Sleep_Until(EnterUserDetails(NEW_USER_USERNAME_ID, @@user_name)) if $add_user_type == "EMP"
    Sleep_Until(EnterUserDetails(NEW_USER_EMAIL_ID, @@email_address))
    Sleep_Until(SelectTimeZone(SELECT_TIMEZONE_ID, NEW_USER_DETAILS_MAP[:timezone_value])) if SELECT_TIMEZONE.to_i == 1
    Sleep_Until(SelectAManager(MANAGER_SELECT_DROPDOWN_ID, MANAGER_SELECT_INPUT_ID, arg5, MANAGER_SELECT_RESULT_ID)) if arg5
    Sleep_Until(SelectDate(SELECT_START_DATE_ID, NEW_USER_DETAILS_MAP[:start_date_value])) if SELECT_START_DATE.to_i == 1
    Sleep_Until(SelectDate(SELECT_EXPIRY_DATE_ID, NEW_USER_DETAILS_MAP[:expiry_date_value])) if SELECT_EXPIRY_DATE.to_i == 1
    Sleep_Until(SelectFromDropDown(SELECT_ISELMO_DROPDOWN_ID, "Yes")) if arg2 == "ELMO"
    Sleep_Until(EnterUserDetails(USER_PASSWORD_ID, NEW_USER_DETAILS_MAP[:user_password_value]))
    Sleep_Until(EnterUserDetails(USER_PASSWORD_RECONFIRM_ID, NEW_USER_DETAILS_MAP[:user_password_value]))
    Sleep_Until(ClickOnSaveButton(SAVE_BTN_ID))
  end
end


def EnterUserDetails(input_id, input_value)
  $driver.find_element(:xpath, input_id).clear()
  WaitForAnElementByXpathAndInputValue(input_id, input_value)
end


def SelectAManager(recipient_field_id, recipient_input_id, recipient1_input_value, recipient1_result_id)
  $driver.find_element(:id, recipient_field_id).click
  Sleep_Until($driver.find_elements(:class, recipient_input_id).last.send_keys(recipient1_input_value))
  Sleep_Until($driver.find_elements(:class, recipient1_result_id).first.click)
end


def SelectDate(select_date_id, select_date_value)
  Sleep_Until($driver.find_element(:xpath, select_date_id).clear())
  Sleep_Until(WaitForAnElementByXpathAndInputValue(select_date_id, select_date_value))
  $driver.find_element(:xpath, select_date_id).send_keys(:return)
end


def SelectTimeZone(select_timezone_id, select_timezone_value)
  Sleep_Until(SelectFromDropDown(select_timezone_id, select_timezone_value))
end


def ClickUserListActions(action_dropdown_class_name, action_dropdown_class_index_value, action_dropdown_name_value)
  Sleep_Until(WaitForDropdownByClassAndTouchTheIndex(action_dropdown_class_name, action_dropdown_class_index_value))
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(action_dropdown_name_value))
end


def UseActiveInactiveFilter()
  if $driver.find_elements(:id, "create_filter_btn")[0].displayed?
    begin
      Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[2].click) if $driver.find_elements(:class, "dropdown-toggle")[2].present?
      Sleep_Until($driver.find_elements(:xpath, "//span[contains(.,'Active and Inactive')]").first.click) if $driver.find_elements(:xpath, "//span[contains(.,'Active and Inactive')]").present?
    end
  end
end


def VerifyDeletedUser(inactive_class_id, inactive_attribute_id, inactive_attribute_text)
  puts COLOR_GREEN + "MATCHED: #{inactive_attribute_text}" if $driver.find_element(:class, inactive_class_id).attribute(inactive_attribute_id) == inactive_attribute_text
end


def ClickOnATab(tab_name)
  Sleep_Until($driver.find_element(:xpath, "//a[contains(.,'#{tab_name}')]").click)
end


def ClickOnASubTab(sub_tab_name_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(sub_tab_name_id))
end


