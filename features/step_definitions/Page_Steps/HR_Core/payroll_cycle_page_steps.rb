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

  ClearField('id',PAYROLL_CYCLE_TITLE_ID)
  WaitForAnElementByIdAndInputValue(PAYROLL_CYCLE_TITLE_ID, @title)

  ClearField('id',PAYROLL_CYCLE_STARTDATE_ID)
  WaitForAnElementByIdAndInputValue(PAYROLL_CYCLE_STARTDATE_ID, (DateTime.now.strftime "%d/%m/%Y"))

  SelectFromDropdown(PAYROLL_CYCLE_TYPE_ID, PAYROLL_CYCLE_TYPE)

  ClearAndEnterWeeksperannum(PAYROLL_CYCLE_WEEKSPERANNUM)
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


def CheckDefaultValue()
  expect($driver.find_element(:id, 'payroll_cycle_weeksPerAnnum').attribute('value')).to eq('52.00')
  puts COLOR_GREEN + "weeks per annum field is set with the default value of 52.00 ".upcase
end


def SavePayrollCycle()
  WaitForAnElementByIdAndTouch(PAYROLL_CYCLE_SAVE_ID)
end


def ClearAndEnterWeeksperannum(weeks_per_annum)
  ClearField('id', PAYROLL_CYCLE_WEEKSPERANNUM_ID)
  WaitForAnElementByIdAndInputValue(PAYROLL_CYCLE_WEEKSPERANNUM_ID, weeks_per_annum)
end


def VerifyInfoMessage(verify_info_id, info_value)
  Sleep_Until(VerifyAnElementExistByXPath(verify_info_id, info_value))
end


def CheckPayrollCycleType(payrollcycle_type)
  dropdown = $driver.find_element(:id, 'payroll_cycle_type')
  flag = 0
  select_options = Selenium::WebDriver::Support::Select.new(dropdown)
  select_options.options.each do |item|
     #compares all the options of the dropdown
     if item.text == payrollcycle_type
       flag = 1
       break
     end
  end

  if flag == 1
    puts COLOR_GREEN + payrollcycle_type + " type present".upcase
  else
    puts COLOR_RED + payrollcycle_type + "type not present. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n".upcase
    fail
  end
end


def CheckField()
  #gets the selected value from the dropdown
  option_selected = GetSelectedValueFromDropdown(PAYROLL_CYCLE_DATEOFMON_ID)

  expect(option_selected).to eq("1st")
  puts COLOR_GREEN + "date of month field is present and is set to the default value of 1st".upcase
end

