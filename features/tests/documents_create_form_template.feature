@documents_create_form_template @hr_core
Feature:
  I want to test if a Company Admin can successfully create a Form Template

  @smoke
   Scenario: Create a Form Template
     Given I Have Logged In as a Company Admin
     When  I Go To The Documents Form Templates Section
     Then  I Should Be Able To Create A Form Template

  @document2
    Scenario: Hide a Form Template
      Given I Have Logged In as a Company Admin
      When  I Go To The Documents Form Templates Section
      And   I Search For A Specific Form Template
      Then  I Should Be Able To Hide A Specific Form Template



