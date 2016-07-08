@Succession @smoke
Feature:
  I want to test if a user can successfully create a new succession plan and upon completion can delete it as well.

  @delete
  Scenario: Delete a Succession
    Given I Am On The Succession Menu Page
    When  I Go To The Succession Landing Page
    And   I Create A New Succession Plan
    Then  I Should Be Able To Delete The Plan From the Table

  @hide
  Scenario: Hide a Succession
    Given I Am On The Succession Menu Page
    When  I Go To The Succession Landing Page
    And   I Create A New Succession Plan
    Then  I Should Be Able To Hide The Plan From the Table
    And   I Should Be Able To Make It Back Visible Again
    And   I Should Be Able To Delete The Plan From the Table

  @search
  Scenario: Search a Succession
    Given I Am On The Succession Menu Page
    When  I Go To The Succession Landing Page
    And   I Create A New Succession Plan To Search For
    Then  I Should Be Able To Search The Succession From The List
    And   I Should Be Able To Delete The Searched Plan From the Table

  @cannot_delete_succession
  Scenario: Assigned Succession Plan Cannot Be Deleted
    Given I Am On The Succession Menu Page
    When  I Go To The Succession Landing Page
    And   I Try To Delete A Pre Assigned Succession Plan
    Then  I Am Returned With Cannot Be Deleted Message