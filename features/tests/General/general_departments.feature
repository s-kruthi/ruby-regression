@general @departments

Feature:
  As a Company Admin I Want To Manage Company Departments So That I Can Specify Employee Departments
  
  @general_departments_add
  Scenario: [General] Company Admin Creating A New Department
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Departments under General section
    When  I Click On "Add a new department" Button
    And   I Add New Department Details
    Then  I Should Be Able to Successfully Create a New Department