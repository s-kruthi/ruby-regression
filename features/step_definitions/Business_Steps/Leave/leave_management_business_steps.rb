Given(/^I Have Logged In As A Company Admin To Setup Leave Management$/i) do
  startWebDriver
  GoToThePage(ADMIN_LANDING_PAGE)
  EnterUsername(USER_NAME,LEAVE_COMPANY_ADMIN_USER)
  EnterPassword(PASS_WORD,LEAVE_COMPANY_ADMIN_PASS)
  Sleep_Until(LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN))
end

When(/^I Try To Create A New Leave Type$/i) do
  GoToLeaveTypeUnderLeaveManagement(LEAVE_MGMT_ID)
  CreateANewLeaveType(LEAVE_TYPE_PATH,ADD_NEW_LEAV_TYP)
  FillTheLeaveTypeAndSave(NEW_LEAV_RQST_TITL,LEAVE_RQST_TITLE_VAL,ENTITLEMENT_TYPE_CS)
end

Then(/^I Should Be Able To Successfully Create A New Leave Type$/i) do
  SearchTheCreatedLeaveTypeAndDeleteIt(LEAVE_TYPE_SEARCH_CS,LEAVE_RQST_TITLE_VAL)
end

When(/^I Try To Create A New Leave Policy$/i) do
  GoToLeavePolicyUnderLeaveManagement(LEAVE_MGMT_ID)
  CreateANewLeavePolicy(LEAVE_POLICY_PATH,ADD_NEW_LEAV_POL)
  FillTheLeavePolicyAndSave(NEW_POLICY_RQST_TTL,LEAVE_RQST_TITLE_VAL)
end

Then(/^I Should Be Able To Successfully Create A New Leave Policy$/i) do
  SearchTheCreatedLeavePolicyAndDeleteIt(LEAVE_POLICY_SEARCH_CS,LEAVE_RQST_TITLE_VAL)
end

When(/^I Try To Create A New Company Holiday$/i) do
  Sleep_Until(GoToHolidayMgntUnderLeaveManagement(LEAVE_MGMT_ID))
  Sleep_Until(CreateANewCompanyHoliday(HOLIDAY_MGMT_PATH,ADD_NEW_HOLIDAY))
  Sleep_Until(FillTheNewCompanyHolidayAndSave())
end

Then(/^I Should Be Able To Successfully Create A New Company Holiday$/i) do
  Sleep_Until(FindTheCreatedHolidayAndDeleteIt())
end

When(/^I Log In As A Company Admin To Process A Leave Request$/i) do
  startWebDriver
  GoToThePage(ADMIN_LANDING_PAGE)
  EnterUsername(USER_NAME,LEAVE_COMPANY_ADMIN_USER)
  EnterPassword(PASS_WORD,LEAVE_COMPANY_ADMIN_PASS)
  Sleep_Until(LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN))
  Sleep_Until(GoToLeaveRequestUnderLeaveManagement(LEAVE_MGMT_ID,LEAVE_REQUESTS_PATH))
end

And(/^I Approved The Submitted Request To Modify It Further$/i) do
  Sleep_Until(ApproveTheSubmittedLeaveRequest(LEAVE_APROVAL_COMMENT))
  sleep(2)
  ConnectToDatabaseAndValidateTheApprovedRequestSubmissionNotification()
end

Then(/^I Should Be Able To Successfully Process A Modified Leave Request$/i) do
  startWebDriver
  GoToThePage(ADMIN_LANDING_PAGE)
  EnterUsername(USER_NAME,LEAVE_COMPANY_ADMIN_USER)
  EnterPassword(PASS_WORD,LEAVE_COMPANY_ADMIN_PASS)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  GoToLeaveRequestUnderLeaveManagement(LEAVE_MGMT_ID,LEAVE_REQUESTS_PATH)
  ModifyLeaveHrAndProcessTheLeaveRequest()
end

And(/^I Should Not Be Able To Cancel The Request$/) do
  ConnectToDatabaseAndDeleteTheProcessedLeaveRequest()
end

Given(/^I Have Logged In As A Company Admin To Check Leave Balance Section$/i) do
  startWebDriver
  GoToThePage(ADMIN_LANDING_PAGE)
  EnterUsername(USER_NAME,LEAVE_COMPANY_ADMIN_USER)
  EnterPassword(PASS_WORD,LEAVE_COMPANY_ADMIN_PASS)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  GoToLeaveBalanceUnderLeaveManagement(LEAVE_MGMT_ID)
end

When(/^I Search For Leave Balance Of A Particular Employee$/i) do
  GoToLeaveBalanceAndSearchTheEmployee()
end

Then(/^I Should Be Able To Check The Correct Leave Balance$/i) do
  CheckTheLeaveBucketReturnsTheExpectedAccruals()
end