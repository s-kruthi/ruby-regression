def FillTextField(field,value)
  Wait_For(5)
  Sleep_Until(WaitForAnElementByCSSAndInputValue(field,value))
end

def SelectDrpDwn(linkpath,val)
  Sleep_Until(SelectFromDropDown(linkpath,val))
end

def ValidateField(tfndedclcss,tfndeclval)
  Sleep_Until(VerifyAnElementExistByCSS(tfndedclcss,tfndeclval))
end


def ValidateValue(link,text)
  Sleep_Until(VerifyAnElementExistByXPath(link,text))
end

def EnterDateField(type,dateclklink,index,datesellink)
  #Sleep_Until(WaitForAnElementByXpathAndTouch(dateclklink))
  ClickElementByIndex(type,dateclklink,index)
  Sleep_Until(WaitForAnElementByXpathAndTouch(datesellink))
end

def EnterTermDate(dateclklink,datesellink)
  Sleep_Until(WaitForAnElementByXpathAndTouch(dateclklink))
  Sleep_Until(WaitForAnElementByXpathAndTouch(datesellink))
end

def ValidateToggleText(tag,val)
  Sleep_Until(VerifyAnElementExistsPrintText(tag,val))
end
def ToggleValue(residentfortaxlink)
  Sleep_Until(WaitForAnElementByXpathAndTouch(residentfortaxlink))
end

def ClickContinue(continuecss)
  Sleep_Until(WaitForAnElementByCSSAndTouch(continuecss))
end
def VerifyMember(value)
  member_name = $driver.find_element(:css,"#{value}").text
  if member_name = $account_name
    puts "Success!! " + $driver.find_element(:xpath,"//div[@class='col-md-12 text-center']//h3").text
  end
end
def FieldExistence(tagname,value)
  Sleep_Until(VerifyAnElementExists(tagname,value))
end

def EnterStdHours(link,value)
  $driver.find_element(:css, "#{link}").clear
  (0..6).each do |i|
    $driver.find_element(:css, "#{link}").send_keys :backspace
  end
  Sleep_Until(WaitForAnElementByCSSAndInputValue(link,value))
end

def EnterROP(link,value)
  (0..4).each do |i|
    $driver.find_element(:css, "#{link}").send_keys :backspace
    #puts "Enter backspace: #{i}"
  end
  Sleep_Until(WaitForAnElementByCSSAndInputValue(link,value))
end

def EnterLeaveBal(link,value)
  $driver.find_element(:css, "#{link}").send_keys :backspace
  Sleep_Until(WaitForAnElementByCSSAndInputValue(link,value))
end

def ClickCreateAndClose(css,index)
  Sleep_Until(WaitForAnElementByCssAndTouchTheIndex(css,index))
  Wait_For(4)
end

def VerifyCreateButtons(css,text,ind)
  Sleep_Until(VerifyAnElementExistByCSSAndIndex(css,text,ind))
end

def EnterNewEmpName(link,value)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(link,value))
  Wait_For(5)
end

def EmpSearch(type,identifier,index)
  sleep 5
  Sleep_Until(ClickElementByIndex(type, identifier, index))
  puts "New Member is created successfully"
end

def FetchEmpNameID(type,val)
  Wait_For(5)
  Sleep_Until(VerifyAnElementExistsPrintText(type,val))
end

