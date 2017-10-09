@recruitment @requisition

Feature:
  I want to be able to create a New Requisition Request

  @add_requisition @recruitment_high_risk
  Scenario: Create a Requisition
    Given I Have Logged In as a Recruitment Admin to staging5 site
    And I Go To The Menu Recruitment Section
    When  I Click on New Requisition Button
    And   I Enter New Requisition Details
    Then  I Should Be Able To Create A New Requisition Request

  @add_candidate @recruitment_high_risk
  Scenario: Create a New Candidate for Recruitment
    Given I Have Logged In as a Recruitment Admin to staging5 site
    And I Go To The Recruitment Candidates Section
    When I Click on New Candidate Button
    And I Enter New Candidate Details
    And I Click on The Save Button
    Then I Should Be Able To Create A New Candidate

  @CreateJobAdd @recruitment_high_risk
  Scenario: Add A Job Ad
    Given I Am Under A Recruitment Requisition
    And  I Try To Create A New Job Ad
    When I Fill The Details Of A New Job Ad
    Then I Should be Able To Post The New Job

 @movecandidate @recruitment_high_risk
  Scenario: Move Candidate To Not Suitable category
    Given I Am Under A Recruitment Requisition
    And I Have A New candidate Applied for A Position
   When I Move The Candidate From New To Notsuitable Category
   Then I Should Be Able To View The Candidate Under Unsuccessful Category

