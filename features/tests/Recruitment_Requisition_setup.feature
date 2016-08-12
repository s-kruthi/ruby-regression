@Recruitment @requisition
Feature:
  I want to be able to create a New Requisition Request

  @add
  Scenario: Create a Requisition
    Given I Am On The Recruitment Requisition Listing Page
    When  I Click on New Requisition Button
    And   I Enter New Requisition Details
    Then  I Should Be Able To Create A New Requisition Request