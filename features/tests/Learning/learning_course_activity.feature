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
  Scenario: As A Company Admin, I Want To Be Able To Add/edit A Quiz And Make Necessary Changes
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    And  I Should Be Able To Add A New Quiz Activity
    And  I Leave Current Edit Page For List
    Then  I Should Edit The Quiz activity

  @quiz_activity_setting
  Scenario: Verify Default Settings Of Quiz Activity And Change Activity Settings
    Default settings for Settings is "Completion Terminology: Pass/Fail", "Show Feedback: Yes", "Marker: Manager"
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    And   I Should Be Able To Add A New Quiz Activity
    And   I Verify That Default Settings For Quiz Is Correct
    Then  I Should Change Quiz Settings

  @course_enrolment_lock_course_enrolment_edit_quiz
  Scenario Outline: Ability To Edit Quiz Activity As Per Enrolment And System Configuration

    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    When  I Create A New Course With A Unique Name
    Then  I Should Be Able To Add A New Quiz Activity
    Given The "ELMO Admin" Configure The "Lock course with enrolments" To <course_lock>
    But   I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To Courses Under Learning Section
    And   I Search For Created Course In The Scenario
    And   I Change The Created Course Enrolment With Employee Being <user_enrolled>
    And   I Go To The Sections Of The Created Course
    Then  I Should Edit The Quiz activity
    And   Modifying Settings Of Quiz Activity Is <settings>

    Examples:
    |  course_lock  |  user_enrolled  |  settings |
    |     Yes       |  Enrolled       |  Disabled |
    |     Yes       |  NonEnrolled    |  Enabled  |
    |     No        |  Enrolled       |  Enabled  |
    |     No        |  Enrolled       |  Enabled  |

    @course_non_recordable_activities_create @C12720
    Scenario Outline: Able to create activities File, Label, Page, Post
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      Then  I Should Be Able To Add A New <activity> Activity

    Examples:
    |  activity  |
    |     File   |
    |     Page   |
    |     Label  |
    |     Post   |