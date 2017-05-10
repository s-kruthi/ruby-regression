@Course_setup
  Feature: As An Admin i Would Like to Set up A Course Which can Further Be Used To Create Recordable And Non Recordable
    Activities
  @xxx430
  Scenario: Create A New Course With Quiz Activity
    Given I Have Logged In as a Company Admin To Setup A Course
    When  I Setup A Course To Edit The Section
    And   I Try To Setup A Quiz Activity Under The Section
    Then  I Should be Able To Successfully Setup The Quiz Activity

   # Scenario: Assign The Quiz Activity To An User