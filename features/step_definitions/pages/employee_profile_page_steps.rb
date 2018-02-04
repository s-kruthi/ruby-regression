
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