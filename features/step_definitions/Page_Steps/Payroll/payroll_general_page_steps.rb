def ProvideUsername(username,value)
  Sleep_Until(WaitForAnElementByIdAndInputValue(username, value))
end


def ProvidePassword(password, value)
  Sleep_Until(WaitForAnElementByIdAndInputValue(password, value))
end


def LoginToPayroll(link)
  Sleep_Until(WaitForAnElementByIdAndTouch(link))
  puts $driver.title
end


def NavigateDashboard(link_to_nav)
  Sleep_Until(WaitForAnElementByCSSAndTouch(link_to_nav))
end


def NavigateMenu(link_to_nav)
  Sleep_Until(WaitForAnElementByXpathAndTouch(link_to_nav))
end


def GoToAMenu(tab_name)
  Sleep_Until(WaitForAnElementByXpathAndTouch(tab_name))
  Wait_For(3)
end