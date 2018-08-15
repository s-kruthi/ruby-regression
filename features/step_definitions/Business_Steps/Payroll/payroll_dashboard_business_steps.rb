And(/^I choose the pay cycle as "([^"]*)"$/) do |pay_cycle_type|
  begin
    case pay_cycle_type
    when "Monthly Pay"
      begin
        SelectPayCycle(pay_cycle_type)
      end
    when "Weekly Pay"
      begin
        SelectWeeklyPayCycle(pay_cycle_type)
      end
    end
  end
end

Then(/^I perform required actions in the Data Input step$/) do

  ClickTab(ADD_NEW_MEMBER_XPATH)
  steps %Q{
    And I fill all the details in TFN Declaration page and continue
    And I fill all the details in Profile page and continue
    And I fill all the details in Pay Details page and continue
    And I fill all the details in Leave Details and continue
    Then I confirm to add new member
      }
  Wait_For(5)

  ClickTab(TERM_MEMBER_XPATH)
  steps %Q{
    When  I navigate To the Input Menu and select "Termination entries"
    Then  I click on Add Termination and fill and Verify all the details in Terminate employee screen
    And   I Navigate To The Dashboard Menu and select "Main Dashboard"
    And   I choose the pay cycle as "Monthly Pay"
      }

  ClickTab(ENTER_TIMESHEETS_XPATH)
  steps %Q{
    And   I click on ADD TIMESHEET and enter the timesheet details
    Then  I click on save to update the timesheet entries
    And   I Navigate To The Dashboard Menu and select "Main Dashboard"
    And   I choose the pay cycle as "Monthly Pay"
      }

end

And(/^I click Next in the Check Reports step$/) do
  ClickNext(NEXT_XPATH)
end

Then(/^I change the Pay Cycle Status to Closed$/) do
  ChangePayCycleStatus(STATUS_XPATH)
end

And(/^I click Next in the Make Payment step$/) do
  ClickNext(NEXT_XPATH)
end

And(/^I Generate and verify "([^"]*)" is displayed in the Send Payslips step$/) do |verfiy_text|
  GeneratePayslips(GENERATE_PAYSLIPS_XPATH, CLK_GENERATE_PAYSLIPS_XPATH)
  VerifyViewPayslips(VIEW_ALL_PAYSLIPS_XPATH,verfiy_text)

end

Then(/^I click on Distribute payslips ad send the payslips and validate$/) do
  DistributePayslips(DISTR_PAYSLIPS_XPATH,SEND_ENABLED_XPATH,CONFIRM_SEND_PAYSLIPS_XPATH)
  #ValidatePayslipsSent(CLICK_SEND_DISABLED)

end

And(/^I click Next in the Send Payslips step$/) do
  ClickNext(NEXT_XPATH)
end

And(/^I Commit the paycycle$/) do
  CommitPaycycle(COMMIT_PAY_CYCLE_XPATH,COMMIT_CONFIRM_XPATH)
  ConfirmLoginDetails(CONFIRM_LOGIN_DETAILS_XPATH,CONFIRM_PASSWORD_XPATH,PAYROLL_ADMIN_USER,PAYROLL_ADMIN_PWD,CONFIRM_XPATH)
end

