@learning @courses
  #@learningTestRailTags
  #C1027 C1028
  #@learningTestRailTags
Feature: Course Activity Scorm Package and Quiz Manipulation
  @add_edit_scorm_package @C1027
  Scenario: As a company admin, i want to be able to add/edit a scorm package and make necessary changes
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    Then  I Should Be Able To Add A New SCORM Package Activity
    When  I Leave Current Edit Page For List
    Then  I Should Edit The Scorm Section Name And Description

  @course_enrolment_lock_course_enrolment_edit_scorm @C1028
  Scenario Outline: User can edit the scorm activity regardless of course lock config or user enrolled in the course
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    Then  I Should Be Able To Add A New SCORM Package Activity
    Given The "ELMO Admin" Configure The "Lock course with enrolments" To <course_lock>
    But   I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    And   I Search For Created Course In The Scenario
    And   I Change The Created Course Enrolment With Employee Being <user_enrolled>
    And   I Go To The Sections Of The Created Course
    Then  I Should Edit The Scorm Section Name And Description

    Examples:
      |  course_lock  |  user_enrolled  |
      |     Yes     |  Enrolled         |
      |     Yes     |  NonEnrolled      |
      |     No      |  Enrolled         |
      |     No      |  Enrolled         |

  @quiz_activity_edit @C247
  Scenario: As a company admin, i want to be able to add/edit a quiz and make necessary changes
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    Then  I Should Be Able To Add A New Quiz Activity
    When  I Leave Current Edit Page For List
    Then  I Should Edit The Quiz activity

  @tuesday @quiz_activity_setting
  Scenario: Verify default settings of Quiz activity and change activity settings
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    Then  I Should Be Able To Add A New Quiz Activity
    And   I Verify That Default Settings For Quiz Is Correct
    And   I Should Change Quiz Settings