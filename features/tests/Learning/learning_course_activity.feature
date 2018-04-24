@learning @courses
  #@learningTestRailTags
  #C1027 C1028
  #@learningTestRailTags
Feature: Course Activity Scorm Package Manipulation
  @add_edit_scorm_package @C1027
  Scenario: As a Learning Admin, I Want To Be Able To Add/Edit A SCORM Package And Make Necessary Changes
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    Then  I Should Be Able To Add A New SCORM Package Activity
    When  I Leave Current Edit Page For List
    Then  I Should Edit The Scorm Section Name And Description

  @course_enrolment_lock_course_enrolment_edit_scorm @C1028
  Scenario Outline: User Can Edit The Scorm Activity Regardless Of Course Lock Config Or User Enrolled In The Course
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