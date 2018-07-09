def GoToSite()

  # Use override from ENV variable if there's any to go to any specific domain name, if there's no specified one, use default from BDD
  $site_alias = (ENV["URL"] || ENV["url"]) || 'tmsfull'

  # Use override from ENV variable if there's any to go to any staging or prod site, if there's no specified one, use default from BDD
  $site_type = (ENV["TYPE"] || ENV["type"]) || 'staging'

  # TODO: Change this to a case select condition
  $site_url = "https://" + "#{$site_alias}" + ".elmotalent.com.au/dashboard" if ($site_type.to_s == "prod" || $site_type.to_s == "PROD")
  $site_url = "https://" + "#{$site_alias}" + ".dev.elmodev.com/dashboard" if ($site_type.to_s == "staging" || $site_type.to_s == "STAGING")

  puts "SERVER MODE = " + $site_type.to_s if (ENV["TYPE"] || ENV["type"]) != nil

  $driver.navigate.to($site_url)
end


def GoToSection(general_expand, users_list_path)
  GoToASection(general_expand)
  sleep(1)
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


def AddUserDetails(limit)
  i = 2 if limit >= 2
  i = 1 if limit < 2
  for loop in i..limit do
    CreateRemainingUsers(loop)
    loop += 1
  end
end


def CreateUsers(loop)
  first_name = NEW_USER_FIRST_NAME_PREFIX + loop.to_s
  last_name = NEW_USER_LAST_NAME_PREFIX + loop.to_s if $add_user_type == "EMP"
  last_name = NEW_USER_LAST_NAME_PREFIX + loop.to_s + ".ob" if $add_user_type == "OB"
  user_name = first_name + "." + last_name
  email_address = user_name + NEW_USER_EMAIL_SUFFIX
  Sleep_Until(EnterUserDetails(NEW_USER_FIRST_NAME_ID, first_name))
  Sleep_Until(EnterUserDetails(NEW_USER_LAST_NAME_ID, last_name))
  Sleep_Until(EnterUserDetails(NEW_USER_USERNAME_ID, user_name)) if $add_user_type == "EMP"
  Sleep_Until(EnterUserDetails(NEW_USER_EMAIL_ID, email_address))
  Sleep_Until(SelectTimeZone(SELECT_TIMEZONE_ID, SELECT_TIMEZONE_VALUE)) if SELECT_TIMEZONE.to_i == 1
  Sleep_Until(SelectAManager(MANAGER_SELECT_DROPDOWN_ID, MANAGER_SELECT_INPUT_ID, MANAGER_SELECT_INPUT_VALUE, MANAGER_SELECT_RESULT_ID)) if SELECT_MANAGER.to_i == 1
  Sleep_Until(SelectDate(SELECT_START_DATE_ID, SELECT_START_DATE_VALUE)) if SELECT_START_DATE.to_i == 1
  Sleep_Until(SelectDate(SELECT_EXPIRY_DATE_ID, SELECT_EXPIRY_DATE_VALUE)) if SELECT_EXPIRY_DATE.to_i == 1
  Sleep_Until(EnterUserDetails(USER_PASSWORD_ID, USER_PASSWORD_VALUE))
  Sleep_Until(EnterUserDetails(USER_PASSWORD_RECONFIRM_ID, USER_PASSWORD_VALUE))
  ClickOnSaveButton(SAVE_BTN_ID)
  sleep (2)
end


def CreateRemainingUsers(counter)
  $driver.navigate.to($site_url)
  GoToAdminSettings(ADMIN_COG)
  GoToSection(GENERAL_EXPAND, USERS_LIST_PATH) if $add_user_type == "EMP"
  GoToSection(ONBOARDING_EXPAND, OB_USERS_LIST_PATH) if $add_user_type == "OB"
  GoToAddNewUsersPage(ADD_NEW_USER_BTN) if $add_user_type == "EMP"
  GoToAddNewUsersPage(OB_ADD_NEW_USER_BTN) if $add_user_type == "OB"
  Sleep_Until(CreateUsers(counter))
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


