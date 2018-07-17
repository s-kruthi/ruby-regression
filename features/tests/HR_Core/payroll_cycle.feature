@hr_core @payroll_cycle

Feature:
  As A Company/HR Admin, I Can Manage Payroll Cycles

  #Currently can be run only on payroll03
  @hr_core_low_risk
  Scenario: [General]Company Admin Cannot Delete Payroll Cycle Associated To An User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Delete For The Payroll Cycle Associated To User
    Then  I Should Be Displayed With A Warning Message
    And   I Should Not Be Able To Delete The Payroll Cycle


  @hr_core_low_risk @payroll_cycle_delete
  Scenario: [General]Company Admin Can Delete Payroll Cycle
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Delete For The Unassociated Payroll Cycle
    Then  I Should Be Able To Delete The Payroll Cycle


  @hr_core_low_risk @payroll_cycle_add
  Scenario: [General]Company Admin Can Add Payroll Cycle
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section 
    When  I Click On Add Payroll Cycle Button
    And   I Enter The Payroll Cycle Details
    Then  I Should Be Able To Create The Payroll Cycle Successfully


  @hr_core_low_risk @payroll_cycle_edit @wip
  Scenario: [General]Company Admin Can Edit Payroll Cycle
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Edit Payroll Cycle Button

