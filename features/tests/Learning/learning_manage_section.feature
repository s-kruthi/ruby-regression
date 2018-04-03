@learning @Courses @martin_test
  #@learningTestRailTags
  #C240 C241 C242
  #@learningTestRailTags

Feature: As a company administrator I want to create course sections so that I can plan course activities in each section of a course

  @course_section_interaction  @learning_high_risk @240
  Scenario: [Learning]Create A New Section For Course
    Given I Have Logged In As A Company Admin
    And  I Go To Admin Settings
    And  I Go To Courses Under Learning Section
    And  I Create A New Course With A Unique Name
    Then I Should Be Able To Create A Section
    When I Edit The Section Name Of Course Unique Name
    Then I Should Be Able To Modify The Section Name
    When I Delete The Section Name Of Course Unique Name
    Then I Should Be Able To Delete The Section Name