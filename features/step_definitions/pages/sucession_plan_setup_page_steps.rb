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
  sleep(1)
end

def TouchLoginButton(tag_name)
  WaitForAnElementByTagNameAndTouch(tag_name)
end

def GoToTheSuccessionMenuPageAsAdmin(admin_cog,succession_expand)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  GoToSuccessionLandingPage(succession_expand)
end


def TouchAdminMenu(admin_menu)
  WaitForAnElementByClassAndTouch(admin_menu)
end

def GoToSuccessionLandingPage(succession_expand)
  WaitForAnElementByPartialLinkTextAndTouch(succession_expand)
end

def GoToTheSuccessionSetupPageAsAdmin(succession_review_setup_path)
  WaitForAnElementByXpathAndTouch(succession_review_setup_path)
end

def CreateANewSuccessionPlan(new_plan_btn,title_id,title_value,save_btn,succession_review_link)
  WaitForAnElementByXpathAndTouch(new_plan_btn)
  Wait(2)
  WaitForAnElementByIdAndInputValue(title_id, title_value)
  WaitForAnElementByXpathAndTouch(save_btn)
  Wait(3)
  WaitForAnElementByLinkAndTouch(succession_review_link)
end

def DeleteTheFirstSuccessionPlanFromTheTable(dropdown,index_value)
 #50.times do
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown,index_value)
  sleep(1)
  TouchDelete()
  sleep(1)
  PressEnterConfirm()
  sleep(2)
  PressEnterOK()
 # end
end
def DeleteTheFirstAssignedSuccessionPlanFromTheTable(dropdown,index_value)
  sleep(2)
  WaitForDropdownByClassAndTouchTheIndex(dropdown,index_value)
  sleep(1)
  TouchDelete()
  sleep(1)
  PressEnterConfirm()
end

def HideTheFirstSuccessionPlanFromTheTable(dropdown,index_value,hide_path)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown,index_value)
  sleep(1)
  WaitForAnElementByXpathAndTouch(hide_path)
  sleep(1)
  PressEnterConfirm()
  sleep(2)
end

def GoToTheShowHiddenScreenAndMakeThePlanVisible(show_hidden_btn,visible_btn,show_visible_btn)
  WaitForAnElementByXpathAndTouch(show_hidden_btn)
  Wait(2)
  WaitForAnElementByXpathAndTouch(visible_btn)
  sleep(2)
  PressEnterConfirm()
  sleep(1)
  WaitForAnElementByXpathAndTouch(show_visible_btn)
  sleep(1)
end

def SearchAndVerifyTheSuccessionReturnsSuccessfully(search_field,search_value,search_btn,search_result)
  sleep(1)
  WaitForAnElementByXpathAndInputValue(search_field,search_value)
  Wait(3)
  WaitForAnElementByClassAndTouch(search_btn)
  VerifyAnElementExistByClass(search_result,search_value)
end

def VerifyTheMessageCannotBeDeletedExist(message_class,message_body )
  sleep(1)
  VerifyAnElementExistByClass(message_class, message_body)
  PressEnterOK()
end