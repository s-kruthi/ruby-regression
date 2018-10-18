@recruitment

Feature:
  As a candidate I should be able to apply for Job Ads

  @recruitment_internal_jobad
  Scenario: [Recruitment]Employee can apply for an Internal Job Ad
    Given I Have Logged In Using The Username "auto1.scriptonce1" And Password "Admin1234567"
    And   I Go To The Menu Careers Section
    When  I Apply For The Job Ad Titled "Gui Position 1 - Internal Job Ad"
    And   I Upload My Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide My Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad

