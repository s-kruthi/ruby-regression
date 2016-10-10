
def GoToPaymentDetailsSectionOfAParticularEmployee(employment_details_section)
  WaitForAnElementByIdAndTouch(employment_details_section)
end

def UnmaskAndViewRateAndSalaryDetailsForTheEmployee()
  $driver.find_element(:xpath, "//button[@ng-mousedown='section.showRate = 1']").touch_action(:press,  hold: 300000)
  sleep(2)
  VerifyAnElementExistByClass("masked-value","$231.00 per hour\nShow")
  $driver.quit
end

def GoToTaxFileNumberSectionOfAParticularEmployee(tfn_details_section)
  WaitForAnElementByIdAndTouch(tfn_details_section)
end

def UnmaskAndViewTaxFileNumberDetailsForTheEmployee()
  sleep(1)
  $driver.find_element(:xpath, "//button[@ng-mousedown='section.showTfn = 1']").touch_action(:press,  hold: 300000)
  sleep(2)
  VerifyAnElementExistByClass("masked-value","865414088\nShow")
  $driver.quit
end