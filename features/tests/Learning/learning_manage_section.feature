@learning @Courses @martin_test
  #@learningTestRailTags
  #C240 C241 C242

Feature: As a company administrator I want to create course sections so that I can plan course activities in each section of a course

  @course_section_interaction  @learning_high_risk @240
  Scenario: [Learning]Create a new section for course
    Given I have logged In as a Company Admin
    And  I go to Admin Settings
    And  I Go To Courses under Learning section
    And  I create a new course with a Unique Name
    And  I go to section tab
    When I click on “Add a Section” button
    Then A new section is added

  @course_section_interaction @learning_high_risk @C241
  Scenario: [Learning]Edit existing course section name
    Given I have logged in as a Company Admin
    And  I go to Admin Settings
    And  I Go To Courses under Learning section
    And  I Edit the course created in @240
    And I go to section tab
    And I see existing course sections New Section
    When I press edit button
    And I edit section name
    And I press Done button
    Then I should be able to save new section name

  @course_section_interaction @learning_high_risk @C242
  Scenario: [Learning] Delete existing course section
    Given I have logged in as a Company Admin
    And  I go to Admin Settings
    And  I Go To Courses under Learning section
    And  I Edit the course created in @240
    And  I go to section tab
    And  I see existing course sections Section Field Edited
    When I press delete button
    Then I should able to delete that particular section