@learning @courses
  #@learningTestRailTags
  #C238	C239	C792	C240	C241	C242	C244	C245	C247	C248	C243	C246	C744
  #C1827	C1817	C1818	C745	C746	C1027	C1028	C1633	C818	C1786	C1640
  #@learningTestRailTags

  Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @xxx430 @learning_high_risk
  Scenario: [Learning]Create A New Course With Quiz Activity
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Setup A Course To Edit The Section
    And   I Try To Setup A Quiz Activity Under The Section
    Then  I Should be Able To Successfully Setup The Quiz Activity

    @course_add @learning_high_risk
    Scenario: [Learning]Learning Admin Creating New Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Click On The New Course Button
      And   I Add New Course Details
      Then  I Should Be Able To Create A New Course

    @course_search @learning_low_risk
    Scenario: [Learning]Learning Admin Searching New Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Search For A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Edit The Specific Course

    @course_delete @learning_low_risk
    Scenario: [Learning]Learning Admin Deleting New Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Search For A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Delete The Specific Course

    @activity_ack_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New Acknowledgement Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New Acknowledgement Activity

    @activity_survey_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New ELMO Survey Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New ELMO Survey Activity

    @activity_f2f_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New Face-to-Face Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New Face-to-Face Activity

    @activity_quiz_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New Quiz Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New Quiz Activity

    @activity_file_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New File Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New File Activity

    @activity_label_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New Label Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New Label Activity

    @activity_page_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New Page Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New Page Activity

    @activity_post_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New Post Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New Post Activity

    @activity_survey2_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin creating New Post Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A New ELMO Survey (new) Activity

    @activity_delete @learning_low_risk
    Scenario: [Learning]Learning Admin Deleting A Section In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Delete A Specific Section

    @course_notifications_add @activity_add @learning_low_risk
    Scenario: [Learning]Learning Admin Adding Notification Templates in Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add All Notifications

    @activity_f2f_session_add @activity_add @learning_high_risk
    Scenario: [Learning]Learning Admin Creating New Session In A Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Face-to-Face Activity Named Test Face-to-Face
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity

    @activity_f2f_session_notifications_add @activity_add @learning_low_risk
    Scenario: [Learning]Learning Admin Adding Notification Templates in Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Face-to-Face Activity Named Test Face-to-Face
      Then  I Should Be Able To Add All Notifications


    @retrain_discrepancy_fix @learning_low_risk
    Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I Search For A Specific Course Named Fraud & Corruption
      Then  I Should Be Able To Fix Retrain Of The Specific Course

    @retrain_discrepancy_disable @learning_low_risk
    Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Disable Retrain
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I Search For A Specific Course Named Fraud & Corruption
      Then  I Should Be Able To Disable Retrain Of The Specific Course

    @retrain_discrepancy_filter_create @learning_low_risk
    Scenario: [Learning]Learning Admin using a Filter to apply on Retrain Discrepancies Page Results
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I Click On "Create Filter" Button
      And   I select Employee Name as Test1 Omar1
      Then  I Should Be Able to Create a Filter
      And   See a Filtered List of Retrain Discrepancy Course Results for Learner Test1 Omar1

    @activity_f2f_session_list_sort @learning_low_risk @C6082
    Scenario: [Learning]When viewing face-to-face session list, can sort by ascending/descending for all field headers
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Face-to-Face Activity Named Test Face-to-Face
      Then  I Should Be Able To View The Face-To-Face Activity Session List
      And   I Should Be Able to Sort The The Face-To-Face Activity Session List By Location