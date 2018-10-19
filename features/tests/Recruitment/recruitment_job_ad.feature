@recruitment @recruitment_jobad

Feature:
  As a candidate I should be able to apply for Job Ads


  @recruitment_internal_jobad
  Scenario: [Recruitment]Employee can apply for an Internal Job Ad
    Given I Have Logged In As An Employee Using The Username "auto1.scriptonce1" And Password "Admin1234567"
    And   I Go To The Menu Careers Section
    And   I Search For The Job Ad Titled "Gui Position 1 - Internal Job Ad"
    When  I Apply For The Job Ad Titled "Gui Position 1 - Internal Job Ad"
    And   I Upload My Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide My Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad


  @recruitment_external_jobad
  Scenario: [Recruitment]External candidate with profile can apply for an External Job Ad
    Given I Have Logged In To The External Career Portal tmsdevfull Using The Username "test@mail.com" And Password "Admin1234567"
    And   I Go To The Browse Jobs Page
    And   I Search For The Job Ad Titled "Gui Position 1 - External Job Ad"
    When  I Apply For The Job Ad Titled "Gui Position 1 - External Job Ad"
    And   I Upload My Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide My Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad


  @recruitment_vendor_jobad
  Scenario: [Recruitment]Vendor can submit candidate for a Job Ad
    Given I Have Logged In As Vendor Using The Username "vendortest@mail.com" And Password "Admin1234567"
    And   I Go To The Browse Jobs Page
    And   I Search For The Job Ad Titled "Gui Position 1 - Vendor User"
    When  I Submit Candidate For The Job Ad Titled "Gui Position 1 - Vendor User"
    And   I Enter Candidate Details
    And   I Upload The Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide The Candidate Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad
