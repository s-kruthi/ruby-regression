@client_contracts

Feature:
  I want to test if an Finance Manager can successfully Manage Client Contracts

  @add_client_contract
  Scenario: Create a Client Contract
     Given I Have Logged In as an Finance Manager
     And  I Go To The Contracts Section
     When I click on Add New Contract Button
     And  I Enter New Client Contract Details
     Then I Should Be Able To Create A Client Contract

  @search_client_contract
  Scenario: Search a Client Contract
    Given I Have Logged In as an Finance Manager
    And  I Go To The Contracts Section
    Then  I Should Be Able To Search For A Specific Active Client Contract

  @deactivate_client_contract
    Scenario: De-activate a Client Contract
      Given I Have Logged In as an Finance Manager
      And   I Go To The Contracts Section
      When  I Search For A Specific Active Client Contract
      Then  I Should Be Able To De-Activate A Specific Active Client Contract