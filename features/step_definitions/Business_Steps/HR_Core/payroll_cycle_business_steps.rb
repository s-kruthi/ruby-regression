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
end