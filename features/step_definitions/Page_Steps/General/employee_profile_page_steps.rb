
def GoToPaymentDetailsSectionOfAParticularEmployee(employment_details_section)
  WaitForAnElementByIdAndTouch(employment_details_section)
end


def UnmaskAndViewRateAndSalaryDetailsForTheEmployee()
  sleep(2)
  $driver.find_element(:xpath, "//button[@ng-mousedown='section.showRate = 1']").touch_action(:press,  hold: 300000)
  sleep(3)
  VerifyAnElementExistByClass("masked-value","$40.00 per hour\nShow")
  $driver.quit
end


def GoToTaxFileNumberSectionOfAParticularEmployee(tfn_details_section)
  WaitForAnElementByIdAndTouch(tfn_details_section)
end


def UnmaskAndViewTaxFileNumberDetailsForTheEmployee()
  sleep(2)
  $driver.find_element(:xpath, "//button[@ng-mousedown='section.showTfn = 1']").touch_action(:press,  hold: 300000)
  sleep(3)
  VerifyAnElementExistByClassAndIndex("masked-value","865414088\nShow",2)
  $driver.quit
end


def search_for_input(search_input_id, search_input_value, search_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndClearValue(search_input_id))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(search_input_id, search_input_value))
  Sleep_Until(WaitForAnElementByXpathAndTouch(search_btn_id))
end


def click_on_search_result(search_employee_class)
  Sleep_Until(WaitForAnElementByXpathAndTouchTheIndex(search_employee_class, 0))
end


def verify_employee_profile(employee_name, employee_email)
    VerifyAnElementExistByClassAndIndex(USER_PROFILE_EMAIL_CLASS_NAME, employee_email, 1) #This is the email address
    VerifyAnElementExistByClassAndIndex(USER_PROFILE_BODY_CLASS_NAME, employee_name, 0) #This is the employee profile view
end

def SetNoteVisibility(visibility_value)
  if visibility_value != "default"
    i = 0
    while(i != 4)
      #Clear the default visibility settings so click 4 times, as it defaults to 4 values
      Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_VISIBILITY_CLEAR_ID))
      i = i + 1
    end
    Sleep_Until(SelectFromDropDown('//select[@id="NoteForm_acl_key"]', "#{visibility_value}"))
  end
  @note_visibility_value = visibility_value
end


def CheckNoteAdded()
  #check that edit and delete options are not there currently doesnt work beacuse of PMS-15737
  #check note added timestamp and by user if visibility is set to Admin/HR Manager then it cant be verified on page
  if @note_visibility_value == ('Manager'||'Any Manager'||'default')
    $driver.find_elements(:xpath, NOTE_POSTED_BY_ID)[0].text == "manager1 omar1"
    $driver.find_elements(:xpath, NOTE_POSTED_TIME_ID)[0].text.include? @time_note_added
    puts COLOR_GREEN + "Note has been added to the user profile"
  end
end


def CheckAutopaySetting(setting_value)
  autopay_setting = GetTextAssociatedToElement("xpath", USER_PAYMENT_DETAILS_AUTOPAY_LABEL_ID)
  if autopay_setting == setting_value
    puts COLOR_GREEN + "autopay setting value matches".upcase
  else
    puts COLOR_RED + "autopay setting value does not match".upcase
    fail
  end
end


def GetAutopayToggleSetting()
  return Sleep_Until($driver.find_element(:id, USER_PAYMENT_DETAILS_AUTOPAY_ID).selected?)
end


def SetAutopay(setting_value)
  autopay_setting = GetAutopayToggleSetting()

  if (setting_value == "Yes" and autopay_setting != true) || (setting_value == "No" and autopay_setting != false)
    Sleep_Until(JavascriptClick(USER_PAYMENT_DETAILS_AUTOPAY_ID))
  else
    puts "Autopay is already set with the value " + setting_value
    Sleep_Until(WaitForAnElementByXpathAndTouch(USER_PAYMENT_DETAILS_CANCEL_BUTTON_ID))
  end
end


def SearchForUserWithEmpDetails()
  user = $daos.get_employee_with_autopay_no()

  if !user.nil?
    $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(user[:first_name]+ ' ' + user[:last_name])
    Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  else
    puts COLOR_YELLOW + "no users available for this criteria".upcase
    skip_this_scenario
  end

end


def SearchForUserWithDefaultAutopaySetting()
  user = $daos.get_employee_with_default_autopay()

  if !user.nil?
    $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(user[:first_name]+ ' ' + user[:last_name])
    Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  else
    puts COLOR_YELLOW + "no users available for this criteria".upcase
    skip_this_scenario
  end
end


def JavascriptClick(element_id)
  $driver.execute_script("$(#{element_id}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
end


def GetTextAssociatedToElement(type,identifier)
  return $driver.find_element(:"#{type}", identifier).text
end