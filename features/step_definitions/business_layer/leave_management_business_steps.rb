
Given(/^I Have Logged In as a Company Admin To Setup Leave Management$/) do
  startWebDriver
  GoToThePage(ADMIN_LANDING_PAGE)
  EnterUsername(USER_NAME,LEAVE_COMPANY_ADMIN_USER)
  EnterPassword(PASS_WORD,LEAVE_COMPANY_ADMIN_PASS)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

When(/^I Try To Create A New Leave Type$/) do
  GoToLeaveTypeUnderLeaveManagement(LEAVE_MGMT_ID)
  CreateANewLeaveType()
end

Then(/^I Should Be Able To Successfully Create A New Leave Type$/) do
  pending
end