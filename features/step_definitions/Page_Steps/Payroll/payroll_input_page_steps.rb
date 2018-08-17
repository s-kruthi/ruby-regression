def ClkAddTermination(link)
  sleep 10
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
end


def SelectTermEmp(type,link)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
  $driver.find_element(:xpath, "#{link}").send_keys :down
  PressEnterKey(type,link)
  $terminate_emp = $driver.find_element(:xpath, "#{link}").text
  puts 'The Terminated member is: ' + $terminate_emp
end


def ClkAddTimesheet(link)
  sleep 5
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
end


def EnterTimeDetails(link,val)
  WaitForAnElementByXpathAndClearValue(link)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(link,val))
  #PressEnterKey(XPATH_LOC_TYPE,link)----add this if enter key is required
end


def CheckRateOfPay(type,id)
  Sleep_Until(VerifyAnElementExistsAndPrintText(type, id))
  puts "Rate of Pay is present"
end


def CheckCostCentre(type,id)
  Sleep_Until(VerifyAnElementExistsAndPrintText(type, id))
  puts "Allocate to cost centre is present"
end


def ChkLoadingFactor(type,id)
  Sleep_Until(VerifyAnElementExistsAndPrintText(type, id))
  puts "Loading Factor is present"
end


def InputCheckFields(type,id,text)
  puts "The default value of " + text + " is: "
  Sleep_Until(VerifyAnElementExistsAndPrintText(type, id))
end


def ClkSaveTimesheet(link)
  Sleep_Until(WaitForAnElementByCSSAndTouch(link))
end


def EnterReason(link,val)
  Sleep_Until(WaitForAnElementByCSSAndInputValue(link,val))
  $driver.find_element(:css,'textarea[data-bind="value: Reason"]').send_keys :tab
end


def TermSaveClose(link)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
end