def SetEmployeeProfileDetails()
  steps %Q{
        And I Click On The Profile Tab Of The User
        And I Set The Position From The Existing Positions
        And I Can See That I Can Choose To Set The Company Legal Entity From The Existing Entities
  }
  #selecting the first legal entity from the results
  Sleep_Until(WaitForAnElementByClassAndTouch(SELECT2_DROPDOWN_RESULT_CLASS))

  Sleep_Until(ClickOnSaveButton(SAVE_BTN_ID))
  steps %Q{
                And I Set The Date of Birth As 19/01/1980
  }
  Sleep_Until(ClickOnSaveButton(SAVE_BTN_ID))
end

def SetEmployeeEmploymentDetails()
#   emp_number = 'AUTO' + Time.now.strftime("%Y%m%d%H%M%S")
#   Sleep_Until(WaitForAnElementByIdAndInputValue(USER_EMPLOYMENTDETAILS_EMPNO_ID, emp_number))

  Sleep_Until(WaitForAnElementByIdAndInputValue(USER_EMPLOYMENTDETAILS_RATE_ID, USER_EMPLOYMENTDETAILS_RATE_VALUE))

  Sleep_Until(WaitForAnElementByIdAndTouch(USER_EMPLOYMENTDETAILS_STATEEMPLOYED_ID))
  #selecting the first option from the results
  Sleep_Until(WaitForAnElementByClassAndTouch(SELECT2_DROPDOWN_RESULT_CLASS))

  Sleep_Until(WaitForAnElementByIdAndTouch(USER_PAYMENT_DETAILS_SAVE_ID))
end

def SetSuperDetails()
  membership_num = Time.now.strftime("%Y%m%d%H%M%S")

  #clicking on the edit button for super section
  Sleep_Until(WaitForAnElementByIdAndTouch(USER_SUPERDETAILS_EDIT_BUTTON_ID))

  #clicking on the Add super button
  Sleep_Until(WaitForAnElementByIdAndTouch(USER_SUPERDETAILS_ADD_BUTTON_ID))

  Sleep_Until(WaitForAnElementByIdAndTouch(USER_SUPERDETAILS_SUPERNAME_ID))
  #selecting the first option from the results
  Sleep_Until(WaitForAnElementByClassAndTouch(SELECT2_DROPDOWN_RESULT_CLASS))

  $driver.find_elements(:id, USER_SUPERDETAILS_MEMBERSHIPNO_ID)[1].clear()
  $driver.find_elements(:id, USER_SUPERDETAILS_MEMBERSHIPNO_ID)[1].send_keys(membership_num)

  ClickOnSaveButton(SAVE_BTN_ID)
end

def SetContactDetails()
  Sleep_Until(ClickOnASubTab(USER_PERSONAL_DETAILS_TAB_ID))

  Sleep_Until(WaitForAnElementByIdAndTouch(USER_CONTACT_DETAILS_EDIT_BUTTON_ID))
  sleep (1)

  #checking if the form is displayed, if not then click again on the edit button
  if $driver.find_elements(:id, USER_CONTACTDETAILS_MOBILE_ID).size == 0
    form_present = 0
  end

  if form_present == 0
    Sleep_Until(WaitForAnElementByIdAndTouch(USER_CONTACT_DETAILS_EDIT_BUTTON_ID))
  end

  Sleep_Until(WaitForAnElementByIdAndInputValue(USER_CONTACTDETAILS_MOBILE_ID, USER_CONTACTDETAILS_MOBILE_VALUE))

  Sleep_Until(WaitForAnElementByIdAndInputValue(USER_CONTACTDETAILS_ADDR1_ID, USER_CONTACTDETAILS_ADDR1_VALUE))

  Sleep_Until(SelectFromDropdown(USER_CONTACTDETAILS_COUNTRY_ID, USER_CONTACTDETAILS_COUNTRY_VALUE))

  Sleep_Until(WaitForAnElementByIdAndInputValue(USER_CONTACTDETAILS_SUBURB_ID, USER_CONTACTDETAILS_SUBURB_VALUE))

  Sleep_Until(WaitForAnElementByIdAndInputValue(USER_CONTACTDETAILS_POSTCODE_ID, USER_CONTACTDETAILS_POSTCODE_VALUE))

  ClickOnSaveButton(SAVE_BTN_ID)
end
