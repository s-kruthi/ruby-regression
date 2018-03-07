@client_contracts

Feature:
  I want to test if an ELMO Setup Admin can successfully Manage Client Contracts

  @client_contract_add @general_high_risk
  Scenario: [General]Create a Client Contract
     Given I Have Logged In as a ELMO Setup Admin
     And  I Go To The Contracts Section
     When I click on Add New Contract Button
     And  I Enter New Client Contract Details
     Then I Should Be Able To Create A Client Contract

  @client_contract_search @general_low_risk
  Scenario: [General]Search a Client Contract
    Given I Have Logged In as a ELMO Setup Admin
    And  I Go To The Contracts Section
    Then  I Should Be Able To Search For A Specific Active Client Contract

  @client_contract_deactivate @general_high_risk
    Scenario: [General]De-activate a Client Contract
    Given I Have Logged In as a ELMO Setup Admin
      And   I Go To The Contracts Section
      When  I Search For A Specific Active Client Contract
      Then  I Should Be Able To De-Activate A Specific Active Client Contract