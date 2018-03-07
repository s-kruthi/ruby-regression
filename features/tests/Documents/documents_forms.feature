@documents @forms

Feature:
  I want to test if a Company Admin can successfully Manage Forms

  @document_category_create @document_high_risk
  Scenario: [Documents]Create a Document Category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Document Categories under Documents section
    When I click on Add Category Button
    And  I Enter New Document Category Details
    Then I Should Be Able To Create A Document Category

  @document_category_hide @document_low_risk
  Scenario: [Documents]Hide a Document Category
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Document Categories under Documents section
    Then I Should Be Able To Hide A Document Category

  @form_template_create @document_high_risk
   Scenario: [Documents]Create a Form Template
     Given I Have Logged In as a Company Admin
     And   I go to Admin Settings
     And  I Go To Form Templates Under Documents Section
     When I click on Create Form Template Button
     And  I Enter New Form Template Details
     Then I Should Be Able To Create A Form Template

  @form_template_hide @document_low_risk
    Scenario: [Documents]Hide a Form Template
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And  I Go To Form Templates Under Documents Section
    When  I Search For A Specific Form Template
    Then  I Should Be Able To Hide A Specific Form Template


  @bug-PMS-8579 @document_high_risk
    # url : https://tmsfull.dev.elmodev.com
    # security profile : document prms-shanku
    # role type : shanku-automation-role-type
  Scenario: [Documents]Invocare - onboarding admins cannot access the documents
    Given I Have Logged In As An Employee With Security Profile Access
    When  I Try To Access Documents Under Reports Tab
    Then  I Should Be Able To View Pending Form Templates
    When  I Have Revoked Access Through Role capability To View Doumnet Reports
    Then  I Shouldn't Be Able To View Reports Tab

