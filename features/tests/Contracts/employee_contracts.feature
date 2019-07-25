@employee_contracts

#@ContractTestRailTags
#
#@ContractTestRailTags

Feature:
  Company Admin Can Manage Contract Library

  @employee_contract_add @contracts_high_risk
  Scenario: [Contracts]Create A New Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When  I Click on New Contract Button
    And   I Enter New Employee Contract Details
    Then  I Should Be Able To Create A New Contract

  @employee_contract_search @contracts_high_risk
  Scenario: [Contracts]Search An Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    Then  I Should Be Able To Search For An Employee Contract

  @employee_contract_edit @contracts_high_risk
  Scenario: [Contracts]Edit An Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When  I Search For An Employee Contract
    Then  I Should Be Able To "Edit" An Employee Contract

  @employee_contract_copy @contracts_low_risk
  Scenario: [Contracts]Copy An Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I Search For An Employee Contract
    Then I Should Be Able To "Copy" An Employee Contract

  @employee_contract_hide @contracts_low_risk
  Scenario: [Contracts]Hide an Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I Search For An Employee Contract
    Then I Should Be Able To "Hide" An Employee Contract

  @employee_contract_unhide @contracts_low_risk
  Scenario: [Contracts]Delete An Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I Search For An Hidden Employee Contract
    Then I Should Be Able To "Unhide" An Employee Contract