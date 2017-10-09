@learning @courses

  Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @xxx430 @learning_high_risk
  Scenario: Create A New Course With Quiz Activity
    Given I Have Logged In as a Learning Admin to shayan01 site
    And   I go to Admin Settings
    And   I Go To The Courses under Learning section
    When  I Setup A Course To Edit The Section
    And   I Try To Setup A Quiz Activity Under The Section
    Then  I Should be Able To Successfully Setup The Quiz Activity

    @course_add @learning_high_risk
    Scenario: Learning Admin Creating New Course
      Given I Have Logged In as a Learning Admin to shayan01 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Click On The New Course Button
      And   I Add New Course Details
      Then  I Should Be Able To Create A New Course

    @course_search @learning_low_risk
    Scenario: Learning Admin Searching New Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Search For A Specific Course
      Then  I Should Be Able To Edit The Specific Course

    @course_delete @learning_low_risk
    Scenario: Learning Admin Deleting New Course
      Given I Have Logged In as a Learning Admin to chao site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Search For A Specific Course
      Then  I Should Be Able To Delete The Specific Course

    @activity_ack_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New Acknowledgement Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Acknowledgement Activity

    @activity_survey_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New ELMO Survey Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New ELMO Survey Activity

    @activity_f2f_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New Face-to-Face Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Face-to-Face Activity

    @activity_quiz_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New Quiz Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Quiz Activity

    @activity_file_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New File Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New File Activity

    @activity_label_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New Label Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Label Activity

    @activity_page_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New Page Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Page Activity

    @activity_post_add @activity_add @learning_high_risk
    Scenario: Learning Admin creating New Post Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Post Activity

    @activity_delete @learning_low_risk
    Scenario: Learning Admin Deleting A Section In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Delete A Specific Section

    @course_notifications @activity_add @learning_low_risk
    Scenario: Learning Admin Adding Notification Templates in Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add All Notifications

    @activity_f2f_session_add @activity_add @learning_high_risk
    Scenario: Learning Admin Creating New Session In A Face-to-Face Activity
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      And   I Open A Specific Face-to-Face Activity
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity

    @f2f_session_notifications @activity_add @learning_low_risk
    Scenario: Learning Admin Adding Notification Templates in Face-to-Face Activity
      Given I Have Logged In as a Learning Admin to chao site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      And   I Open A Specific Face-to-Face Activity
      Then  I Should Be Able To Add All Notifications


    @retrain_discrepancy_fix @learning_low_risk
    Scenario: Learning Admin Using Retrain Discrepancies Page to Fix
      Given I Have Logged In as a Learning Admin to shayan01 site
      And   I go to Admin Settings
      And   I Go To The Courses under Learning section
      When  I Edit A Specific Course
      And   I Open A Specific Face-to-Face Activity
      Then  I Should Be Able To Add All Notifications

    @wip @learning_low_risk
    Scenario: Learning Admin Using Retrain Discrepancies Page to Skip
      Given I Have Logged In as a Learning Admin to shayan01 site
      And   I go to Admin Settings
      And   I Go To The Courses Under Learning Section
      When  I Edit A Specific Course
      And   I Open A Specific Face-to-Face Activity
      Then  I Should Be Able To Add All Notifications