Feature: Create and Manage Candidates

  @recruitment_add_candidate  @recruitment_high_risk
  Scenario: Adding a new Candidate
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Candidates" Under "Recruitment" Section
    When  I Click on New Candidate Button
    And   I Enter New Candidate Details
    And   I Click on The Save Button
    Then  I Should See That The Candidate is Created Successfully


  @recruitment_search_candidate @recruitment_low_risk
    Scenario: Verfiy the candidate Search
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To "Candidates" Under "Recruitment" Section
      When  I Search For The Candidate By Keywords VICTOR
      Then  I Should See That The Candidate Is Displayed Successfully