
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
    Sleep_Until(SelectFromDropdown('//select[@id="NoteForm_acl_key"]', "#{visibility_value}"))
  end
end


def CheckNoteAdded(action)
  expect($driver.find_elements(:xpath, NOTE_POSTED_BY_ID)[0].text).to eq("manager1 scriptonce1")

  VerifyAnElementExists('xpath', NOTE_EDIT_BUTTON_ID)
  VerifyAnElementExists('xpath', NOTE_DEL_BUTTON_ID)

  if action == "Added"
    expect($driver.find_elements(:xpath, NOTE_POSTED_TIME_ID)[0].text).to eq(@time_note_added)
    puts COLOR_GREEN + "note has been added to the user profile".upcase
  else
    puts COLOR_GREEN + "note has been edited".upcase
  end
end


def CheckAutopaySetting(setting_value)
  sleep (8)

  autopay_setting = GetTextAssociatedToElement("xpath", USER_PAYMENT_DETAILS_AUTOPAY_LABEL_ID)

  if autopay_setting == setting_value
    puts COLOR_GREEN + "autopay setting value matches".upcase
  else
    puts COLOR_RED + "autopay setting value does not match".upcase
    fail
  end
end


def GetAutopayToggleSetting()
  return $driver.find_element(:id, USER_PAYMENT_DETAILS_AUTOPAY_ID).selected?
end


def SetAutopay(setting_value)
  #waiting till the employment details section is loaded
  sleep (6)
  autopay_setting = GetAutopayToggleSetting()

  if (setting_value == "Yes" and autopay_setting != true) || (setting_value == "No" and autopay_setting != false)
    Sleep_Until(JavascriptClick(USER_PAYMENT_DETAILS_AUTOPAY_ID))
  else
    puts COLOR_BLUE + "Autopay is already set with the value " + setting_value
    Sleep_Until(WaitForAnElementByXpathAndTouch(USER_PAYMENT_DETAILS_CANCEL_BUTTON_ID))
  end
end


def SearchForUserWithEmpDetails()
  @user_search = $daos.get_employee_with_autopay_no()

  if !@user_search.nil?
    $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(@user_search[:first_name]+ ' ' + @user_search[:last_name])
    Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  else
    puts COLOR_YELLOW + "no users available for this criteria".upcase
    skip_this_scenario
  end
end


def SearchForUserWithDefaultAutopaySetting()
  @user_search = $daos.get_employee_with_default_autopay()

  if !@user_search.nil?
    $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(@user_search[:first_name]+ ' ' + @user_search[:last_name])
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


def EditNote()
  Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_EDIT_BUTTON_ID))
  steps %{
    And I Enter Note
  }
end


def DeleteNote()
  @posted_time = $driver.find_elements(:xpath, NOTE_POSTED_TIME_ID)[0].text
  Sleep_Until(WaitForAnElementByXpathAndTouch(NOTE_DEL_BUTTON_ID))
  Sleep_Until(PressEnterConfirm())
  Sleep_Until(PressEnterOK())
end


def VerifyDeletionOfNote()
  #checks for the absence of the post by checking the posted time
  expect($driver.find_elements(:xpath, NOTE_POSTED_TIME_ID)[0].text).not_to eq(@posted_time)
end


def SaveAutopayChanges()
  Sleep_Until(WaitForAnElementByCSSAndTouch(MODAL_YES_BUTTON_CSS))

  Sleep_Until(WaitForAnElementByIdAndTouch(USER_PAYMENT_DETAILS_SAVE_ID))

  modal_title = GetTextAssociatedToElement("xpath",USER_DETAILS_CONFIRMATION_MODAL_TITLE_ID)
  modal_title == USER_DETAILS_CONFIRMATION_MODAL_TITLE

  #keeping history for tracking history
  Sleep_Until(WaitForAnElementByXpathAndTouch(KEEP_HISTORY_BUTTON_ID))
end


def SearchForEmpWithNoLeavePolicy()
  @user_search = $daos.get_employee_with_no_leavepolicy()

  if !@user_search.nil?
    $driver.find_element(:id, USERS_SEARCH_BOX_ID).send_keys(@user_search[:first_name]+ ' ' + @user_search[:last_name])
    Sleep_Until(WaitForAnElementByXpathAndTouch(USERS_SEARCH_BUTTON_ID))
  else
    puts COLOR_YELLOW + "no users available for this criteria".upcase
    skip_this_scenario
  end
end


def VerifyPlaceholder()
  expect($driver.find_element(:xpath, "//span[@id='select2-chosen-8']").text).to eq('Select a Leave Policy')
  puts COLOR_GREEN + "placeholder when no leave policy selected is present".upcase
end


def SetLeavePolicy(leave_policy_title)
  sleep (6)
  Sleep_Until(SingleSelectFromSelect2Dropdown(USER_EMPLOYMENTDETAILS_LEAVEPOLICY_INPUT_ID, SELECT2_DROPDOWN_ID, leave_policy_title, SELECT2_DROPDOWN_RESULT_CLASS))
end


def SaveEmploymentChanges()
  modal_title = GetTextAssociatedToElement("xpath", USER_DETAILS_CONFIRMATION_MODAL_TITLE_ID)

  if modal_title == USER_DETAILS_CONFIRMATION_MODAL_TITLE
    puts COLOR_BLUE + "Modal title matches"
  end

  #keeping history for tracking history
  Sleep_Until(WaitForAnElementByXpathAndTouch(KEEP_HISTORY_BUTTON_ID))
end