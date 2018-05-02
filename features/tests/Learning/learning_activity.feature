@activities @learning @courses

  Feature: As An Admin I Would Like to Manage Course Activities Which can Further Be Used To Create Recordable And Non Recordable Activities


    @smoke_course_activity_add @learning_high_risk @smoke
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | Acknowledgement   |
        | Face-to-Face      |
        | Quiz              |
        | File              |


    @course_activity_ack_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
      | activity_type     |
      | Acknowledgement   |


    @course_activity_elmomodule_add @learning_high_risk @C1633
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | ELMO Module       |


    @course_activity_elmosurvey_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | ELMO Survey       |


    @course_activity_f2f_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | Face-to-Face      |


    @course_activity_quiz_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | Quiz              |


    @course_activity_file_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | File              |


    @course_activity_label_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | Label             |


    @course_activity_page_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | Page              |


    @course_activity_post_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        | Post              |


    @course_activity_survey2_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
        | activity_type     |
        # Survey currently works on faraz1 only
        | ELMO Survey (new) |


    @course_activity_delete @learning_low_risk
    Scenario: [Learning]Learning Admin Deleting A Section In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Delete A Specific Section


# TODO Redundant scenario can be removed
#    @course_activity_edit @learning_low_risk
#    Scenario: [Learning]Learning Admin Deleting A Section In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      And   I Edit A Specific Face-to-Face Activity Named Test Face-to-Face Activity - Please DO NOT DELETE
#      Then  I Should Be Able To Create A Session In The Face-to-Face Activity


    @course_activity_f2f_session_add @course_activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin Creating New Session In A Face-to-Face Activity
# TODO: Pending removal after review, since the facilitator and location settings are being checked in the step
#      Background:
#        Given I Have Logged In as a Learning Admin
#        And   I go to Admin Settings
#        And   I Go To Courses under Learning section
#        And   I Edit A Specific Course Named DO NOT DELETE
#        And   I Edit A Specific Face-to-Face Activity Named Test Face-to-Face Activity - Please DO NOT DELETE
#        When  I Set Location Settings To Enabled
#        And   I Set Facilitator Settings To Enabled
#        Then  I Should Be Able To Create A Session In The Face-to-Face Activity with the Specified Settings

      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity


    @course_activity_f2f_session_edit @learning_high_risk
    Scenario: [Learning]Learning Admin Can Edit A Session In A Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Edit A Session In The Face-to-Face Activity


    @course_activity_f2f_session_delete @learning_high_risk
    Scenario: [Learning]Learning Admin Can Edit A Session In A Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Delete A Session In The Face-to-Face Activity


    @course_f2factivity_delete @learning_low_risk
    Scenario: [Learning]Learning Admin Deleting A Section In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Delete A Specific Face-to-Face Activity Named Test Face-to-Face Activity - Please DO NOT DELETE

    # TODO Scenario can be modified to be Edit F2F activity?
    @course_activity_f2f_session_location_add @course_activity_f2f_session_facilitator_add @course_activity_f2f_session_config_add @learning_low_risk @C6067 @C6068
    Scenario: [Learning]Validation: When location/facilitator field has been enabled, allow sessions to be created with the location/facilitator field
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      And   I Edit A Specific Course Named DO NOT DELETE
      And   I Edit A Specific Face-to-Face Activity Named Test Face-to-Face Activity - Please DO NOT DELETE
      When  I Set Location Settings To Enabled
      And   I Set Facilitator Settings To Enabled
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity with the Specified Settings


    @course_activity_f2f_session_notifications_add @course_activity_add @learning_low_risk
    Scenario: [Learning]Learning Admin Adding Notification Templates in Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Add All Notifications


    @course_activity_f2f_session_list_sort @learning_low_risk @C6082
    Scenario: [Learning]When viewing face-to-face session list, can sort by ascending/descending for all field headers
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To View The Face-To-Face Activity Session List
      And   I Should Be Able to Sort The The Face-To-Face Activity Session List By Location


    @course_activity_edit @lock_course_enrolment @learning_high_risk
    Scenario: [Learning]Learning Admin Can Edit Only The Session Details In A Face-to-Face Activity
      Given The Lock Course With Enrolments Is Configured To Yes
      And   Courses Have User Enrolments
      And   I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Search For A Course With Active User Enrolments
      And   I Edit The Course
      Then  I Should Not Be Able To Delete Any Course Related Activities
      And   I Should Not Be Able To Add New Sections
      And   I Should Be Able To Only Add Non-Recordable Activities
      And   I Should Be Able To Only Edit Existing Activities For The Course


    @course_activity_edit @learning_low_risk
    Scenario: [Learning]Learning Admin Can Edit An ELMO Survey Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Edit A Specific ELMO Survey Activity Named Test ELMO Survey Activity - Please DO NOT DELETE
      And   I Set Compulsory Settings To Enabled


