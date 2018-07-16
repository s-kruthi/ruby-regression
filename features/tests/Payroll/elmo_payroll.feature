@payroll1

Feature: As An Admin I login to the Elmo Payroll and navigate to different menu

  @P1
  Scenario: [Payroll]Navigate through different menus in the Payroll application
    Given I Have Logged In as a Payroll Admin
    And   I Go To Dashboard Menu
    And   I Go To Input Menu
    When  I Go To Workforce Menu
    And   I Go To Reports Menu
    And   I Go To Settings Menu
    And   I Go To Help Menu
    Then  I Logout of the Payroll Application