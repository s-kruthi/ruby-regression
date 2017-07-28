def go_to_site(login_page)
 site_url = "https\:\/\/" + "#{login_page}" + "\.dev\.elmodev\.com\/dashboard"
     $driver.navigate.to(site_url)
 end

def go_to_the_sections(admin_cog,general_expand,users_list_path)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  sleep(2)
  goToDocumentsSection(general_expand)
  sleep(2)
  goToItemLandingPage(users_list_path)
end

def go_to_add_new_users_page(add_new_user_btn)
  WaitForAnElementByXpathAndTouch(add_new_user_btn)
end

def add_user_details(limit)
  i = 1
  for loop in i..limit do
    first_name = NEW_USER_FIRST_NAME_PREFIX + loop.to_s
    last_name = NEW_USER_LAST_NAME_PREFIX + loop.to_s
    user_name = first_name + "." +  last_name
    email_address = user_name + NEW_USER_EMAIL_SUFFIX
    enter_user_details(NEW_USER_FIRST_NAME_ID, first_name)
    enter_user_details(NEW_USER_LAST_NAME_ID, last_name)
    enter_user_details(NEW_USER_USERNAME_ID, user_name) if $add_user_type == "EMP"
    enter_user_details(NEW_USER_EMAIL_ID, email_address)
    select_a_manager(MANAGER_SELECT_DROPDOWN_ID, MANAGER_SELECT_INPUT_ID, MANAGER_SELECT_INPUT_VALUE,MANAGER_SELECT_RESULT_ID) if SELECT_MANAGER.to_i == 1
    select_date(SELECT_START_DATE_ID, SELECT_START_DATE_VALUE) if SELECT_START_DATE.to_i == 1
    select_date(SELECT_EXPIRY_DATE_ID, SELECT_EXPIRY_DATE_VALUE) if SELECT_EXPIRY_DATE.to_i == 1
    select_timezone(SELECT_TIMEZONE_ID, SELECT_TIMEZONE_VALUE) if SELECT_TIMEZONE.to_i == 1
    press_save_button(USER_CREATE_SAVE_BTN_ID)
    sleep (3)
    loop += 1
  end
end

def enter_user_details(input_id, input_value)
  $driver.find_element(:xpath, input_id).clear()
  Sleep_Until(WaitForAnElementByXpathAndInputValue(input_id, input_value))
end


def select_a_manager(recipient_field_id, recipient_input_id, recipient1_input_value, recipient1_result_id)
  $driver.find_element(:id, recipient_field_id).click
  Sleep_Until($driver.find_elements(:class, recipient_input_id).first.send_keys(recipient1_input_value))
  Sleep_Until($driver.find_elements(:class, recipient1_result_id).first.click)
end

def select_date(select_date_id, select_date_value)
  Sleep_Until($driver.find_element(:xpath, select_date_id).clear())
  Sleep_Until(WaitForAnElementByXpathAndInputValue(select_date_id, select_date_value))
end
#
def select_timezone(select_timezone_id, select_timezone_value)
  Sleep_Until(select_from_drop_down(select_timezone_id, select_timezone_value))
end

def press_save_button(user_create_save_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(user_create_save_btn_id))
end