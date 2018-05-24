Then(/^The User Should Be Instantly Notified About The New Enrolment$/) do
  ConnectToDatabaseAndValidateTheCourseEnrolmentNotification()
end

Then(/^The Approver Should Be Instantly Notified About The New Enrolment Request$/) do
  ConnectToDatabaseAndValidateTheCourseEnrolmentRequestNotification()
end

And(/^I Approve The Course Enrolment Request$/) do
  GoToCourseCatalogueSection(COURSE_REQUESTS_LTEXT)
  WaitForAnElementByCSSAndTouch(APPROVE_CRS_RQST_CSS)
  sleep(1)
  WaitForAnElementByClassAndInputValue(COURSE_APPROVAL_REASON_FLD,COURSE_APPROVAL_REASON)
  PressConfirm()
end

Then(/^The User Should Be Instantly Notified About The New Enrolment Request$/) do
  ConnectToDatabaseAndValidateTheCourseEnrolmentRequestApprovedNotification()
end