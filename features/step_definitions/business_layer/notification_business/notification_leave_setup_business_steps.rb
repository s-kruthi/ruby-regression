
Given(/^I Am On The New Leave Request Page$/i) do
  startWebDriver
  GoToThePage(REQUEST_NEW_LEAVE_PAGE)
  EnterUsername(USER_NAME,LEAVE_USERNAME_EMPLOYEE)
  EnterPassword(PASS_WORD,LEAVE_PASSWORD_EMPLOYEE)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(1)
end

When(/^I Apply For A Leave As An Employee$/i) do
  ClickNewRequestButtonAndGoToLeaveApplyPage()
  SelectLeaveType()
  SelectStartDate("21/09/2017")
  SelectEndDate("22/09/2017")
  ModifyLeaveHours("1")
  AddComment(LEAVE_COMMENT)
  SubmitLeaveRequest()
end

Then(/^I Should Be Instantly Notified About My Leave Request$/i) do
  ConnectToDatabaseAndValidateTheLeaveRequestNotifications()
end

When(/^I Cancel The Leave That I have Requested For$/) do
  CancelTheLeaveRequestPendingForApproval(LEAVE_REQUEST_DROPDOWN,2,CANCELLATION_REASON)
end

Then(/^I Should Be Instantly Notified About My Leave Request cancellation$/i) do
  ConnectToDatabaseAndValidateTheLeaveRequestCancelledNotifications()
end

Given(/^An Employee Has Applied For A Leave Which Is Awaiting Approval$/i) do
  startWebDriver
  GoToThePage(REQUEST_NEW_LEAVE_PAGE)
  EnterUsername(USER_NAME,LEAVE_USERNAME_EMPLOYEE)
  EnterPassword(PASS_WORD,LEAVE_PASSWORD_EMPLOYEE)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(3)
  ClickNewRequestButtonAndGoToLeaveApplyPage()
  SelectLeaveType()
  SelectStartDate("21/09/2017")
  SelectEndDate("22/09/2017")
  ModifyLeaveHours("1")
  AddComment(LEAVE_COMMENT)
  SubmitLeaveRequest()
end

When(/^I Am On The Managers Leave Management Page$/i) do
  startWebDriver
  GoToThePage(REQUEST_NEW_LEAVE_PAGE)
  EnterUsername(USER_NAME,LEAVE_USER_MANAGER)
  EnterPassword(PASS_WORD,LEAVE_PASSWORD_MANAGER)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(3)
end

And(/^I Cancel The Leave That My Employee has Requested For$/i) do
  GoToApprovalRequestPage()
  CancelTheLeaveRequestPendingForApproval(LEAVE_REQUEST_DROPDOWN,2,CANCELLATION_REASON)
end

Then(/^My Employee Should Be Instantly Notified About The Leave Request cancellation$/i) do
  ConnectToDatabaseAndValidateTheLeaveRequestCancelledByApproverNotifications()
end


And(/^I Reject The Leave That My Employee has Requested For$/i) do
  GoToApprovalRequestPage()
  ViewTheLeaveRequestAndRejectIt(LEAVE_REQUEST_DROPDOWN,2,LEAVE_REJECT_COMMENT)
end

Then(/^My Employee Should Be Instantly Notified About The Leave Request Rejection$/i) do
  ConnectToDatabaseAndValidateTheLeaveRequestRejectedByApproverNotifications()
end

And(/^I Edited The Leave That My Employee has Requested For$/i) do
  GoToApprovalRequestPage()
  ViewTheLeaveRequestAndRejectIt(LEAVE_REQUEST_DROPDOWN,2,LEAVE_REJECT_COMMENT)
end

When(/^I Edit The Leave That Is Reopened Post Rejection By Approver$/i) do
  GoToEditLeavePageAndResubmitThePendingLeave(RESUBMIT_COMMENT)
end

Then(/^There Should Be An Instant Notification About Leave Resubmission$/i) do
  ConnectToDatabaseAndValidateTheLeaveRequestResubmissionNotifications()
end

And(/^I Reject And Close The Leave That My Employee has Requested For$/i) do
  GoToApprovalRequestPage()
  ViewTheLeaveRequestAndRejectAndCloseIt(LEAVE_REQUEST_DROPDOWN,2,LEAVE_REJECT_AND_CLOSE_COMMENT)
end

Then(/^There Should Be An Instant Notification About Leave Rejection$/i) do
  ConnectToDatabaseAndValidateTheLeaveRequestFinalRejectionNotifications()
end

And(/^I Put The Leave Request On Hold That My Employee has Requested For$/i) do
  GoToApprovalRequestPage()
  ViewTheLeaveRequestAndPutItOnHold(LEAVE_REQUEST_DROPDOWN,2,LEAVE_REJECT_COMMENT)
end
