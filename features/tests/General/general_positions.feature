@general @positions
  
  Feature:
  As a Company Admin I want to manage Company Positions So That I can Add Employee Positions
  
  @general_position_add
  Scenario: [General] Company Admin Creating A New Position Successfully
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Positions" Under "General" Section
    When  I Click On "Add Position" Button
    And   I Add New "Position" Details
    Then  I Should Be Able To Successfully Create A New "Position"
