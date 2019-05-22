@notifications @notifications_recruitment @smoke
Feature:
  As a user I want to verify different recruitment related notifications

  @recruitment_create_notification
  Scenario: [Recruitment]Can Create Recruitment Related Notification
    Given I Have Logged In as a Recruitment Admin
    And   I Go To Admin Settings
    And   I Go To "Notifications" Under "General" Section
    When  I Click On "Add Notification" Button
    And   I Select The "Requisition Withdrawn" Notification Trigger
    And   I Enter The Necessary Details For The Notification
    Then  I Should See That The Notification Was "Created" Successfully

  @recruitment_copy_notification
  Scenario: [Recruitment]Can Create A Copy Of Recruitment Related Notification
    Given I Have Logged In as a Recruitment Admin
    And   I Go To Admin Settings
    And   I Go To "Notifications" Under "General" Section
    When  I Search For "Requisition Withdrawn" Notification
    And   I Create A Copy Of The Notification
    Then  I Should See That The Notification Was "Copied" Successfully

  @recruitment_edit_notification
  Scenario: [Recruitment]Can Edit Recruitment Related Notification
    Given I Have Logged In as a Recruitment Admin
    And   I Go To Admin Settings
    And   I Go To "Notifications" Under "General" Section
    When  I Search For "Requisition Withdrawn-copy" Notification
    And   I Edit The Title To Be "Requisition Withdrawn-copy1"
    Then  I Should See That The Notification Was "Edited" Successfully

  @recruitment_deactivate_notification
  Scenario: [Recruitment]Can Deactivate Recruitment Related Notification
    Given I Have Logged In as a Recruitment Admin
    And   I Go To Admin Settings
    And   I Go To "Notifications" Under "General" Section
    When  I Search For "Requisition Withdrawn-copy1" Notification
    And   I "Deactivate" The Notification
    Then  I Should See That The Notification Was "Deactivated" Successfully

  @recruitment_activate_notification
  Scenario: [Recruitment]Can Activate Recruitment Related Notification
    Given I Have Logged In as a Recruitment Admin
    And   I Go To Admin Settings
    And   I Go To "Notifications" Under "General" Section
    When  I Search For "Requisition Withdrawn-copy1" Notification
    And   I "Activate" The Notification
    Then  I Should See That The Notification Was "Activated" Successfully

  @recruitment_delete_notification
  Scenario: [Recruitment]Can Activate Recruitment Related Notification
    Given I Have Logged In as a Recruitment Admin
    And   I Go To Admin Settings
    And   I Go To "Notifications" Under "General" Section
    When  I Search For "Requisition Withdrawn-copy1" Notification
    And   I "Delete" The Notification
    Then  I Should See That The Notification Was "Deleted" Successfully
