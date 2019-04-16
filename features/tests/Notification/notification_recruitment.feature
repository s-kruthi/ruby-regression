@notifications @notifications_recruitment @smoke
Feature:
  As a user I want to verify different recruitment related notifications

  @recruitment_create_notification
  Scenario: [Recruitment]Candidate Withdraws Self From Requisition
    Given I Have Logged In as a Recruitment Admin
    And   I go to Admin Settings
    And   I Go To Notifications under General section
    When  I Click On "Add Notification" Button
    And   I Select The "Requisition Withdrawn" Notification Trigger
    And   I Enter The Necessary Details For The Notification
    Then  I Should See That The Notification Was Created Successfully

