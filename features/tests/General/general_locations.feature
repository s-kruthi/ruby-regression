@general @locations

Feature:
  As a Company Admin I want to manage Company Locations So That I Can Specify Employee Locations
  
  @general_locations_add
  Scenario: [General] Company Admin Creating A New Position
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Locations under General section
    When  I Click On "Add a new location" Button
    And   I Add New "Location" Details
    Then  I Should Be Able to Successfully Create a New "Location"