And(/^I Choose The Pay Cycle As ([^"]*)$/) do |pay_cycle_type|
  begin
    case pay_cycle_type
    when "Monthly Pay"
      begin
        Sleep_Until(SelectPayCycle(pay_cycle_type))
      end

    when "Weekly Pay"
      begin
        Sleep_Until(SelectWeeklyPayCycle(pay_cycle_type))
      end

    end
  end
end


Then(/^I Perform Required Actions In The Data Input Step$/) do

  Sleep_Until(ClickTab(ADD_NEW_MEMBER_XPATH))
  steps %Q{
    And I Fill All The Details In TFN Declaration Page And Continue
    And I Fill All The Details In Profile Page And Continue
    And I Fill All The Details In Pay Details Page And Continue
    And I Fill All The Details In Leave Details And Continue
    Then I Confirm To Add New Member
      }
  Wait_For(5)

  ClickTab(TERM_MEMBER_XPATH)
  steps %Q{
    When  I Navigate To The Input Menu And Select "Termination Entries"
    Then  I Click On Add Termination And Fill And Verify All The Details In Terminate Employee Screen
    And   I Navigate To The Dashboard Menu And Select "Main Dashboard"
    And   I Choose The Pay Cycle As "Monthly Pay"
      }

  ClickTab(ENTER_TIMESHEETS_XPATH)
  steps %Q{
    And   I Click On ADD TIMESHEET And Enter The Timesheet Details
    Then  I Click On Save To Update The Timesheet Entries
    And   I Navigate To The Dashboard Menu And Select "Main Dashboard"
    And   I Choose The Pay Cycle As "Monthly Pay"
      }

end


And(/^I Click Next In The Check Reports Step$/) do
  Sleep_Until(ClickNext(NEXT_XPATH))
end


Then(/^I Change The Pay Cycle Status To Closed$/) do
  Sleep_Until(ChangePayCycleStatus(STATUS_XPATH))
end


And(/^I Click Next In The Make Payment Step$/) do
  ClickNext(NEXT_XPATH)
end


And(/^I Generate And Verify "([^"]*)" Is Displayed In The Send Payslips Step$/) do |verfiy_text|
  GeneratePayslips(GENERATE_PAYSLIPS_XPATH, CLK_GENERATE_PAYSLIPS_XPATH)
  VerifyViewPayslips(VIEW_ALL_PAYSLIPS_XPATH,verfiy_text)

end


Then(/^I Click On Distribute Payslips Ad Send The Payslips And Validate$/) do
  DistributePayslips(DISTR_PAYSLIPS_XPATH,SEND_ENABLED_XPATH,CONFIRM_SEND_PAYSLIPS_XPATH)
  #ValidatePayslipsSent(CLICK_SEND_DISABLED)

end


And(/^I Click Next In The Send Payslips Step$/) do
  ClickNext(NEXT_XPATH)
end


And(/^I Commit The Paycycle$/) do
  CommitPaycycle(COMMIT_PAY_CYCLE_XPATH,COMMIT_CONFIRM_XPATH)
  ConfirmLoginDetails(CONFIRM_USERNAME_XPATH,CONFIRM_PASSWORD_XPATH,PAYROLL_ADMIN_USER,PAYROLL_ADMIN_PWD,CONFIRM_XPATH)
end