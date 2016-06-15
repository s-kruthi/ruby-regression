def GoToTheLoginPage(login_page)
  $driver.navigate.to(login_page)
end

def EnterUsername(username,value)
  WaitForAnElementByIdAndInputValue(username, value)
end

def EnterPassword(password, value)
  WaitForAnElementByIdAndInputValue(password, value)
end

def LogInAndWaitForTheDashboard(tag_name,admin_menu)
  TouchLoginButton(tag_name)
  Wait(3)
  WaitForAnElementByClass(admin_menu)
  puts $driver.title
end

def TouchLoginButton(tag_name)
  WaitForAnElementByTagNameAndTouch(tag_name)
end

def GoToTheSuccessionMenuPageAsAdmin(admin_menu,succession_tab)
  TouchAdminMenu(admin_menu)
  GoToSuccessionLandingPage(succession_tab)
end


def TouchAdminMenu(admin_menu)
  WaitForAnElementByClassAndTouch(admin_menu)
end

def GoToSuccessionLandingPage(succession_tab)
  WaitForAnElementByLinkAndTouch(succession_tab)
end

def GoToTheSuccessionSetupPageAsAdmin(succession_review_setup_path)
  WaitForAnElementByXpathAndTouch(succession_review_setup_path)
end

def DeleteTheFirstSuccessionPlanFromTheTable(dropdown,index_value)
5.times do
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown,index_value)
  sleep(1)
  TouchDelete()
  sleep(1)
  PressEnter()
  sleep(2)
  PressEnter()
 end
end
