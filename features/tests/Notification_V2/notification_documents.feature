@Notifications_docs @smoke
Feature:
  As a user I want to test combinations of document notifications to test if they were triggered successfully

  @delete_assigned_docs
  Scenario: Delete Assignments
    Given I Have Assigned Many Documents To A User
    Then  I Need To Delete The Assigned Documents As A TearDown Approach


  @document_assign @document_due
  Scenario: As An Admin Assign A Document Template and User will get instantly notified about the assignment and its past due date(set to -1 month)
    Given I Am On The Document Template List View Page
    When  I Successfully Assign A Template To A Candidate
    Then  I It Should Instantly Trigger An Email Notification

  @document_submitted_awaiting_approval
  Scenario: Fill and Submit An Assigned Document Template  As A User and get instantly notified with the Document awaiting approval Email
    Given I Am On The My Document Page Of An User
    When  I Successfully Submit My Document Template
    Then  I Should Be Instantly Notified About My Document Awaiting Approval


    #####  IMPORTANT NOTE ######
  ##### since approval or rejection requires all the above three scenarios to run again, we can choose to run either doc approval or doc rejection
  #### one at a time by commenting out one or other scenario , this will save us time and will provide flexibility around test run

#  @document_approved
#  Scenario: As A manager Review and Approve the Document Submitted by an User(# 1st level approval is set to Manager)
#    Given I Am On The My Document Page Of A Manager
#    When  I Review And Approve The Submitted Document
#    Then  The User Should Be Instantly Notified About The Document Being Approved

  @document_rejected
  Scenario: As A manager Review and Reject the Document Submitted by an User (# 1st level approval is set to Manager)
    Given I Am On The My Document Page Of A Manager
    When  I Review And Reject The Submitted Document
    Then  The User Should Be Instantly Notified About The Document Being Rejected