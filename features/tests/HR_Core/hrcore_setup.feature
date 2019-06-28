@hr_core @hr_core_setup

Feature:
  As A HR Manager, I Can To Be Able To Setup HRCore for Payroll

  @hr_core_low_risk @hr_core_payroll_setup
  Scenario: [General]As A HR Manager, I want To Be Able To Setup Payroll Integration Information
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "HRCore Setup" Under "HR Core" Section
    When  I Click On "Payroll" Tab
    And   I Enter Payroll Integration Details
    Then  I Should Be Able To Successfully Save Payroll Integration Details