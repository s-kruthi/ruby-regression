@payroll-1

Feature: As An Admin I login to the Elmo Payroll and perform different operations

  @payroll_add_member
  Scenario: [Payroll]As an Admin I login to the Elmo Payroll & create a new Member
    Given I Log In as a Staging Payroll Admin
    And   I Navigate To The Dashboard Menu and select "Main Dashboard"
    And   I choose the pay cycle as "Monthly Pay"
    Then  I navigate To the Workforce Menu and select "Add Member"
    And   I fill all the details in TFN Declaration page and continue
    And   I fill all the details in Profile page and continue
    And   I fill all the details in Pay Details page and continue
    And   I fill all the details in Leave Details and continue
    When  I confirm to add new member
    And   I navigate To the Workforce Menu and select "Member Details"
    Then  I verify the new member created

  @payroll_terminate_member
  Scenario: [Payroll]As an Admin I login to the Elmo Payroll & terminate a Member
    Given I Log In as a Staging Payroll Admin
    And   I Navigate To The Dashboard Menu and select "Main Dashboard"
    And   I choose the pay cycle as "Monthly Pay"
    When  I navigate To the Input Menu and select "Termination entries"
    Then  I click on Add Termination and fill and Verify all the details in Terminate employee screen

  @payroll_add_timesheet
  Scenario: [Payroll]As an Admin I login to the Elmo Payroll & add timesheet
    Given I Log In as a Staging Payroll Admin
    And   I Navigate To The Dashboard Menu and select "Main Dashboard"
    And   I choose the pay cycle as "Monthly Pay"
    And   I navigate To the Input Menu and select "Quantity input"
    And   I click on ADD TIMESHEET and enter the timesheet details
    Then  I click on save to update the timesheet entries



