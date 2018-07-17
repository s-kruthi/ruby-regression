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


def CheckDeletionPayrollCycle()
  identifier = "button[href*='/admin/hrcore/payroll-cycle/delete/#{@payroll[:id]}']"

  if ability == " Not "
    Sleep_Until(VerifyAnElementExists('css', identifier))
    puts COLOR_GREEN + "was not able to delete payroll cycle named ".upcase + @payroll[:title].upcase.colorize(:yellow)
  else
    Sleep_Until(VerifyAnElementNotExist('css', identifier))
    puts COLOR_GREEN + "was not able to delete payroll cycle named ".upcase + @payroll[:title].upcase.colorize(:yellow)
  end
end


def DeletePayrollCycle()
  #get the payroll id thats unassociated to user
  @payroll = $daos.get_paycycle_unassociated_to_user()

  if @id.nil?
    puts COLOR_YELLOW + "no payroll cycles available for this criteria".upcase
    skip_this_scenario
  end

  WaitForAnElementByCSSAndTouch("button[href*='/admin/hrcore/payroll-cycle/delete/#{@payroll[:id]}']")
  sleep 1
  Sleep_Until(PressEnterConfirm())
  Sleep_Until(VerifyAnElementExistByXPath(PAYROLL_CYCLE_MODAL_ID, PAYROLL_CYCLE_DEL_SUCCESS_MSG))
  Sleep_Until(PressEnterOK())
end


def EnterPayrollCycleDetails()
  @payroll_cycle_count= $daos.get_count_payroll_cycle()

  WaitForAnElementByIdAndInputValue(PAYROLL_CYCLE_TITLE_ID, "Test Automation Cycle")
  WaitForAnElementByIdAndInputValue(PAYROLL_CYCLE_STARTDATE_ID, (DateTime.now.strftime "%d/%m/%Y"))
  SelectFromDropDown(PAYROLL_CYCLE_TYPE_ID, 'Monthly')
  WaitForAnElementByIdAndTouch(PAYROLL_CYCLE_SAVE_ID)
  puts COLOR_BLUE + "Created Epoch Time " +  Time.now.to_i.to_s
end


def EditPayrollCycleDetails()
  @payroll = $daos.get_payroll_cycle_details()

  WaitForAnElementByXpathAndTouch("//a[@href='/admin/hrcore/payroll-cycle/edit/#{@payroll[:id]}']")
end

def VerifyPayrollCycleCreation()
  count = $daos.get_count_payroll_cycle()
    if count == (@payroll_cycle_count + 1)
      puts COLOR_GREEN + "Created payroll cycle successfully ".upcase
    else
      puts COLOR_RED + "unable to create payroll cycle successfully ".upcase
    end
end