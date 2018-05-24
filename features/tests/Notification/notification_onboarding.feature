@Notifications @smoke
Feature:
  As a user I want to test combinations of on boarding notifications to test if they were triggered successfully

  @change_password @NotificationsGeneral @NotificationsOnboarding
  Scenario: [General]Reset User's password
    Given I Am On The Change Password Section Of A Specific User Profile
    When  I Successfully Change The Password and Opt To Get Notified
    Then  I Should Be Instantly Notified About My Password Change

  @forgot_password @NotificationsGeneral @NotificationsOnboarding
  Scenario: [General]Forgot User password
    Given I Am On The Forgot Password Reset Section Of A Specific User
    When  I Successfully Trigger The Reset Password Email
    Then  I Should Be Instantly Notified With The Reset Forgot Password Email

