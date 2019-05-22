@general @departments

Feature:
  As a Company Admin I Want To Manage Company Departments So That I Can Specify Employee Departments
  
  @general_department_add
  Scenario: [General] Company Admin Creating A New Department Successfully
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Departments" Under "General" Section
    When  I Click On "Add a new department" Button
    And   I Add New "Department" Details
    Then  I Should Be Able To Successfully Create A New "Department"