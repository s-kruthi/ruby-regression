@Succession
Feature:
  I want to test if a user can successfully create a new succession plan and upon completion can delete it as well.

  Scenario: Delete a Succession
    Given I Am On The Succession Menu Page
    When  I Go To The Succession Landing Page
    Then  I Should Be Able To Delete The Plan From the Table
