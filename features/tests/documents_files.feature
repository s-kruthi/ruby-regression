@documents @files

Feature:
  I want to test if a Company Admin can successfully create a Files

  @file_create
   Scenario: Create a New File
    Given I Have Logged In as a Company Admin to tmsfull site
    And   I go to Admin Settings
    And   I Go To The Files under Documents section
    When I click on Add File Button
    And  I Enter File Details
    And  I Select A File
    And  I Select Availability
    Then I Should Be Able To Create A File

  @file_search
  Scenario: Delete an Existing File
    Given I Have Logged In as a Company Admin to tmsfull site
    And   I go to Admin Settings
    And   I Go To The Files under Documents section
    Then  I Should Be Able To Search For A Specific File

  @file_delete
    Scenario: Delete an Existing File
    Given I Have Logged In as a Company Admin to tmsfull site
    And   I go to Admin Settings
    And   I Go To The Files under Documents section
    Then  I Should Be Able To Delete A Specific File