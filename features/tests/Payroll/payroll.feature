@payroll

Feature: As A Payroll Admin I Can Send Data To Payroll

  @smoke_payroll @send_company_data
  Scenario: [Payroll]As A Payroll Admin I Can Send Company Data To Elmo Payroll
    Given I Have Logged In as a Company Admin
    When  I Make Changes To Legal Entity
    And   I Have Logged In as a Payroll Admin
    And   I Send Company Data To Elmo Payroll
    Then  The Company Data Should Be Sent Successfully


  @smoke_payroll @send_newemployee_data
  Scenario: [Payroll]As A Payroll Admin I Can Send New Employee Data To Elmo Payroll
    Given Contracts Is Disabled For New Users
    And   I Have Created A New User
    And   All The Necessary Details Of The Employee Required For Payroll Are Added
    And   I Have Logged In as a Payroll Admin
    When  I Send Employee Data To Elmo Payroll
    Then  The Employee Data Should Be Sent Successfully
