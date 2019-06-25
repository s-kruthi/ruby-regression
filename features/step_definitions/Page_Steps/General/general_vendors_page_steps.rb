def AddVendor()
  Sleep_Until(ClickElement('id', VENDOR_ADD_BTN_ID))
  WaitForAnElementByIdAndInputValue(VENDOR_NAME_ID, VENDOR_NAME_VAL)
  WaitForAnElementByIdAndInputValue(VENDOR_DESC_ID, VENDOR_DESC_VAL)
  Sleep_Until(ClickElement('id', VENDOR_SAVE_BTN_ID))
end

def SearchForVendor(vendor_name)
  # query to get the vendor details
  @vendor_details = $daos.get_vendor_details(vendor_name)

  if !@vendor_details.nil?
    Sleep_Until(SearchACourse(VENDOR_SEARCH_ID, @vendor_details[:name], COURSE_SEARCH_BTN_ID))
  else
    puts COLOR_YELLOW + "vendor not found, check manually".upcase
    skip_this_scenario
  end
end

def EditNameVendor(edit_name)
  Sleep_Until(ClickElement("xpath", "//a[contains(@href, '/edit/#{@vendor_details[:id]}')]"))
  ClearField('id', VENDOR_NAME_ID )
  WaitForAnElementByIdAndInputValue(VENDOR_NAME_ID, edit_name)
  ClickOnSaveButton(SAVE_BTN_ID)
end

def EnterVendorUserDetails()
  WaitForAnElementByIdAndInputValue(VENDOR_USER_FIRSTNAME_ID, VENDOR_NAME_VAL)
  WaitForAnElementByIdAndInputValue(VENDOR_USER_LASTNAME_ID, VENDOR_NAME_VAL)

  suffix = Time.now.strftime("%Y%m%d%H%M%S").to_s
  vendor_user_email = 'vendorscriptonce_'+ suffix +'@elmodev.com'
  WaitForAnElementByIdAndInputValue(VENDOR_USER_EMAIL_ID, vendor_user_email)

  WaitForAnElementByIdAndInputValue("vendoruser_phoneWork", NEW_USER_DETAILS_MAP[:mobile_number])
  WaitForAnElementByIdAndInputValue("vendoruser_mobile", NEW_USER_DETAILS_MAP[:mobile_number])

  WaitForAnElementByIdAndTouch(VENDOR_USER_SAVE_BTN_ID)
end

def ViewVendorUsers()
  # query to get the count of users associated to the vendor
  count = $daos.get_vendor_usercount(@vendor_details[:id])

  if count == 0
    VerifyAnElementNotExist("xpath", PAGINATION_ID)
    puts COLOR_BLUE + "No users found"
  else
    results_count = $driver.find_element(:xpath, PAGINATION_ID).text.split(" ")[4].to_i
    if results_count.eql? count
      puts COLOR_BLUE + "Results match"
    end
  end
end

# click on the actions dropdown in the table
def ClickActionsDropdown()
  Sleep_Until(ClickElement("xpath", ACTION_DROPDOWN_ID))
end

def PerformActionVendor(action)
  case action
    when "Add Vendor User"
      identifier = "//a[@href='/admin/vendor/" + @vendor_details[:id].to_s + "/user/new/']"
    when "View Vendor Users"
      identifier = "//a[@href='/admin/vendor/users/" + @vendor_details[:id].to_s + "']"
    when "Deactivate Vendor"
      identifier = "//a[@href='/admin/vendor/activate-toggle/" + @vendor_details[:id].to_s + "']"
  end
  Sleep_Until(ClickElement("xpath", identifier))
end

def SearchForVendorUser()
  # query for vendor user to perform action on
  @vendor_user = $daos.get_vendor_user(@vendor_details[:id])

  if !@vendor_user.nil?
    Sleep_Until(SearchACourse(VENDOR_SEARCH_ID, @vendor_user[:name], COURSE_SEARCH_BTN_ID))
  else
    puts COLOR_YELLOW + "vendor user not found, check manually".upcase
    skip_this_scenario
  end
end

def PerformActionVendorUser(action)
  case action
    when "Edit"
      identifier = "//a[@href='/admin/vendor/" + @vendor_details[:id].to_s + "/user/edit/" + @vendor_user[:id].to_s + "']"
      Sleep_Until(ClickElement("xpath", identifier))
      ClearField('id', VENDOR_USER_FIRSTNAME_ID)
      WaitForAnElementByIdAndInputValue(VENDOR_USER_FIRSTNAME_ID, VENDOR_USER_NAME_EDIT_VAL)
      WaitForAnElementByIdAndTouch(VENDOR_USER_SAVE_BTN_ID)
    when "Deactivate"
      identifier = "//a[@href='/admin/user-active-toggle/" + @vendor_user[:id].to_s + "']"
      Sleep_Until(ClickElement("xpath", identifier))
  end
end

def ChangePassword()
  # first need to navigate to the edit vendor user profile page
  identifier = "//a[@href='/admin/vendor/" + @vendor_details[:id].to_s + "/user/edit/" + @vendor_user[:id].to_s + "']"
  Sleep_Until(ClickElement("xpath", identifier))

  # navigate to the change password tab
  change_pwd = "//a[@href='/admin/vendor/" + @vendor_details[:id].to_s + "/user/edit/" + @vendor_user[:id].to_s + "/password']"
  Sleep_Until(ClickElement("xpath", change_pwd))

  # change password
  WaitForAnElementByIdAndInputValue("vendoruser_password_first", NEW_USER_DETAILS_MAP[:user_password_value])
  WaitForAnElementByIdAndInputValue("vendoruser_password_second", NEW_USER_DETAILS_MAP[:user_password_value])
  WaitForAnElementByIdAndTouch(VENDOR_USER_SAVE_BTN_ID)
end
