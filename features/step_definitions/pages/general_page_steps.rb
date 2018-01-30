def go_to_site(site_name)

  $site_alias = site_name
  $site_type = "staging"

  #Use override from ENV variable if there's any to go to any specific domain name, if there's no specified one, use default from BDD
  $site_alias = (ENV["URL"] || ENV["url"]) if (ENV["URL"] || ENV["url"]) != nil

  #Use override from ENV variable if there's any to go to any staging or prod site, if there's no specified one, use default from BDD
  $site_type = (ENV["TYPE"] || ENV["type"]) if (ENV["TYPE"] || ENV["type"]) != nil

  # TODO: Change this to a case select condition
 $site_url = "https://" + "#{$site_alias}" + ".elmotalent.com.au/dashboard" if ($site_type.to_s == "prod" || $site_type.to_s == "PROD")
 $site_url = "https://" + "#{$site_alias}" + ".dev.elmodev.com/dashboard" if ($site_type.to_s == "staging" || $site_type.to_s == "STAGING")

 puts "URL OVERRIDE = " + $site_url.to_s if (ENV["URL"] || ENV["url"]) != nil
 puts "SERVER MODE = " + $site_type.to_s if (ENV["TYPE"] || ENV["type"]) != nil


  $driver.navigate.to($site_url)
 end

def go_to_the_sections(general_expand,users_list_path)
  goToASection(general_expand)
  sleep(1)
  goToItemLandingPage(users_list_path)
end

def goToAdminSettings(admin_cog)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
end

def goToASection(section_expand)
  Sleep_Until(WaitForAnElementByXpathAndTouch(section_expand))
end

  def go_to_the_navbar_sections(link_to_click)
  Sleep_Until($driver.find_elements(:xpath, link_to_click).last.click)
end

def go_to_add_new_users_page(add_new_user_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(add_new_user_btn))
end

def add_user_details(limit)
  i = 2 if limit >= 2
  i = 1 if limit < 2
  for loop in i..limit do
    create_remaining_users(loop)
    loop += 1
  end
end

def create_users(loop)
  first_name = NEW_USER_FIRST_NAME_PREFIX + loop.to_s
  last_name = NEW_USER_LAST_NAME_PREFIX + loop.to_s
  user_name = first_name + "." +  last_name
  email_address = user_name + NEW_USER_EMAIL_SUFFIX
  Sleep_Until(enter_user_details(NEW_USER_FIRST_NAME_ID, first_name))
  Sleep_Until(enter_user_details(NEW_USER_LAST_NAME_ID, last_name))
  Sleep_Until(enter_user_details(NEW_USER_USERNAME_ID, user_name)) if $add_user_type == "EMP"
  Sleep_Until(enter_user_details(NEW_USER_EMAIL_ID, email_address))
  Sleep_Until(select_a_manager(MANAGER_SELECT_DROPDOWN_ID, MANAGER_SELECT_INPUT_ID, MANAGER_SELECT_INPUT_VALUE,MANAGER_SELECT_RESULT_ID)) if SELECT_MANAGER.to_i == 1
  Sleep_Until(select_date(SELECT_START_DATE_ID, SELECT_START_DATE_VALUE)) if SELECT_START_DATE.to_i == 1
  Sleep_Until(select_date(SELECT_EXPIRY_DATE_ID, SELECT_EXPIRY_DATE_VALUE)) if SELECT_EXPIRY_DATE.to_i == 1
  Sleep_Until(select_timezone(SELECT_TIMEZONE_ID, SELECT_TIMEZONE_VALUE)) if SELECT_TIMEZONE.to_i == 1
  Sleep_Until(enter_user_details(USER_PASSWORD_ID, USER_PASSWORD_VALUE))
  Sleep_Until(enter_user_details(USER_PASSWORD_RECONFIRM_ID, USER_PASSWORD_VALUE))
  Sleep_Until(press_save_button(USER_CREATE_SAVE_BTN_ID))
  sleep (2)
end

def create_remaining_users(counter)
  $driver.navigate.to($site_url)
  goToAdminSettings(ADMIN_COG)
  go_to_the_sections(GENERAL_EXPAND, USERS_LIST_PATH) if $add_user_type == "EMP"
  go_to_the_sections(ONBOARDING_EXPAND, OB_USERS_LIST_PATH) if $add_user_type == "OB"
  go_to_add_new_users_page(ADD_NEW_USER_BTN) if $add_user_type == "EMP"
  go_to_add_new_users_page(OB_ADD_NEW_USER_BTN)  if $add_user_type == "OB"
  Sleep_Until(create_users(counter))
end

def enter_user_details(input_id, input_value)
  $driver.find_element(:xpath, input_id).clear()
  WaitForAnElementByXpathAndInputValue(input_id, input_value)
end


def select_a_manager(recipient_field_id, recipient_input_id, recipient1_input_value, recipient1_result_id)
  $driver.find_element(:id, recipient_field_id).click
  Sleep_Until($driver.find_elements(:class, recipient_input_id).last.send_keys(recipient1_input_value))
  Sleep_Until($driver.find_elements(:class, recipient1_result_id).first.click)
end

def select_date(select_date_id, select_date_value)
  Sleep_Until($driver.find_element(:xpath, select_date_id).clear())
  Sleep_Until(WaitForAnElementByXpathAndInputValue(select_date_id, select_date_value))
  $driver.find_element(:xpath, select_date_id).send_keys(:return)
end
#
def select_timezone(select_timezone_id, select_timezone_value)
  Sleep_Until(select_from_drop_down(select_timezone_id, select_timezone_value))
end

def press_save_button(user_create_save_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(user_create_save_btn_id))
end

def delete_the_user(action_dropdown_class_name, action_dropdown_class_index_value, action_dropdown_name_value)
  Sleep_Until(WaitForDropdownByClassAndTouchTheIndex(action_dropdown_class_name, action_dropdown_class_index_value))
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(action_dropdown_name_value))
end

def use_active_inactive_filter()
  if $driver.find_elements(:id, "create_filter_btn")[0].displayed?
    begin
    Sleep_Until($driver.find_elements(:class, "dropdown-toggle")[2].click) if $driver.find_elements(:class, "dropdown-toggle")[2].present?
    Sleep_Until($driver.find_elements(:xpath, "//span[contains(.,'Active and Inactive')]").first.click) if $driver.find_elements(:xpath, "//span[contains(.,'Active and Inactive')]").present?
    end
  end
end

def very_deleted_user(inactive_class_id, inactive_attribute_id, inactive_attribute_text)
 puts "MATCHED: \"#{inactive_attribute_text}\" - \e[0m[ \e[32mPASSED\e[0m ]" if $driver.find_element(:class, inactive_class_id).attribute(inactive_attribute_id) == inactive_attribute_text
end