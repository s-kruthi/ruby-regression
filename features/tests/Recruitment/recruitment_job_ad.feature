@recruitment @recruitment_jobad

Feature:
  As a candidate I should be able to apply for Job Ads

  @recruitment_internal_jobad
Scenario: [Recruitment]Employee Can Apply For An Internal Job Ad
    Given I Have Logged In As An Employee Using The Username "auto1.scriptonce1" And Password "Admin1234567"
    And   I Go To The "Menu Careers" Section
    And   I Search For The Job Ad Titled "Quality Assurance Tester - Automation - Internal"
    When  I Apply For The Job Ad Titled "Quality Assurance Tester - Automation - Internal"
    And   I Upload My Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide My Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad
    And   I Should Be Able To Successfully "Verify" The "Internal" Job Ad Named "Quality Assurance%Internal" For Username "auto1.scriptonce1" From Database
    And   I Should Be Able To Successfully "Remove" The "Internal" Job Ad Named "Quality Assurance%Internal" For Username "auto1.scriptonce1" From Database

  @recruitment_external_jobad
  Scenario: [Recruitment]External Candidate With Profile Can Apply For An External Job Ad
    Given I Have Logged In To The External Career Portal "test" Using The Username "candidate1.scriptonce1@elmodev.com" And Password "Admin1234567"
    And   I Go To The Browse Jobs Page
    And   I Search For The Job Ad Titled "Quality Assurance Tester - Automation - External"
    When  I Apply For The Job Ad Titled "Quality Assurance Tester - Automation - External"
    And   I Upload My Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide My Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad
    And   I Should Be Able To Successfully "Verify" The "External" Job Ad Named "Quality Assurance%External" For Username "candidate1.scriptonce1@elmodev.com" From Database
    And   I Should Be Able To Successfully "Remove" The "External" Job Ad Named "Quality Assurance%External" For Username "candidate1.scriptonce1@elmodev.com" From Database

  @recruitment_vendor_jobad
  Scenario: [Recruitment]Vendor Can Submit Candidate For A Job Ad
    Given I Have Logged In As Vendor Using The Username "vendor1.scriptonce1@elmodev.com" And Password "Admin1234567"
    And   I Go To The Browse Jobs Page
    And   I Search For The Job Ad Titled "Quality Assurance Tester - Automation - Vendor"
    When  I Submit Candidate For The Job Ad Titled "Quality Assurance Tester - Automation - Vendor"
    And   I Enter Candidate Details
    And   I Upload The Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide The Candidate Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad
    And   I Should Be Able To Successfully "Verify" The "Vendor" Job Ad Named "Quality Assurance%Vendor" For Username "candidate1.scriptonce1@elmodev.com" From Database
    And   I Should Be Able To Successfully "Remove" The "Vendor" Job Ad Named "Quality Assurance%Vendor" For Username "candidate1.scriptonce1@elmodev.com" From Database

  @recruitment_externalcandidate_createprofile
  Scenario: [Recruitment]External Candidate Can Create A Profile
    Given  I Am On The External Career Site "test"
    When   I Provide Details To Create Profile
    Then   I Should Be Able To Successfully Create A Profile

  @recruitment_externalcandidate_createprofile_bulk
  Scenario: [Recruitment]Can Create External Candidate Profiles
    Given  I Am On The External Career Site "test"
    When   I Want To Create "2" External Candidate Profiles
    Then   I Should Be Able To Create "2" External Candidate Profiles Successfully

  @recruitment_externalcandidate @jmetertest
  Scenario: [Recruitment]Can Create External Candidate Profiles
    Given  I Am Creating Candidates On The External Career Site "test"

  @recruitment_appliedjob_internal_errormsg
  Scenario: [Recruitment]Cannot Apply For Job Ads Already Applied For
    Given  I Have Already Applied As An Employee For The Job Ad titled "Quality Assurance Tester - Automation - Internal"
    When   I Have Logged In As An Employee Using The Username "auto1.scriptonce1" And Password "Admin1234567"
    And    I Try To Apply For The Job Ad Titled "Quality Assurance Tester - Automation - Internal" As An "Employee"
    Then   I Should Be Able To See A Message Alerting The User That The Job Has Already Been Applied To
    And    I Should Be Able To Successfully "Remove" The "Internal" Job Ad Named "Quality Assurance%Internal" For Username "auto1.scriptonce1" From Database

  @recruitment_appliedjob_external_errormsg
  Scenario: [Recruitment]Cannot Apply For Job Ads Already Applied For
    Given  I Have Already Applied As An External Candidate For The Job Ad titled "Quality Assurance Tester - Automation - External" On The External Career Portal "test"
    When   I Have Logged In To The External Career Portal "test" Using The Username "candidate1.scriptonce1@elmodev.com" And Password "Admin1234567"
    And    I Try To Apply For The Job Ad Titled "Position 1" As An "External Candidate"
    Then   I Should Be Able To See A Message Alerting The User That The Job Has Already Been Applied To
    And    I Should Be Able To Successfully "Remove" The "External" Job Ad Named "Quality Assurance%External" For Username "candidate1.scriptonce1" From Database