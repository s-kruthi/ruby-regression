
Given(/^I Am On The New Leave Request Page$/) do
  startWebDriver
  GoToThePage(REQUEST_NEW_LEAVE_PAGE)
  EnterUsername(USER_NAME,LEAVE_USERNAME_EMPLOYEE)
  EnterPassword(PASS_WORD,LEAVE_PASSWORD_EMPLOYEE)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(3)
end

When(/^I Apply For A Leave As An Employee$/) do
  ClickNewRequestButtonAndGoToLeaveApplyPage()
  SelectLeaveType(LEAVE_TYPE_DROPDOWN,LEAVE_TYPE_DROPDOWN_OPTION,0)
  SelectStartDate("21/09/2017")
  SelectEndDate("22/09/2017")
  ModifyLeaveHours("1")
  AddComment(LEAVE_COMMENT)
  SubmitLeaveRequest()
end

Then(/^I Should Be Instantly Notified About My Leave Request$/) do
  ConnectToDatabaseAndValidateTheLeaveRequestNotifications()
end


When(/^I Cancel The Leave That I have Requested For$/) do
  CancelTheLeaveRequestPendingForApproval(LEAVE_REQUEST_DROPDOWN,3,CANCELLATION_REASON)
end

Then(/^I Should Be Instantly Notified About My Leave Request cancellation$/) do
  ConnectToDatabaseAndValidateTheLeaveRequestCancelledNotifications()
end

Given(/^An Employee Has Applied For A Leave Which Is Awaiting Approval$/) do
  startWebDriver
  GoToThePage(REQUEST_NEW_LEAVE_PAGE)
  EnterUsername(USER_NAME,LEAVE_USERNAME_EMPLOYEE)
  EnterPassword(PASS_WORD,LEAVE_PASSWORD_EMPLOYEE)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(3)
  ClickNewRequestButtonAndGoToLeaveApplyPage()
  SelectLeaveType(LEAVE_TYPE_DROPDOWN,LEAVE_TYPE_DROPDOWN_OPTION,0)
  SelectStartDate("21/09/2017")
  SelectEndDate("22/09/2017")
  ModifyLeaveHours("1")
  AddComment(LEAVE_COMMENT)
  SubmitLeaveRequest()
end

When(/^I Am On The Managers Leave Management Page$/) do
  startWebDriver
  GoToThePage(REQUEST_NEW_LEAVE_PAGE)
  EnterUsername(USER_NAME,LEAVE_USER_MANAGER)
  EnterPassword(PASS_WORD,LEAVE_PASSWORD_MANAGER)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(3)
end

And(/^I Cancel The Leave That My Employee has Requested For$/) do
  GoToApprovalRequestPage()
  CancelTheLeaveRequestPendingForApproval(LEAVE_REQUEST_DROPDOWN,3,CANCELLATION_REASON)
end

Then(/^My Employee Should Be Instantly Notified About The Leave Request cancellation$/) do
  ConnectToDatabaseAndValidateTheLeaveRequestCancelledByApproverNotifications()
end


And(/^I Reject The Leave That My Employee has Requested For$/) do
  GoToApprovalRequestPage()
  ViewTheLeaveRequestAndRejectIt(LEAVE_REQUEST_DROPDOWN,3,LEAVE_REJECT_COMMENT)
end

Then(/^My Employee Should Be Instantly Notified About The Leave Request Rejection$/) do
  ConnectToDatabaseAndValidateTheLeaveRequestRejectedByApproverNotifications()
end

When(/^I Edit The Leave That Is Reopened Post Rejection By Approver$/) do
  GoToEditLeavePageAndResubmitThePendingLeave(RESUBMIT_COMMENT)
end

Then(/^There Should Be An Instant Notification About Leave Resubmission$/) do
  ConnectToDatabaseAndValidateTheLeaveRequestResubmissionNotifications()
end

And(/^I Reject And Close The Leave That My Employee has Requested For$/) do
  GoToApprovalRequestPage()
  ViewTheLeaveRequestAndRejectAndCloseIt(LEAVE_REQUEST_DROPDOWN,3,LEAVE_REJECT_AND_CLOSE_COMMENT)
end

Then(/^There Should Be An Instant Notification About Leave Rejection$/) do
  ConnectToDatabaseAndValidateTheLeaveRequestFinalRejectionNotifications()
end