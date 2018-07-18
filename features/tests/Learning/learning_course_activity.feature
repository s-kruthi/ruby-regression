@learning @courses
  #@learningTestRailTags
  #C1027 C1028
  #@learningTestRailTags

  Feature: Course Activity Scorm Package and Quiz Manipulation

    @smoke_learning6 @learning_low_risk @add_edit_scorm_package @C1027
    Scenario: As a company admin, i want to be able to add/edit a scorm package and make necessary changes
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      Then  I Should Be Able To Add A New SCORM Package Activity
      Then  I Should Edit The Scorm Section Name And Description


    @smoke_learning6 @learning_low_risk @course_enrolment_lock_course_enrolment_edit_scorm @C1028
    Scenario Outline: User can edit the scorm activity regardless of course lock config or user enrolled in the course
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      Then  I Should Be Able To Add A SCORM Package Activity
      Given The "ELMO Admin" Configure The "Lock course with enrolments" To <course_lock>
      But   I Have Logged In As A Company Admin
      When  I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      And   I Search For Created Course In The Scenario
      And   I Change The Created Course Enrolment With Employee Being <user_enrolled>
      And   I Go To The Sections Of The Created Course
      Then  I Should Edit The Scorm Section Name And Description

      Examples:
        | course_lock | user_enrolled |
        |    Yes      | Enrolled      |
        |    Yes      | NonEnrolled   |
        |    No       | Enrolled      |
        |    No       | Enrolled      |


    @smoke_learning6 @learning_low_risk @quiz_activity_edit @C247
    Scenario: As A Company Admin, I Want To Be Able To Add/edit A Quiz And Make Necessary Changes
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      And  I Should Be Able To Add A Quiz Activity
      And  I Go To The Page Which Has The List Of Current Editing Item
      Then  I Should Edit The Quiz activity


    @smoke_learning6 @learning_low_risk @quiz_activity_setting
    Scenario: Verify Default Settings Of Quiz Activity And Change Activity Settings
    Default settings for Settings is "Completion Terminology: Pass/Fail", "Show Feedback: Yes", "Marker: Manager"
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      And   I Should Be Able To Add A Quiz Activity
      And   I Verify That Default Settings For Quiz Is Correct
      Then  I Should Change Quiz Settings


    @learning_low_risk @course_enrolment_lock_course_enrolment_edit_quiz
    Scenario Outline: Ability To Edit Quiz Activity As Per Enrolment And System Configuration
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      Then  I Should Be Able To Add A Quiz Activity
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
        | course_lock | user_enrolled | settings |
        |    Yes      | Enrolled      | Disabled |
        |    Yes      | NonEnrolled   | Enabled  |
        |    No       | Enrolled      | Enabled  |
        |    No       | Enrolled      | Enabled  |


    @smoke_learning @learning_low_risk @course_face_to_face_session_management @C1829
    Scenario: As An Administrator I Want To Manage Face 2 Face Course Activity Sessions Such As Create Copy Edit Cancel Delete
      Given A Company Admin Creates A New Course With Unique Name
      Then  I Should Be Able To Add A Face-to-Face Activity
      And   I Open The Activity Named Test Face-to-Face On Sections List Page After Editing
#   COMMENT in the following step the function 'AddSessionTimings()' of saves session time to test data for validation
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity
      When  I Go To The Page Which Has The List Of Current Editing Item
#   COMMENT the following step can verify web table detail pre-defined in test data as Hash value
      Then  I Should Be Able To Verify The Session Details As Per Created
      When  I Should Be Able To Copy A Session In The Face-to-Face Activity
      And   I Go To The Page Which Has The List Of Current Editing Item
      Then  I Should Be Able To Verify The Session Details As Per Copied
      And   I Should Be Able To Edit A Session In The Face-to-Face Activity
      And   I Go To The Page Which Has The List Of Current Editing Item
      And   I Should Be Able To Cancel A Session In The Face-to-Face Activity
      And   I Should Be Able To Delete A Session In The Face-to-Face Activity


    @smoke_learning @learning_low_risk @face_to_face_session_notifications @C745
      Scenario: As An Administrator I Want To Manage Face 2 Face Activity Session Notifications Such As Create Edit Delete
      Given A Company Admin Creates A New Course With Unique Name
      Then  I Should Be Able To Add A Face-to-Face Activity
      When  I Open The Activity Named Test Face-to-Face On Sections List Page After Editing
      Then  I Should Be Able To Create Face To Face Notification With Name Course Face-to-Face Confirmation
      And   I Should Be Able To Edit face to face notification with name Course Face-to-Face Confirmation
      And   I should be able to Delete face to face notification with name Course Face-to-Face Confirmation