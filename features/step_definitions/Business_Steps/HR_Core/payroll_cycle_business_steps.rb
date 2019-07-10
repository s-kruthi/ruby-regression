When(/^I Click On Delete For The Payroll Cycle Associated To User$/i) do
  DeletePayrollCycleAssociatedToUser()
end

Then(/^I Should Be Displayed With A Warning Message$/i) do
  Sleep_Until(VerifyAnElementExistByXPath(PAYROLL_CYCLE_MODAL_ID, PAYROLL_CYCLE_DEL_WARN_MSG))
  Sleep_Until(PressEnterOK())
end

And(/^I Should(\s+?|\sNot\s)Be Able To Delete The Payroll Cycle$/i) do |ability|
  CheckDeletionPayrollCycle(ability)
end

When(/^I Click On Delete For The Unassociated Payroll Cycle$/i) do
  DeletePayrollCycle()
end

When(/^I Click On (Add|Edit) Payroll Cycle Button$/i) do |action|
  if  action == "Add"
    WaitForAnElementByXpathAndTouch(PAYROLL_CYCLE_ADD_ID)
  elsif action == "Edit"
    EditPayrollCycle()
  end
end

And(/^I Enter The Payroll Cycle Details$/i) do
  EnterPayrollCycleDetails()
  SavePayrollCycle()
end

Then(/^I Should Be Able To (Create|Edit) The Payroll Cycle Successfully$/i) do |action|
  if action == "Create"
    VerifyPayrollCycleCreation()
  elsif action == "Edit"
    VerifyPayrollCycleEdit()
  end
end

Then(/^I Edit The Payroll Cycle Details$/i) do
  EnterPayrollCycleDetails(PAYROLL_TITLE_EDIT)
  SavePayrollCycle()
end

Then(/^I Should See That The Weeks Per Annum Field Is Set With The Default Value$/i) do
  CheckDefaultValue()
end

And(/^I Enter The Weeks Per Annum As "([^\"]*)"$/i) do | weeks_per_annum |
  EnterPayrollCycleDetails()
  ClearAndEnterWeeksperannum(weeks_per_annum)
end

Then(/^I Should See The Error Message When The Weeks Per Annum Is Invalid$/i) do
  SavePayrollCycle()
  VerifyErrorAlertMessage(VERIFY_ALERT_ID, WEEKSERANNUM_ALERT_VALUE)
end

Then(/^I Should See That The Weeks Per Annum Field Information Message Is Displayed$/i) do
  VerifyInfoMessage(VERIFY_INFO_ID, WEEKSERANNUM_INFO_VALUE)
end

Then(/^I Should See That The "(.*)" Type Is Available$/i) do |payrollcycle_type|
  CheckPayrollCycleType(payrollcycle_type)
end

And(/^The Date of Month Field Is Set To 1st As Default$/i) do
  CheckField()
end

And(/^I Select Type As (.*)$/i) do |payrollcycle_type|
  SelectFromDropdown(PAYROLL_CYCLE_TYPE_ID, payrollcycle_type)
end
