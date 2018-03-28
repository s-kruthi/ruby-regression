@documents @files

#@DocumentTestRailTags
  #
#@DocumentTestRailTags
Feature:
  I want to test if a Company Admin can successfully create a Files

  @file_create @document_high_risk
   Scenario: [Documents]Create a New File
    Given I have logged in as a Company Admin
    And   I go to Admin Settings
    And   I Go To Files under Documents section
    When I click on Add File Button
    And  I Enter File Details
    And  I Select A File
    And  I Select Availability
    Then I Should Be Able To Create A File

  @file_search @document_low_risk
  Scenario: [Documents]Delete an Existing File
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Files under Documents section
    Then  I Should Be Able To Search For A Specific File

  @file_delete @document_high_risk
    Scenario: [Documents]Delete an Existing File
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Files under Documents section
    Then  I Should Be Able To Delete A Specific File