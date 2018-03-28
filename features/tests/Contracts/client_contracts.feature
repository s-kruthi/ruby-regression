@client_contracts
#@ContractTestRailTags
#
#@ContractTestRailTags
Feature:
  I want to test if an ELMO Setup Admin can successfully Manage Client Contracts

  @client_contract_add @contracts_high_risk
  Scenario: [Contracts]Create a Client Contract
     Given I Have Logged In as a ELMO Setup Admin
     And  I Go To The Contracts Section
     When I click on Add New Contract Button
     And  I Enter New Client Contract Details
     Then I Should Be Able To Create A Client Contract

  @client_contract_search @contracts_low_risk
  Scenario: [Contracts]Search a Client Contract
    Given I Have Logged In as a ELMO Setup Admin
    And  I Go To The Contracts Section
    Then  I Should Be Able To Search For A Specific Active Client Contract

  @client_contract_deactivate @contracts_high_risk
    Scenario: [Contracts]De-activate a Client Contract
    Given I Have Logged In as a ELMO Setup Admin
      And   I Go To The Contracts Section
      When  I Search For A Specific Active Client Contract
      Then  I Should Be Able To De-Activate A Specific Active Client Contract