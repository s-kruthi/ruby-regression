@general @locations


Feature:
  As a Company Admin I want to manage Company Locations So That I Can Specify Employee Locations
  
  @general_location_add
  Scenario: [General] Company Admin Creating A New Location Successfully
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Locations Under General Section
    When  I Click On "Add a new location" Button
    And   I Add New "Location" Details
    Then  I Should Be Able To Successfully Create A New "Location"