@employee_contracts

#@ContractTestRailTags
#
#@ContractTestRailTags

Feature:
  I want to Test if I can Successfully Manage Contract Library

  @employee_contract_add @contracts_high_risk
  Scenario: [Contracts]Create a New Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I click on New Contract Button
    And I Enter New Employee Contract Details
    Then I Should Be Able To Create A New Contract

  @employee_contract_search @contracts_high_risk
  Scenario: [Contracts]Search an Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    Then I Should Be Able To Search For An Employee Contract

  @employee_contract_edit @contracts_high_risk
  Scenario: [Contracts]Edit an Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I Search For An Employee Contract
    Then I Should Be Able To Edit An Employee Contract

  @employee_contract_copy @contracts_low_risk
  Scenario: [Contracts]Copy an Existing Contract
    Given I Have Logged In as a ELMO Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I Search For An Employee Contract
    Then I Should Be Able To Copy An Employee Contract

  @employee_contract_hide @contracts_low_risk
  Scenario: [Contracts]Hide/Unhide an Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I Search For An Employee Contract
#    Then I Should Be Able To Hide/Unhide An Employee Contract

  @employee_contract_delete @contracts_low_risk
  Scenario: [Contracts]Delete an Existing Contract
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Contract Library" Under "General" Section
    When I Search For An Employee Contract
#    Then I Should Be Able To Delete An Employee Contract