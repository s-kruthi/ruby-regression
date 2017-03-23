@client_contracts

Feature:
  I want to test if an ELMO Admin can successfully Manage Client Contracts

  @client_contract_add
   Scenario: Create a Client Contract
     Given I Have Logged In as an ELMO Admin
     And  I Go To The Contracts Section
     When I click on Add New Contract Button
     And  I Enter New Client Contract Details
     Then I Should Be Able To Create A Client Contract

  @client_contract_delete
    Scenario: Delete a Client Contract
      Given I Have Logged In as an ELMO Admin
      And   I Go To The Contracts Section
      When  I Search For A Specific Client Contract
      Then  I Should Be Able To Hide A Specific Client Contract



