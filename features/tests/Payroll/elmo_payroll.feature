@elmo_payroll

Feature: As An Admin I login To The Elmo Payroll System And Perform Generic Operations

  @payroll_add_member @C18978
  Scenario: [Payroll]As An Admin I Login To The Elmo Payroll And Create A New Member
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

  @payroll_terminate_member @C18979
  Scenario: [Payroll]As An Admin I Login To The Elmo Payroll And Terminate A Member
    Given I Log In As A Staging Payroll Admin
    And   I Navigate To The Dashboard Menu And Select Main Dashboard
    And   I Choose The Pay Cycle As Monthly Pay
    When  I Navigate To the Input Menu And Select Termination entries
    Then  I Click On Add Termination And Fill And Verify All The Details In Terminate Employee Screen

  @payroll_add_timesheet @C18980
  Scenario: [Payroll]As An Admin I Login To The Elmo Payroll And Add Timesheet
    Given I Log In As A Staging Payroll Admin
    And   I Navigate To The Dashboard Menu And Select Main Dashboard
    And   I Choose The Pay Cycle As Monthly Pay
    And   I Navigate To the Input Menu And Select Quantity input
    And   I Click On Add Timesheet And Enter The Timesheet Details
    Then  I Click On Save To Update The Timesheet Entries