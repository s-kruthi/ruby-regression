@learning @courses
  #@learningTestRailTags
  #C238	C239	C792	C240	C241	C242	C244	C245	C247	C248	C243	C246	C744
  #C1827	C1817	C1818	C745	C746	C1027	C1028	C1633	C818	C1786	C1640
  #@learningTestRailTags

  Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

    @course_add @learning_high_risk @C238
    Scenario: [Learning]Learning Admin Creating New Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Click On The New Course Button
      And   I Add New Course Details
      Then  I Should Be Able To Create A New Course

    @course_search @learning_low_risk @C792
    Scenario: [Learning]Learning Admin Searching New Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Search For A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Edit The Specific Course

    @course_delete @learning_low_risk @C6091
    Scenario: [Learning]Learning Admin Deleting New Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Search For A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Delete The Specific Course

    @course_activity_add @learning_high_risk
    Scenario Outline: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New <activity_type> Activity

      Examples:
      | activity_type     |
      | Acknowledgement   |
      | ELMO Survey       |
      | Face-to-Face      |
      | Quiz              |
      | File              |
      | Label             |
      | Page              |
      | Post              |
      #Survey currently works on faraz1 only
     # | ELMO Survey (new) |

#   TODO: Pending review and removal as it’s now redundant
#    @course_activity_ack_add @course_activity_add @learning_high_risk @C243
#    Scenario: [Learning]Learning Admin creating New Acknowledgement Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New Acknowledgement Activity
#
#    @course_activity_survey_add @course_activity_add @learning_high_risk @C244
#    Scenario: [Learning]Learning Admin creating New ELMO Survey Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New ELMO Survey Activity
#
#    @course_activity_f2f_add @course_activity_add @learning_high_risk @C246
#    Scenario: [Learning]Learning Admin creating New Face-to-Face Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New Face-to-Face Activity


#    @xxx430 @learning_high_risk
#    Scenario: [Learning]Create A New Course With Quiz Activity
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Setup A Course To Edit The Section
#      And   I Try To Setup A Quiz Activity Under The Section
#      Then  I Should be Able To Successfully Setup The Quiz Activity
#
#    @course_activity_quiz_add @course_activity_add @learning_high_risk @C247
#    Scenario: [Learning]Learning Admin creating New Quiz Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New Quiz Activity
#
#    @course_activity_file_add @course_activity_add @learning_high_risk @C12720
#    Scenario: [Learning]Learning Admin creating New File Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New File Activity
#
#    @course_activity_label_add @course_activity_add @learning_high_risk
#    Scenario: [Learning]Learning Admin creating New Label Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New Label Activity
#
#    @course_activity_page_add @course_activity_add @learning_high_risk
#    Scenario: [Learning]Learning Admin creating New Page Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New Page Activity
#
#    @course_activity_post_add @course_activity_add @learning_high_risk
#    Scenario: [Learning]Learning Admin creating New Post Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New Post Activity
#
#    @course_activity_survey2_add @course_activity_add @learning_high_risk
#    Scenario: [Learning]Learning Admin creating New Post Activity In A Course
#      Given I Have Logged In as a Learning Admin
#      And   I go to Admin Settings
#      And   I Go To Courses under Learning section
#      When  I Edit A Specific Course Named DO NOT DELETE
#      Then  I Should Be Able To Add A New ELMO Survey (new) Activity

    @course_activity_delete @learning_low_risk
    Scenario: [Learning]Learning Admin Deleting A Section In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Delete A Specific Section

    @course_notifications_add @course_activity_add @learning_low_risk
    Scenario: [Learning]Learning Admin Adding Notification Templates in Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add All Notifications

    @course_activity_f2f_session_add @course_activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin Creating New Session In A Face-to-Face Activity
      Background:
        Given I Have Logged In as a Learning Admin
        And   I go to Admin Settings
        And   I Go To Courses under Learning section
        And   I Edit A Specific Course Named DO NOT DELETE
        And   I Edit A Specific Face-to-Face Activity Named Test Face-to-Face Activity - Please DO NOT DELETE
        When  I Set Location Settings To Enabled
        And   I Set Facilitator Settings To Enabled
        Then  I Should Be Able To Create A Session In The Face-to-Face Activity with the Specified Settings

      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Face-to-Face Activity Named Test Face-to-Face
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity

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
      And   I Open A Specific Face-to-Face Activity Named Test Face-to-Face
      Then  I Should Be Able To Add All Notifications

    @course_activity_f2f_session_list_sort @learning_low_risk @C6082
    Scenario: [Learning]When viewing face-to-face session list, can sort by ascending/descending for all field headers
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Face-to-Face Activity Named Test Face-to-Face
      Then  I Should Be Able To View The Face-To-Face Activity Session List
      And   I Should Be Able to Sort The The Face-To-Face Activity Session List By Location

    @course_retrain_discrepancy_fix @learning_low_risk
    Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I Search For A Specific Course Named Leadership Training - Development
      Then  I Should Be Able To Fix Retrain Of The Specific Course

    @course_retrain_discrepancy_disable @learning_low_risk
    Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Disable Retrain
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I Search For A Specific Course Named Leadership Training - Intermediate
      Then  I Should Be Able To Disable Retrain Of The Specific Course

    @course_retrain_discrepancy_filter_create @learning_low_risk
    Scenario: [Learning]Learning Admin using a Filter to apply on Retrain Discrepancies Page Results
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I Click On "Create Filter" Button
      And   I select Employee Name as Test1 Omar1
      Then  I Should Be Able to Create a Filter
      And   See a Filtered List of Retrain Discrepancy Course Results for Learner Test1 Omar1
