@general @assignment_rules

Feature: As A Learning Admin I Would Like To Manage Assignment Rules For Users

  @general_high_risk @general_assignment_rules_create
  Scenario: [Learning]Learning Admin Can Add Assignment Rules With Conditions, Required And Recommended Courses For Users
    Given I Have Logged In As A Learning Admin
    And   I Go To Admin Settings
    And   I Go To Assignment Rules Under General Section
    When  I Click On "New Rule" Button
    And   I Enter Assignment Rules Details
    And   I Enter Assignment Rules Condition For Manager As manager1.scriptonce1
    And   I Enter Assignment Rules Required Course Name As ELMO Test - Face to Face Logic
    And   I Enter Assignment Rules Recommended Course Name As ELMO Module
    Then  I Should Be Able To Save An Assignment Rule Successfully


  @general_high_risk @general_assignment_rules_deactivate
  Scenario: [Learning]Learning Admin Can Deactivate Assignment Rules With Conditions, Required And Recommended Courses For Users
    Given I Have Logged In As A Learning Admin
    And   I Go To Admin Settings
    And   I Go To Assignment Rules Under General Section
    #NOTE: Please provide the name of an assignment here which contains at least more than 10 users to ensure the background progress bar is displayed
    And   I Search For A Specific Assignment Rule Named ABS Sales Training Rule
    Then  I Should Be Able To Deactivate A Specific Assignment Rule Successfully