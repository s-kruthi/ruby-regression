Given(/^I Am On The Document Template List View Page$/i) do
  startWebDriver
  GoToThePage(ADMIN_DOC_TEMPLATE_PAGE)
  EnterUsername(USER_NAME,EMO_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,EMO_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

When(/^I Successfully Assign A Template To A Candidate$/i) do
  SearchTheTemplateToBeAssigned(SEARCH_FIELD_ID, SEARCH_TEMPLATE)
  sleep(2)
  AssignTheTemplate(ACTION_BUTTON_CLASS, 3 ,ASSIGN_BUTTON_PATH)
  AssignTemplateToAUser(USER_SEARCH_FIELD_ID, SEARCH_USER, CHECKBOX_ID, ASSIGN_TO_SCLTD_USR_BTN)
  GrabThePathIDForAssignedUser(EXISTING_ASSIGNMENT_PATH,VIEW_BUTTON_PATH, 0)
end

Then(/^I It Should Instantly Trigger An Email Notification$/i) do
  ConnectToDatabaseAndValidateTheDocumentAssignedNotifications()
end

Given(/^I Have Assigned Many Documents To A User$/i) do
  startWebDriver
  GoToThePage(EXISTING_ASSIGNMENT_PAGE)
  EnterUsername(USER_NAME,EMO_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,EMO_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

Then(/^I Need To Delete The Assigned Documents As A TearDown Approach$/i) do
  DeleteTheExistingAssignedDocumentsForUser(DROPDOWN, 4)
end
Given(/^I Am On The My Document Page Of An User$/i) do
  startWebDriver
  GoToThePage(MY_DOCUMENT_PAGE)
  EnterUsername(USER_NAME,DOC_USERNAME)
  EnterPassword(PASS_WORD,DOC_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

When(/^I Successfully Submit My Document Template$/i) do
  GoToTheParticularAssignedDocument()
  FillAndSubmitTheAssignedTemplate(STREET_NUM_ID,STREET_NUM_VAL,STREET_ID,STREET_VAL,SUBURB_ID,SUBURB_VAL,STATE_ID,STATE_VAL,POSTCODE_ID,POSTCODE_VAL,DATE_PICKER_ID,TODAY_DATE_CLASS,SUBMIT_FOR_APPROVAL)
  ConfirmAndCompleteDocument(ENTER_MESSAGE_ID,DOC_COMPLETE_MESSAGE,DOCUMENT_COMPLETE)
end

Then(/^I Should Be Instantly Notified About My Document Awaiting Approval$/i) do
  ConnectToDatabaseAndValidateTheDocumentAwaitingNotifications()
end

Given(/^I Am On The My Document Page Of A Manager$/i) do
  startWebDriver
  GoToThePage(MY_DOCUMENT_PAGE)
  EnterUsername(USER_NAME,MANAGER_USERNAME)
  EnterPassword(PASS_WORD,MANAGER_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

When(/^I Review And Approve The Submitted Document$/i) do
  GoToTheAwaitingApprovalSection(DOCUMENT_APPROVAL_PATH)
  VerifyTheSubmittedFormIsInLockedState()
  GoToTheAwaitingApprovalSectionAndApproveTheDocument(DOCUMENT_APPROVE_BUTTON, ENTER_APPROVAL_MESSAGE_ID, APPROVAL_MESSAGE,CONFIRM_APPROVE_BUTTON)
end

Then(/^The User Should Be Instantly Notified About The Document Being Approved$/i) do
  ConnectToDatabaseAndValidateTheDocumentApprovedNotifications()
end

When(/^I Review And Reject The Submitted Document$/i) do
  GoToTheAwaitingApprovalSectionAndRejectTheDocument(DOCUMENT_APPROVAL_PATH, DOCUMENT_REJECT_BUTTON, ENTER_REJECTION_MESSAGE_ID, REJECTION_MESSAGE,CONFIRM_REJECT_BUTTON)
end

Then(/^The User Should Be Instantly Notified About The Document Being Rejected$/i) do
  ConnectToDatabaseAndValidateTheDocumentRejectedNotifications()
end

