@Notifications @smoke
Feature:
  As a user I want to test combinations of event notifications to test if they were triggered successfully

  @change_password
  Scenario: Reset User's password
    Given I Am On The Change Password Section Of A Specific User Profile
    When  I Successfully Change The Password and Opt To Get Notified
    Then  I Should Be Instantly Notified About My Password Change
