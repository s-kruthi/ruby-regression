@documents_files

Feature:
  I want to test if a Company Admin can successfully create a Form Template

  @file_create
   Scenario: Create a New File
     Given I Have Logged In as a Company Admin
     And  I Go To The Documents Files Section
     When I click on Add File Button
     And  I Enter File Details
     Then I Should Be Able To Create A File

  @file_search
  Scenario: Delete an Existing File
    Given I Have Logged In as a Company Admin
    And   I Go To The Documents Files Section
    When  I Search For A Specific File
    Then  I Should Be Able To See The File In The Search Result

  @file_delete
    Scenario: Delete an Existing File
      Given I Have Logged In as a Company Admin
      And   I Go To The Documents Files Section
      When  I Search For A Specific File
      Then  I Should Be Able To See The File In The Search Result
      And   I Should Be Able To Delete A Specific File