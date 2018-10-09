@payroll

Feature: As A Payroll Admin I Can Send Data To Payroll

  @company_data
  Scenario: [Payroll]As A Payroll Admin I Can Send Company Data To The Elmo Payroll
    Given I Have Logged In as a Payroll Admin
    When  I Make Changes To Legal Entity
    And   I Send Company Data To Elmo Payroll
    Then  The Company Data Should Be Sent Successfully


