Feature:
  As a user I want to test the admin rights to create various leave components
@run_me
  Scenario: Create Leave types
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Type
    Then  I Should Be Able To Successfully Create A New Leave Type

  Scenario: Create Leave policy
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Policy
    Then  I Should Be Able To Successfully Create A New Leave Policy
