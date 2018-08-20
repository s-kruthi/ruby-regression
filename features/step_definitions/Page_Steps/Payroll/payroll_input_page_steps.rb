def ClickAddTermination(link)
  sleep 10
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
end


def SelectTerminationEmployee(type, link)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
  $driver.find_element(:xpath, "#{link}").send_keys :down
  PressEnterKey(type,link)
  $terminate_emp = $driver.find_element(:xpath, "#{link}").text
  puts 'The Terminated member is: ' + $terminate_emp
end


def ClickAddTimesheet(link)
  sleep 5
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
end


def EnterTimeDetails(link,val)
  WaitForAnElementByXpathAndClearValue(link)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(link,val))
  #PressEnterKey(XPATH_LOC_TYPE,link)----add this if enter key is required
end


def CheckRateOfPay(type,id)
  Sleep_Until(VerifyAnElementExists(type, id))
  puts "Rate of Pay is present"
end


def CheckCostCentre(type,id)
  Sleep_Until(VerifyAnElementExists(type, id))
  puts "Allocate to cost centre is present"
end


def CheckLoadingFactor(type, id)
  Sleep_Until(VerifyAnElementExists(type, id))
  puts "Loading Factor is present"
end


def InputCheckFields(type,id,text)
  puts "The default value of " + text + " is: "
  Sleep_Until(VerifyAnElementExists(type, id))
end


def ClickSaveTimesheet(link)
  Sleep_Until(WaitForAnElementByCSSAndTouch(link))
end


def EnterReason(link,val)
  Sleep_Until(WaitForAnElementByCSSAndInputValue(link,val))
  $driver.find_element(:css,'textarea[data-bind="value: Reason"]').send_keys :tab
end


def TerminationSaveClose(link)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link))
end