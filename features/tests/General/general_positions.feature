@general @positions
  
  
  Feature:
  As a Company Admin I want to manage Company Positions So That I can Add Employee Positions
  
  @general_positions_add
  Scenario: [General] Company Admin Creating A New Position
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Positions under General section
    When  I Click On "Add Position" Button
    And   I Add New Position Details
    Then  I Should Be Able to Successfully Create a New Position
  
