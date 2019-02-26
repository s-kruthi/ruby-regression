@leavepolicy

Feature:
  As a HR Manager I want to manage leave policies


  @leave_low_risk @leave_policy_toggle_default
  Scenario: [Leave]Verify Leave Policy Toggles Default Settings
    Given I Have Logged In as a HR Manager
    And   I Go to Admin Settings
    And   I Go To Leave Policy under Leave Management section
    When  I Click On New Leave Policy Button
    Then  I Should See The Set as default policy toggle set to Disabled
    And   I Should See The Show Personal Leave Balance to employees toggle set to Disabled
    And   I Should See The Show Long Service Leave Balance to employees toggle set to Disabled
    And   I Should See The Show Long Service Leave Validation toggle set to Disabled


  @leave_low_risk @leave_policy_time_validation_LSL @test
  Scenario: [Leave]Verify Time Validation For Showing LSL
    Given I Have Logged In as a HR Manager
    And   I Go to Admin Settings
    And   I Go To Leave Policy under Leave Management section
    When  I Click On New Leave Policy Button
    And   I Set The Show Long Service Leave Balance to employees toggle to Enabled







