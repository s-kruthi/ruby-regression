def ProvideUsername(username,value)
  Sleep_Until(WaitForAnElementByIdAndInputValue(username, value))
end

def ProvidePassword(password, value)
  Sleep_Until(WaitForAnElementByIdAndInputValue(password, value))
end

def LoginToPayroll(class_name)
  Sleep_Until(WaitForAnElementByXpathAndTouch(class_name))
  Wait_For(3)
  puts $driver.title
end

def NavigateMenu(link_to_nav)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link_to_nav))
end

def GoToAMenu(tab_name)
  Sleep_Until(WaitForAnElementByXpathAndTouch(tab_name))
  Wait_For(3)
end



