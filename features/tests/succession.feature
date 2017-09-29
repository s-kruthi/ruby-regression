@succession @smoke
Feature:
  I want to test if a user can successfully create a new succession plan and upon completion can delete it as well.

  @succession_delete
  Scenario: Delete a Succession
    Given I Have Logged In as a Company Admin to tmsfull site
    And   I go to Admin Settings
    And   I Go To The Succession Review Setup Under Succession Section
    When   I Create A New Succession Plan
    Then  I Should Be Able To Delete The Plan From the Table

  @succession_hide
  Scenario: Hide a Succession
    Given I Have Logged In as a Company Admin to tmsfull site
    And   I go to Admin Settings
    And   I Go To The Succession Review Setup Under Succession Section
    And   I Create A New Succession Plan
    Then  I Should Be Able To Hide The Plan From the Table
    And   I Should Be Able To Make It Back Visible Again
    And   I Should Be Able To Delete The Plan From the Table

  @succession_search
  Scenario: Search a Succession
    Given I Have Logged In as a Company Admin to tmsfull site
    And   I go to Admin Settings
    And   I Go To The Succession Review Setup Under Succession Section
    And   I Create A New Succession Plan To Search For
    Then  I Should Be Able To Search The Succession From The List
    And   I Should Be Able To Delete The Searched Plan From the Table

  @succession_cannot_delete
  Scenario: Assigned Succession Plan Cannot Be Deleted
    Given I Have Logged In as a Company Admin to tmsfull site
    And   I go to Admin Settings
    And   I Go To The Succession Review Setup Under Succession Section
    And   I Try To Delete A Pre Assigned Succession Plan
    Then  I Am Returned With Cannot Be Deleted Message