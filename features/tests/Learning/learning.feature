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


    @course_notifications_add @course_activity_add @learning_low_risk
    Scenario: [Learning]Learning Admin Adding Notification Templates in Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add All Notifications


    @course_retrain_discrepancy_fix @learning_low_risk
    Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I See a List of Discrepency Courses
      Then  I Should Be Able To Fix Retrain Of A Specific Course


    @course_retrain_discrepancy_disable @learning_low_risk
    Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Disable Retrain
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I See a List of Discrepency Courses
      Then  I Should Be Able To Disable Retrain Of A Specific Course


    @course_retrain_discrepancy_filter_create @learning_low_risk
    Scenario: [Learning]Learning Admin using a Filter to apply on Retrain Discrepancies Page Results
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Retrain Discrepancies under Learning section
      When  I Click On "Create Filter" Button
      And   I select Employee Name as Test1 Omar1
      Then  I Should Be Able to Create a Filter
      And   See a Filtered List of Retrain Discrepancy Course Results for Learner Test1 Omar1