@payroll-1

Feature: As An Admin I login to the Elmo Payroll and perform different operations

  @payroll_add_member
  Scenario: [Payroll]As an Admin I login to the Elmo Payroll & create a new Member
    Given I Log In As A Staging Payroll Admin
    And   I Navigate To The Dashboard Menu And Select Main Dashboard
    And   I Choose The Pay Cycle As Monthly Pay
    Then  I Navigate To The Workforce Menu And Select Add Member
    And   I Fill All The Details In TFN Declaration Page And Continue
    And   I Fill All The Details In Profile Page And Continue
    And   I Fill All The Details In Pay Details Page And Continue
    And   I Fill All The Details In Leave Details And Continue
    When  I Confirm To Add New Member
    And   I Navigate To The Workforce Menu And Select Member Details
    Then  I Verify The New Member Created

  @payroll_terminate_member
  Scenario: [Payroll]As an Admin I login to the Elmo Payroll & terminate a Member
    Given I Log In As A Staging Payroll Admin
    And   I Navigate To The Dashboard Menu And Select Main Dashboard
    And   I Choose The Pay Cycle As Monthly Pay
    When  I Navigate To the Input Menu And Select Termination entries
    Then  I Click On Add Termination And Fill And Verify All The Details In Terminate Employee Screen

  @payroll_add_timesheet
  Scenario: [Payroll]As an Admin I login to the Elmo Payroll & add timesheet
    Given I Log In As A Staging Payroll Admin
    And   I Navigate To The Dashboard Menu And Select Main Dashboard
    And   I Choose The Pay Cycle As Monthly Pay
    And   I Navigate To the Input Menu And Select Quantity input
    And   I Click On Add Timesheet And Enter The Timesheet Details
    Then  I Click On Save To Update The Timesheet Entries



