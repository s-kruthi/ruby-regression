@documents_forms

Feature:
  I want to test if a Company Admin can successfully Manage Forms

  @form_template_create
   Scenario: Create a Form Template
     Given I Have Logged In as a Company Admin
     And  I Go To The Documents Form Templates Section
     When I click on Create Form Template Button
     And  I Enter New Form Template Details
     Then I Should Be Able To Create A Form Template

  @form_template_hide
    Scenario: Hide a Form Template
      Given I Have Logged In as a Company Admin
      And   I Go To The Documents Form Templates Section
      When  I Search For A Specific Form Template
      Then  I Should Be Able To Hide A Specific Form Template

  @document_category_create
  Scenario: Create a Document Category
    Given I Have Logged In as a Company Admin
    And  I Go To The Documents Categories Section
    When I click on Add Category Button
    And  I Enter New Document Category Details
    Then I Should Be Able To Create A Document Category

  @document_category_hide
  Scenario: Hide a Document Category
    Given I Have Logged In as a Company Admin
    And  I Go To The Documents Categories Section
    Then I Should Be Able To Hide A Document Category

  @bug-PMS-8579
    # url : https://tmsfull.dev.elmodev.com
    # security profile : document prms-shanku
    # role type : shanku-automation-role-type
  Scenario: Invocare - onboarding admins cannot access the documents
    Given I Have Logged In As An Employee With Security Profile Access
    When  I Try To Access Documents Under Reports Tab
    Then  I Should Be Able To View Pending Form Templates
    When  I Have Revoked Access Through Role capability To View Doumnet Reports
    Then  I Shouldn't Be Able To View Reports Tab
