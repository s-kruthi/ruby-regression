def DeletePayrollCycleAssociatedToUser()
  #get the payroll id thats associated to user
  @payroll = $daos.get_paycycle_associated_to_user()

  if @payroll.nil?
    puts COLOR_YELLOW + "no payroll cycles available for this criteria".upcase
    skip_this_scenario
  end

  WaitForAnElementByCSSAndTouch("button[href*='/admin/hrcore/payroll-cycle/delete/#{@payroll[:id]}']")
  sleep 1
  Sleep_Until(PressEnterConfirm())
end


def CheckDeletionPayrollCycle(ability)
  identifier = "button[href*='/admin/hrcore/payroll-cycle/delete/#{@payroll[:id]}']"

  if ability == " Not "
    Sleep_Until(VerifyAnElementExists('css', identifier))
    puts COLOR_GREEN + "was successful in not deleting payroll cycle named ".upcase + @payroll[:title].upcase.colorize(:yellow)
  else
    Sleep_Until(VerifyAnElementNotExist('css', identifier))
    puts COLOR_GREEN + "was able to successfully delete payroll cycle named ".upcase + @payroll[:title].upcase.colorize(:yellow)
  end
end


def DeletePayrollCycle()
  #get the payroll id thats unassociated to user
  @payroll = $daos.get_paycycle_unassociated_to_user()

  if @payroll.nil?
    puts COLOR_YELLOW + "no payroll cycles available for this criteria".upcase
    skip_this_scenario
  end

  WaitForAnElementByCSSAndTouch("button[href*='/admin/hrcore/payroll-cycle/delete/#{@payroll[:id]}']")
  sleep 1
  Sleep_Until(PressEnterConfirm())
  Sleep_Until(VerifyAnElementExistByXPath(PAYROLL_CYCLE_MODAL_ID, PAYROLL_CYCLE_DEL_SUCCESS_MSG))
  Sleep_Until(PressEnterOK())
end


def EnterPayrollCycleDetails(title = PAYROLL_CYCLE_TITLE + Time.now.strftime("%Y%m%d%H%M%S").to_s)

  if title.eql? PAYROLL_CYCLE_TITLE + Time.now.strftime("%Y%m%d%H%M%S").to_s
    @title = title
  else
    @title = title + Time.now.strftime("%Y%m%d%H%M%S").to_s
  end

  $driver.find_element(:id, PAYROLL_CYCLE_TITLE_ID).clear()
  WaitForAnElementByIdAndInputValue(PAYROLL_CYCLE_TITLE_ID, @title)

  $driver.find_element(:id, PAYROLL_CYCLE_STARTDATE_ID).clear()
  WaitForAnElementByIdAndInputValue(PAYROLL_CYCLE_STARTDATE_ID, (DateTime.now.strftime "%d/%m/%Y"))

  SelectFromDropDown(PAYROLL_CYCLE_TYPE_ID, 'Monthly')

  WaitForAnElementByIdAndTouch(PAYROLL_CYCLE_SAVE_ID)
end


def EditPayrollCycle()
  @payroll = $daos.get_payroll_cycle_details()

  WaitForAnElementByXpathAndTouch("//a[@href='/admin/hrcore/payroll-cycle/edit/#{@payroll[:id]}']")
end


def VerifyPayrollCycleCreation()
  #no success message is displayed for creation hence validating against DB
  title = $daos.get_payroll_cycle_by_title(@title)

  if title.nil?
    puts COLOR_RED + "unable to create payroll cycle successfully ".upcase
  else
    puts COLOR_GREEN + "Created payroll cycle successfully ".upcase
  end
end


def VerifyPayrollCycleEdit()
  #no success message is displayed for editing hence validating against DB
  title = $daos.get_payroll_cycle_by_id(@payroll[:id])

  if title == @title
    puts COLOR_GREEN + "Edited payroll cycle successfully ".upcase
  else
    puts COLOR_RED + "unable to edit payroll cycle successfully ".upcase
  end
end