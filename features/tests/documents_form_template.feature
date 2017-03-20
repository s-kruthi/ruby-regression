@documents_form_template

Feature:
  I want to test if a Company Admin can successfully create a Form Template

  @create_a_form_template
   Scenario: Create a Form Template
     Given I Have Logged In as a Company Admin
     And  I Go To The Documents Form Templates Section
     When I click on Create Form Template Button
     And  I Enter New Form Template Details
     Then I Should Be Able To Create A Form Template

  @hide_a_form_template
    Scenario: Hide a Form Template
      Given I Have Logged In as a Company Admin
      And   I Go To The Documents Form Templates Section
      When  I Search For A Specific Form Template
      Then  I Should Be Able To Hide A Specific Form Template



