# TODO: Remove commented out code after review
# def GoToThePage(login_page)
#   $driver.navigate.to(login_page)
#   # %x(jmeter -n -t /Users/shankumahanty/Desktop/JMETER_AUTO/Jmeter_tests/GeneralUserSurpriseMe.jmx -Jserver="staging5.dev.elmodev.com" -Jidentifier_manager="14739" -Jrole="3")
#   # email_user = File.new('/Users/shankumahanty/.jenkins/workspace/User-Creation-SurpriseMe/GeneralUserSurpriseMe.xml', 'rb').read.scan(/testfancy([^\/.]*)/).last[0]
#   # new_email_user = email_user.chomp("@mail")
#   # $newme = "testfancy#{new_email_user}"
# end
#
#
# def EnterUsername(username,value)
#   WaitForAnElementByIdAndInputValue(username, value)
# end
#
#
# def EnterPassword(password, value)
#   WaitForAnElementByIdAndInputValue(password, value)
# end
#
#
# def EnterEmail(email, value)
#   WaitForAnElementByIdAndInputValue(email, value)
# end
#
#
# def LogInAndWaitForTheDashboard(tag_name,admin_menu)
#   TouchLoginButton(tag_name)
#   puts COLOR_BLUE + "Title: " + $driver.title
#   puts COLOR_BLUE + "URL: " + $driver.current_url
#   sleep(3)
# end
#
#
# def LogOutFromTheDashboard(user_profile_icon, logout_button)
#   Sleep_Until(WaitForAnElementByIdAndTouch(user_profile_icon))
#   Sleep_Until(WaitForAnElementByXpathAndTouch(logout_button))
#   sleep(1)
#   $driver.quit
# end
#
#
# def TouchLoginButton(tag_name)
#   WaitForAnElementByTagNameAndTouch(tag_name)
# end
#
#
def GoToTheSuccessionMenuPageAsAdmin(admin_cog,succession_expand)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  GoToSuccessionLandingPage(succession_expand)
end


def GoToSuccessionLandingPage(succession_expand)
  sleep(4)
  WaitForAnElementByPartialLinkTextAndTouch(succession_expand)
end


def GoToTheSuccessionSetupPageAsAdmin(succession_review_setup_path)
  WaitForAnElementByXpathAndTouch(succession_review_setup_path)
end


def CreateANewSuccessionPlan(new_plan_btn,title_id,title_value,save_btn,succession_review_link)
  sleep(3)
  WaitForAnElementByXpathAndTouch(new_plan_btn)
  Wait_For(2)
  WaitForAnElementByIdAndInputValue(title_id, title_value)
  WaitForAnElementByXpathAndTouch(save_btn)
  Wait_For(3)
  WaitForAnElementByLinkAndTouch(succession_review_link)
end


def SearchTheNewlyCreatedSuccessionPlan(search_path,search_value)
  WaitForAnElementByXpathAndInputValue(search_path,search_value)
end


def DeleteTheFirstSuccessionPlanFromTheTable(dropdown,index_value)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown,index_value)
  sleep(1)
  TouchDelete()
  sleep(1)
  PressEnterConfirm()
  sleep(2)
  PressEnterOK()
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
  Wait_For(2)
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
  Wait_For(3)
  WaitForAnElementByClassAndTouch(search_btn)
  VerifyAnElementExistByClass(search_result,search_value)
end


def VerifyTheMessageCannotBeDeletedExist(message_class,message_body )
  sleep(1)
  VerifyAnElementExistByClass(message_class, message_body)
  PressEnterOK()
end