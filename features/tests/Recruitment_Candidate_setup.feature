@Recruitment @candidate

Feature:
  I want to be able to create a New Candidate for Recruitment section

  @add_candidate
  Scenario: Create a New Candidate for Recruitment
    Given I Am On The Recruitment Menu Section
    And I Click on The Candidates Button
    And I am on Candidates Listing Page
    When I Click on New Candidate Button
    And I Enter New Candidate Details
    And I Click on The Save Button
    Then  I Should Be Able To Create A New Candidate

