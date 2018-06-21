@general @assignment_rules

Feature: As A Learning Admin I Would Like To Manage Assignment Rules For Users

  @general_high_risk @general_assignment_rules_create
  Scenario: [Learning]Learning Admin Can Add Assignment Rules With Conditions, Required And Recommended Courses For Users
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Assignment Rules under General section
    When  I Click On "New Rule" Button
    And   I Enter Assignment Rules Details
    And   I Enter Assignment Rules Condition For Manager As manager1.omar1
    And   I Enter Assignment Rules Required Course Name As Competition and Consumer
    And   I Enter Assignment Rules Recommended Course Name As Sexual Harassment
    Then  I Should Be Able To Save an Assignment Rule successfully


  @general_high_risk @general_assignment_rules_deactivate
  Scenario: [Learning]Learning Admin Can Deactivate Assignment Rules With Conditions, Required And Recommended Courses For Users
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Assignment Rules under General section
    #NOTE: Please provide the name of an assignment here which contains at least more than 10 users to ensure the background progress bar is displayed
    And   I Search For A Specific Assignment Rule Named ABS Sales Training Rule
    Then  I Should Be Able To Deactivate A Specific Assignment Rule Successfully