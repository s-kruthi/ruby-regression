def SelectPayCycle(paycycle_value)
  Wait_For(2)
  Sleep_Until($driver.find_element(:css, PAY_CYCLE_CLEAR_CSS).clear)
  Wait_For(2)
  Sleep_Until($driver.find_element(:css,PAY_CYCLE_CLEAR_CSS).send_keys "#{paycycle_value}")
  Wait_For(2)
  Sleep_Until($driver.find_element(:css,PAY_CYCLE_CLEAR_CSS).send_keys :enter)
  Wait_For(2)
  $payment_date = $driver.find_element(:class,PAYMENT_DATE_CLASS).text
end


def SelectWeeklyPayCycle(paycycle_value)
  Wait_For(2)
  Sleep_Until($driver.find_element(:css,PAY_CYCLE_CLEAR_CSS).clear)
  Wait_For(2)
  Sleep_Until($driver.find_element(:css,PAY_CYCLE_CLEAR_CSS).send_keys "#{paycycle_value}")
  Wait_For(2)
  Sleep_Until($driver.find_element(:css,PAY_CYCLE_CLEAR_CSS).send_keys :enter)
  Wait_For(2)
  Sleep_Until($driver.find_element(:css,PAY_CYCLE_CLEAR_CSS).send_keys :enter)
  Wait_For(2)
  $payment_date = $driver.find_element(:class,PAYMENT_DATE_CLASS).text
end


def ClickNext(next_button)
  Wait_For(3)
  Sleep_Until(WaitForAnElementByXpathAndTouch(next_button))
end


def ChangePayCycleStatus(status_button)
  Sleep_Until(WaitForAnElementByXpathAndTouch(status_button))
end


def GeneratePayslips(generate_payslips,click_gen)
  Wait_For(3)
  Sleep_Until(WaitForAnElementByXpathAndTouch(generate_payslips))
  Sleep_Until(WaitForAnElementByXpathAndTouch(click_gen))
end


def DistributePayslips(distribute_payslips,send_click,confirm_send)
  Sleep_Until(WaitForAnElementByXpathAndTouch(distribute_payslips))
  Wait_For(3)
  Sleep_Until(WaitForAnElementByXpathAndTouch(send_click))
  Wait_For(2)
  Sleep_Until(WaitForAnElementByXpathAndTouch(confirm_send))
end


def VerifyViewPayslips(view_all_payslips,text)
  Wait_For(10)
  Sleep_Until(VerifyAnElementExistByXPath(view_all_payslips,text))
  puts "View All Payslips is displayed"
end


def ValidatePayslipsSent(send_click)
  Wait_For(5)
  Sleep_Until(VerifyAnElementExistByXPath(send_click,"Send"))
  puts "All the payslips are sent"
end


def CommitPaycycle(click_commit,commit_confirm)
  Sleep_Until(WaitForAnElementByXpathAndTouch(click_commit))
  Sleep_Until(WaitForAnElementByXpathAndTouch(commit_confirm))
end


def ConfirmLoginDetails(click_login,click_pswd,username,password,confirm_btn)

  Sleep_Until(WaitForAnElementByXpathAndInputValue(click_login,username))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(click_pswd,password))
  Wait_For(3)
  #Sleep_Until(WaitForAnElementByXpathAndTouch(confirm_btn))
  $driver.find_element(:xpath,confirm_btn).click
end