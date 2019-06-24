def GoToSite()
  $site_alias = (ENV["URL"] || ENV["url"]) || 'tmsfull'
  $site_type = (ENV["TYPE"] || ENV["type"]) || 'staging'
  
  #checking if its an internal/external facing site
  if !@external_portal.nil?
    $site_url = "https://" + "#{$site_alias}" + ".elmotalent.com.au/careers/" + @external_portal + "/login/" if ($site_type.to_s.downcase == "prod")
    $site_url = "https://" + "#{$site_alias}" + ".elmodev.com/careers/" + @external_portal + "/login/" if ($site_type.to_s.downcase == "staging")
  
  else
    if @vendor_login == 1
      $site_url = "https://" + "#{$site_alias}" + ".elmotalent.com.au/vendor/dashboard" if ($site_type.to_s.downcase == "prod") #Change this URL which determines the production TLD
      $site_url = "https://" + "#{$site_alias}" + ".elmodev.com/vendor/dashboard" if ($site_type.to_s.downcase == "staging")
    else
      $site_url = "https://" + "#{$site_alias}" + ".elmotalent.com.au/dashboard" if ($site_type.to_s.downcase == "prod") #Change this URL which determines the production TLD
      $site_url = "https://" + "#{$site_alias}" + ".elmodev.com/dashboard" if ($site_type.to_s.downcase == "staging") #Change this URL which determines the staging TLD
      $site_url = "https://" + "login.elmopayroll.com.au" if ($site_type.to_s.downcase == "payroll_prod") #Payroll site exception
      $site_url = "https://" + "payrollelmoapp-ase-uat.azurewebsites.net" if ($site_type.to_s.downcase == "payroll_staging") #Payroll site exception
      $site_url = "https://" + "survey2.elmodev.com" if ($site_alias.to_s.downcase == "survey2") #Change this URL which determines the survey TLD
    end
  end
  
  puts "SERVER MODE = " + $site_type.to_s if (ENV["TYPE"] || ENV["type"]) != nil
  $driver.navigate.to($site_url)
end

def GoToSection(general_expand, users_list_path)
  GoToASection(general_expand)
  sleep(2)
  GoToItemLandingPage(users_list_path)
end

def GoToASection(section_expand)
  Sleep_Until(WaitForAnElementByXpathAndTouch(section_expand))
end

def GoToNavBarSection(link_to_click)
  #adding extra sleep to allow the vertical left nav menu to load
  sleep(2)
  
  Sleep_Until($driver.find_elements(:xpath, link_to_click).last.click)
end

def GoToAddNewUsersPage(add_new_user_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(add_new_user_btn))
end

def CreateUsers(arg2, arg3, arg4, arg5, arg6)
  begin
    
    #check employee number configuration
    employeeNumberEnable = $daos.get_epms_config_enabled('employeeNumberEnable') unless $daos.get_epms_config_enabled('employeeNumberEnable').nil?
    employeeNumberAutoGeneration = $daos.get_epms_config_enabled('employeeNumberAutoGeneration')[:value].to_i unless $daos.get_epms_config_enabled('employeeNumberAutoGeneration').nil?
    userFieldsLocked_employeeNumber = $daos.get_epms_config_enabled('userFieldsLocked_employeeNumber')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_employeeNumber').nil?
    Sleep_Until(SelectEmployeeNumber(NEW_USER_EMPLOYEE_NUMBER_ID, NEW_USER_DETAILS_MAP[:employee_number_value])) if (employeeNumberEnable && employeeNumberAutoGeneration == 0 && userFieldsLocked_employeeNumber != 1)
    
    Sleep_Until(EnterUserDetails(NEW_USER_FIRST_NAME_ID, arg3))
    Sleep_Until(EnterUserDetails(NEW_USER_LAST_NAME_ID, arg4))
    Sleep_Until(EnterUserDetails(NEW_USER_USERNAME_ID, @@user_name)) if $add_user_type == "EMP"
    Sleep_Until(EnterUserDetails(NEW_USER_EMAIL_ID, @@email_address))
   
    # check country configuration
    countryEnable = $daos.get_epms_config_enabled('countryEnable')[:value].to_i unless $daos.get_epms_config_enabled('countryEnable').nil?
    userfFieldsLocked_country = $daos.get_epms_config_enabled('userFieldsLocked_country')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_country').nil?
    Sleep_Until(SingleSelectFromSelect2Dropdown(NEW_USER_COUNTRY_ID, SELECT2_DROPDOWN_ID, NEW_USER_DETAILS_MAP[:country_value], SELECT2_DROPDOWN_RESULT_CLASS)) if (countryEnable && countryEnable == 1 && userfFieldsLocked_country != 1)
   
    # check state configuration
    stateEnable = $daos.get_epms_config_enabled('stateEnable')[:value].to_i unless $daos.get_epms_config_enabled('stateEnable').nil?
    userFieldsLocked_state = $daos.get_epms_config_enabled('userFieldsLocked_state')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_state').nil?
    Sleep_Until(SingleSelectFromSelect2Dropdown(NEW_USER_STATE_ID, SELECT2_DROPDOWN_ID, NEW_USER_DETAILS_MAP[:state_value], SELECT2_DROPDOWN_RESULT_CLASS)) if (stateEnable && stateEnable == 1 && userFieldsLocked_state != 1)

    # check timezone configuration
    timezoneEnable = $daos.get_epms_config_enabled('timezoneEnable')[:value].to_i unless $daos.get_epms_config_enabled('timezoneEnable').nil?
    Sleep_Until(SingleSelectFromSelect2Dropdown(NEW_USER_TIMEZONE_ID, SELECT2_DROPDOWN_ID, NEW_USER_DETAILS_MAP[:timezone_value], SELECT2_DROPDOWN_RESULT_CLASS)) if (timezoneEnable == 1)
    
    # check mobile configuration
    mobileEnable = $daos.get_epms_config_enabled('mobileEnable')[:value].to_i unless $daos.get_epms_config_enabled('mobileEnable').nil?
    userFieldsLocked_mobile = $daos.get_epms_config_enabled('userFieldsLocked_mobile')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_mobile').nil?
    Sleep_Until(EnterUserDetails(NEW_USER_MOBILE_ID, EM_USER_MOBILE_VALUE)) if (mobileEnable && mobileEnable == 1 &&  userFieldsLocked_mobile != 1)
    
    # check manager configuration
    selectManager = $daos.get_epms_config_enabled('selectManager')[:value].to_i unless $daos.get_epms_config_enabled('selectManager').nil?
    userFieldsLocked_manager = $daos.get_epms_config_enabled('userFieldsLocked_manager')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_manager').nil?
    Sleep_Until(SelectAManager(MANAGER_SELECT_DROPDOWN_ID, MANAGER_SELECT_INPUT_ID, arg5, MANAGER_SELECT_RESULT_ID)) if arg5 && (selectManager && selectManager == 1 && userFieldsLocked_manager != 1)

    # check date of birth configuration
    dateOfBirthEnable = $daos.get_epms_config_enabled('dateOfBirthEnable')[:value].to_i unless $daos.get_epms_config_enabled('dateOfBirthEnable').nil?
    userFieldsLocked_dateOfBirth = $daos.get_epms_config_enabled('userFieldsLocked_dateOfBirth')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_dateOfBirth').nil?
    Sleep_Until(SelectDate(SELECT_DATEOFBIRTH_ID, NEW_USER_DETAILS_MAP[:dateofbirth_value])) if (dateOfBirthEnable && dateOfBirthEnable == 1 && userFieldsLocked_dateOfBirth != 1)

    # check start date configuration
    startDateEnable =  $daos.get_epms_config_enabled('startDateEnable')[:value].to_i unless $daos.get_epms_config_enabled('startDateEnable').nil?
    userFieldsLocked_startDate = $daos.get_epms_config_enabled('userFieldsLocked_startDate')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_startDate').nil?
    Sleep_Until(SelectDate(SELECT_START_DATE_ID, arg6)) if (startDateEnable && startDateEnable == 1 && userFieldsLocked_startDate != 1)

    # check expiry date configuration
    userExpiryDateEnable = $daos.get_epms_config_enabled('userExpiryDateEnable')[:value].to_i unless $daos.get_epms_config_enabled('userExpiryDateEnable').nil?
    userFieldsLocked_expiryDate = $daos.get_epms_config_enabled('userFieldsLocked_expiryDate')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_expiryDate').nil?
    if (userExpiryDateEnable && userExpiryDateEnable == 1 && userExpiryDateEnable != 1)
      WaitForAnElementByXpathAndTouch(SELECT_ENABLE_EXPIRY_DATE_ID)
      Sleep_Until(SelectDate(SELECT_EXPIRY_DATE_ID, NEW_USER_DETAILS_MAP[:expiry_date_value]))
    end
    
    # check end date configuration
    endDateEnable = $daos.get_epms_config_enabled('endDateEnable')[:value].to_i unless $daos.get_epms_config_enabled('endDateEnable').nil?
    userFieldsLocked_endDate = $daos.get_epms_config_enabled('userFieldsLocked_endDate')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_endDate').nil?
    Sleep_Until(SelectDate(SELECT_END_DATE_ID, NEW_USER_DETAILS_MAP[:end_date_value])) if (endDateEnable && endDateEnable == 1 && userFieldsLocked_endDate != 1)
    
    # check employee user type configuration (This field is enabled when RTA module is enabled)
    employeeUserTypeEnable = $daos.get_epms_config_enabled('employeeUserTypeEnable')[:value].to_i unless $daos.get_epms_config_enabled('employeeUserTypeEnable').nil?
    userFieldsLocked_employeeUserType = $daos.get_epms_config_enabled('userFieldsLocked_employeeUserType')[:value].to_i unless $daos.get_epms_config_enabled('userFieldsLocked_employeeUserType').nil?
    Sleep_Until(SingleSelectFromSelect2Dropdown(SELECT_USER_TYPE_DROPDOWN_ID, SELECT2_DROPDOWN_ID, NEW_USER_DETAILS_MAP[:employee_user_type], SELECT2_DROPDOWN_RESULT_CLASS)) if (employeeUserTypeEnable && employeeUserTypeEnable == 1 && userFieldsLocked_employeeUserType != 1)
    
    Sleep_Until(SelectFromDropdown(SELECT_ISELMO_DROPDOWN_ID, "Yes")) if arg2 == "ELMO"
    Sleep_Until(EnterUserDetails(USER_PASSWORD_ID, NEW_USER_DETAILS_MAP[:user_password_value]))
    Sleep_Until(EnterUserDetails(USER_PASSWORD_RECONFIRM_ID, NEW_USER_DETAILS_MAP[:user_password_value]))
    Sleep_Until(ClickOnSaveButton(SAVE_BTN_ID))
    puts COLOR_BLUE + "Created new user with firstname '" + @@first_name + "' and lastname as '" + @@last_name + "'"
  end
end

def CreateAUser(user_type, firstname, lastname, manager_name, role)
  if role.nil?
    
    #if role is not specified the user is created with the default role of Employee
    role_name = 'Employee'
  else
    role_name = role
  end
  @@first_name = firstname
  @@last_name = lastname if $add_user_type == "EMP" #Value of $add_user_type derived from Step 'I Go To "(.*)" Under "(.*)" Section' since Users and Onboarding users take different path
  @@last_name = lastname + ".ob" if $add_user_type == "OB"
  @@user_name = @@first_name + "." + @@last_name
  @@email_address = @@user_name + NEW_USER_DETAILS_MAP[:email_suffix_value] #Email = firstname.lastname@email_suffix
  
  #Check if user already exists in the database or not. If exists, skip the current creation else, create the user
  user_list_result = $daos.get_userid(@@user_name)
  if !user_list_result.nil?
    puts COLOR_YELLOW + "User #{user_list_result} already exists in the database.".upcase
    skip_this_scenario
  else
    
    #TODO can change it when PR-1787 is fixed
    #setting the start date to a very date for Elmo Payroll
    CreateUsers(user_type, @@first_name, @@last_name, manager_name, '01/06/2016')
    if role_name != 'Employee'
      #setting the role as well immediately after creating the user.
      steps %Q{
                  And   I Click On "Role" Tab
                  And   I Select "Role" Classic Dropdown As "#{role_name}"
      }
    end
    puts COLOR_BLUE + "Created new user with role '" + role_name.upcase + "'"
  end
end

def SelectEmployeeNumber(arg1, arg2)
  $driver.find_element(:xpath, arg1).clear()
  WaitForAnElementByXpathAndInputValue(arg1, arg2)
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
  Sleep_Until(SelectFromDropdown(select_timezone_id, select_timezone_value))
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
  case tab_name
    when 'Requisitions'
      Sleep_Until(ClickElement('xpath', REQUISITIONS_TAB))
    else
      Sleep_Until($driver.find_element(:xpath, "//a[contains(.,'#{tab_name}')]").click)
  end
end

def ClickOnASubTab(sub_tab_name_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(sub_tab_name_id))
end

# TODO this new class "elmo-icon-admin needs to be added to classic view, till then please keep the navbar set to vertical menu for faster test execution"
def GoToAdminSettings(admin_cog)
  begin
    Sleep_Until(WaitForAnElementByClass("elmo-icon-admin"))
    Sleep_Until(TouchAdminMenu("elmo-icon-admin"))
  rescue
    puts "slow execution : horizontal navbar mode on, please change it to vertical"
    WaitForAnElementByClass(admin_cog)
    TouchAdminMenu(admin_cog)
  end
end

def VerifyErrorAlertMessage(alert_id, alert_msg)
  Sleep_Until(VerifyAnElementExistByXPath(alert_id, alert_msg))
end

def GetLoginDetails(login_name)
  begin
    case login_name
      
      when "ELMO Setup Admin"
        username = ELMO_SETUP_ADMIN_USERNAME
        password = ELMO_SETUP_ADMIN_PASSWORD
      
      when "ELMO Super Admin"
        username = ELMO_SUPER_USERNAME
        password = ELMO_SUPER_PASSWORD
      
      when "ELMO Admin"
        username = ELMO_ADMIN_USERNAME
        password = ELMO_ADMIN_PASSWORD
      
      when "Company Admin"
        username = COMP_ADMIN_USERNAME
        password = COMP_ADMIN_PASSWORD
      
      when "Contract Admin"
        username = COMP_ADMIN_USERNAME
        password = COMP_ADMIN_PASSWORD
      
      when "Learning Admin"
        username = LEARNING_ADMIN_USERNAME
        password = LEARNING_ADMIN_PASSWORD
      
      when "Recruitment Admin"
        username = RECRUITMENT_ADMIN_USERNAME
        password = RECRUITMENT_ADMIN_PASSWORD
      
      when "Leave Admin"
        username = LEAVE_COMPANY_ADMIN_USER
        password = LEAVE_COMPANY_ADMIN_PASS
      
      #User with security profiles Payroll Admin and role-Company Admin
      when "Payroll Admin"
        username = PAYROLL_ADMIN_USERNAME
        password = PAYROLL_ADMIN_PASSWORD
      
      #User with security profile- HR Manager, User Administrator Page Permissions
      when "HR Manager"
        username = HRMGR_ADMIN_USERNAME
        password = HRMGR_ADMIN_PASSWORD
      
      when "Company Manager"
        username = COMPANY_MANAGER_USER
        password = COMPANY_MANAGER_PASS
      
      when "Company Employee"
        username = COMPANY_EMPLOYEE_1_USER
        password = COMPANY_EMPLOYEE_1_PASS
      
      when "Specific Automation User"
        username = DOC_USERNAME
        password = DOC_PASSWORD
      
      when "Specific Automation User Manager"
        username = DOC_MANAGER_NAME
        password = DOC_MANAGER_PASSWORD
      
      when "Automation Company Admin"
        username = AUTO_COMP_ADMIN_NAME
        password = AUTO_COMP_ADMIN_PASSWORD
      
      else
        username = @username
        password = @user_pwd
    end
  end
  
  return username, password
end

def EnterLoginDetails(username, pwd)
  EnterUsername(USER_NAME, username)
  EnterPassword(PASS_WORD, pwd)
end

def VerifyUserExists(username)
  #getting the userid based on the username and saving for later
  @user_id = $daos.get_userid(username)
  if !@user_id.nil?
    puts COLOR_BLUE + "Id: '#{@user_id[:id]}', Username: #{@user_id[:username]}, is_elmo: '#{@user_id[:is_elmo]}', is_notified: '#{@user_id[:is_notified]}', confirmed: '#{@user_id[:confirmed]}', is_deleted: '#{@user_id[:is_deleted]}'"
  
  else
    puts COLOR_YELLOW + "Unable to retrieve User ID. Please check the database manually".upcase
    skip_this_scenario
  end
end

def GoToThePage(login_page)
  $driver.navigate.to(login_page)
end

def EnterUsername(username, value)
  WaitForAnElementByIdAndInputValue(username, value)
end

def EnterPassword(password, value)
  WaitForAnElementByIdAndInputValue(password, value)
end

def EnterEmail(email, value)
  WaitForAnElementByIdAndInputValue(email, value)
end

def LogInAndWaitForTheDashboard(tag_name, admin_menu)
  TouchLoginButton(tag_name)
  puts COLOR_BLUE + "Title: " + $driver.title
  puts COLOR_BLUE + "URL: " + $driver.current_url
  sleep(3)
end

def LogOutFromTheDashboard(user_profile_icon, logout_button)
  Sleep_Until(WaitForAnElementByIdAndTouch(user_profile_icon))
  Sleep_Until(WaitForAnElementByXpathAndTouch(logout_button))
  sleep(1)
  $driver.quit
end

def TouchLoginButton(tag_name)
  WaitForAnElementByTagNameAndTouch(tag_name)
end

def TouchAdminMenu(admin_menu)
  WaitForAnElementByClassAndTouch(admin_menu)
end

def EditContactDetails(contact_type)
  case contact_type
    when 'Emergency Contact'
      Sleep_Until(ClickOnASubTab(EDIT_EM_CONTACT_BTN_ID))
      Sleep_Until(ClickOnASubTab(ADD_EM_CONTACT_BTN_ID))
    when 'Next of Kin'
      Sleep_Until(ClickOnASubTab(EDIT_NOK_CONTACT_BTN_ID))
      Sleep_Until(ClickOnASubTab(ADD_NOK_CONTACT_BTN_ID))
    else
      Sleep_Until(WaitForAnElementByIdAndTouch(USER_CONTACT_DETAILS_EDIT_BUTTON_ID))
      sleep (1)
      
      #checking if the form is displayed, if not then click again on the edit button
      if $driver.find_elements(:id, USER_CONTACTDETAILS_MOBILE_ID).size == 0
        form_present = 0
      end
      
      if form_present == 0
        Sleep_Until(WaitForAnElementByIdAndTouch(USER_CONTACT_DETAILS_EDIT_BUTTON_ID))
      end
  end
end

def CheckFieldInPersonalDetails()
  Sleep_Until(VerifyAnElementExists('xpath', '//label[text()="Suburb/Town/City"]'))
  puts COLOR_GREEN + "field exists with name suburb/town/city".upcase
end

def UserProfileSetupThroughJmeter()
  url = $site_url.split('//')[1].split('/')[0]
  
  if ENV['MYMAC']
    %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/General/UserProfileSetup.jmx -Jurl=#{url} -Jusername=#{@username})
  else
    %x(/var/lib/apache-jmeter/bin/./jmeter -n -t ./JMETER_AUTO/Jmeter_tests/General/UserProfileSetup.jmx -Jurl=#{url} -Jusername=#{@username})
  end
  puts COLOR_GREEN + "user profile setup completed".upcase
end

def EnterUserProfileDetails(arg1, arg2)
  SingleSelectFromSelect2Dropdown(arg1, SELECT2_DROPDOWN_ID, arg2, SELECT2_DROPDOWN_RESULT_CLASS)
end