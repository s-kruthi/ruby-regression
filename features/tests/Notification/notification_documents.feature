@Notifications_docs @smoke

#@DocumentTestRailTags
#
#@DocumentTestRailTags
Feature:
  As a user I want to test combinations of document notifications to test if they were triggered successfully

  @delete_assigned_docs @document_low_risk
  Scenario: [Documents]Delete Assignments
    Given I Have Assigned Many Documents To A User
    Then  I Need To Delete The Assigned Documents As A TearDown Approach


  @document_assign @document_due @document_submitted_awaiting_approval @document_approved @NotificationsDocuments
  Scenario: [Documents]As An Admin Assign A Document Template and User will get instantly notified about the assignment and its past due date(set to -1 month)
    Given I Am On The Document Template List View Page
    When  I Successfully Assign A Template To A Candidate
    Then  It Should Instantly Trigger An Email Notification
    # Scenario: [Documents]Fill and Submit An Assigned Document Template  As A User and get instantly notified with the Document awaiting approval Email
    And   As A User I Go To My Document Page
    When  I Successfully Submit My Document Template
    Then  I Should Be Instantly Notified About My Document Awaiting Approval
    # Scenario: [Documents]As A manager Review and Approve the Document Submitted by an User(# 1st level approval is set to Manager)
    And   As A Manager I Go To My Document Page
    When  I Review And Approve The Submitted Document
    Then  The User Should Be Instantly Notified About The Document Being Approved


  @document_rejected @NotificationsDocuments
  Scenario: [Documents]As An Admin Assign A Document Template and User will get instantly notified about the assignment and its past due date(set to -1 month)
    Given I Am On The Document Template List View Page
    When  I Successfully Assign A Template To A Candidate
    Then  It Should Instantly Trigger An Email Notification
    And   As A User I Go To My Document Page
    When  I Successfully Submit My Document Template
    Then  I Should Be Instantly Notified About My Document Awaiting Approval
    And   As A Manager I Go To My Document Page
    When  I Review And Reject The Submitted Document
    Then  The User Should Be Instantly Notified About The Document Being Rejected

