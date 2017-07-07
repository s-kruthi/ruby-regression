@Recruitment @requisition

Feature:
  I want to be able to create a New Requisition Request

  @add_requisition
  Scenario: Create a Requisition
    Given I Am On The Recruitment Requisition Listing Page
    When  I Click on New Requisition Button
    And   I Enter New Requisition Details
    Then  I Should Be Able To Create A New Requisition Request

  @add_candidate
  Scenario: Create a New Candidate for Recruitment
    Given I Am On The Recruitment Menu Section
    And I Click on The Candidates Button
    And I am on Candidates Listing Page
    When I Click on New Candidate Button
    And I Enter New Candidate Details
    And I Click on The Save Button
    Then I Should Be Able To Create A New Candidate

  @CreateJobAdd
  Scenario: Add A Job Ad
    Given I Am Under A Recruitment Requisition
    And  I Try To Create A New Job Ad
    When I Fill The Details Of A New Job Ad
    Then I Should be Able To Post The New Job

 @movecandidate
  Scenario: Move Candidate To Not Suitable category
    Given I Am Under A Recruitment Requisition
    And I Have A New candidate Applied for A Position
   When I Move The Candidate From New To Notsuitable Category
   Then I Should Be Able To View The Candidate Under Unsuccessful Category

