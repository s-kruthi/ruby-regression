@leavepolicy

Feature:
  As a HR Manager I want to manage leave policies


  #  NOTE: currently can only be run on tmspayrolldev.dev
  @leave_low_risk @leave_policy_toggle_default
  Scenario: [Leave]Verify Leave Policy Toggles Default Settings
    Given I Have Logged In as a HR Manager
    And   I Go To Admin Settings
    And   I Go To Leave Policy under Leave Management section
    When  I Click On New Leave Policy Button
    Then  I Should See The Set as default policy toggle set to Disabled
    And   I Should See The Show Personal Leave Balance to employees toggle set to Disabled
    And   I Should See The Show Long Service Leave Balance to employees toggle set to Disabled
    And   I Should See The Show Long Service Leave Validation toggle set to Disabled


  #  NOTE: currently can only be run on tmspayrolldev.dev
  @leave_low_risk @leave_policy_time_validation_LSL_default
  Scenario: [Leave]Verify Time Validation For Showing LSL
    Given I Have Logged In as a HR Manager
    And   I Go To Admin Settings
    And   I Go To Leave Policy under Leave Management section
    When  I Click On New Leave Policy Button
    And   I Set The Show Long Service Leave Balance to employees toggle to Enabled
    Then  I Should See That The Show LSL after x years Default Value is 1


  #  NOTE: currently can only be run on tmspayrolldev.dev
  @leave_low_risk @leave_policy_time_validation_LSL
  Scenario: [Leave]Verify Time Validation For Showing LSL
    Given I Have Logged In as a HR Manager
    And   I Go To Admin Settings
    And   I Go To Leave Policy under Leave Management section
    And   I Edit A Leave Policy
    When  I Set The Show Long Service Leave Balance to employees toggle to Enabled
    And   I Enter The Show LSL after x years To 36
    And   I Click The Save Button To Save The Leave Policy
    Then  I Should See A LSL Time Validation Error Message










