@learning @courses
  #@learningTestRailTags
  #C238	C239	C792	C240	C241	C242	C244	C245	C247	C248	C243	C246	C744
  #C1827	C1817	C1818	C745	C746	C1027	C1028	C1633	C818	C1786	C1640
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities


  @smoke_learning1 @learning_high_risk @course_add @C238
  Scenario: [Learning]Learning Admin Creating New Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On The New Course Button
    And   I Add New Course Details
    Then  I Should Be Able To Create A New Course


  @smoke_learning1 @learning_low_risk @course_search @C792
  Scenario: [Learning]Learning Admin Searching New Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Edit The Specific Course


  @smoke_learning1 @learning_low_risk @course_copy
  Scenario: [Learning]Learning Admin Deleting New Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Copy The Specific Course


  @smoke_learning1 @learning_low_risk @course_delete @C6091
  Scenario: [Learning]Learning Admin Deleting New Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Specific Course With No Enrolments Named DO NOT DELETE
    Then  I Should Be Able To Delete The Specific Course


  @smoke_learning1 @learning_low_risk @course_notifications_add
  Scenario: [Learning]Learning Admin Adding Notification Templates in Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add All Notifications


  @smoke_learning1 @learning_low_risk @course_view_enrolments
  Scenario: [Learning]Learning Admin Can View Course Enrolments
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    Then  I Should Be Able To View All The Course Enrolments


  @smoke_learning1 @learning_low_risk @course_disable_retrain_enrolment
  Scenario: [Learning]Learning Admin Can Disable Retrain For Enrolments
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    And   I Filter For Enrolments With Status Of Recompletion Required
    And   I Choose To Disable Retrain For The Enrolment
    Then  I Should Be Able To See The Retrain Disabled For The Enrolment


  @smoke_learning1 @learning_low_risk @course_enable_retrain_enrolment
  Scenario: [Learning]Learning Admin Can Disable Retrain For Enrolments
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    And   I Filter For Enrolments With Status Of Completed
    And   I Choose To Enable Retrain For The Enrolment
    Then  I Should Be Able To See The Retrain Enabled For The Enrolment


  @smoke_learning2 @learning_low_risk @course_edit_enrolment_start_end_date @C800 @C801 @PMS-14875
  Scenario: [Learning]Learning Admin Can Edit Enrolments With Due Date
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
   # And   I Filter For Enrolments With Status Of Not Yet Started
    And   I Filter For Enrolments With Status Of In Progress
    And   I Choose To Edit An Enrolment
    And   I Edit The Enrolment Start Date To Be "Today's Date"
    And   I Edit The Enrolment Due Date To Be "A Month From Today"
    And   I Save The Changes To The Enrolment
    Then  I Should See That The Changes Were Successfully Saved To The Enrolment


  @smoke_learning2 @learning_low_risk @course_edit_enrolment_start_date @C800 @C801 @PMS-14875
  Scenario: [Learning]Learning Admin Can Edit Enrolments Without Due Date
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    #And   I Filter For Enrolments With Status Of Not Yet Started
    And   I Filter For Enrolments With Status Of In Progress
    And   I Choose To Edit An Enrolment
    And   I Edit The Enrolment Start Date To Be "Today's Date"
    And   I Edit The Enrolment Due Date To Be "N/A"
    And   I Save The Changes To The Enrolment
    Then  I Should See That The Changes Were Successfully Saved To The Enrolment


  @smoke_learning2 @learning_low_risk @course_delete_enrolment @C813
  Scenario: [Learning]Learning Admin Can Delete Enrolment
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    And   I Filter For Enrolments With Status Of Completed
    And   I Filter For Enrolments With Enrolment Method Of Manual
    #And   I Should Be Able To Only Refresh/Delete Enrolment
    And   I Choose To Delete An Enrolment
    Then  I Should See That The Enrolment Was Successfully Deleted


  @smoke_learning2 @learning_low_risk @course_bulkdelete_enrolment @C815
  Scenario: [Learning]Learning Admin Can Delete Enrolment In Bulk
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    And   I Filter For Enrolments With Status Of Completed
    And   I Select 3 Enrolments For Bulk Action
    And   I Choose To Delete Enrolment From The Actions Menu
    Then  I Should See That The Enrolment Was Successfully Deleted


  @smoke_learning2 @learning_low_risk @course_mark_enrolment_complete @C815
  Scenario: [Learning]Learning Admin Can Mark Enrolment As Complete
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    And   I Filter For Enrolments With Status Of In Progress
    And   I Choose To Mark An Enrolment As Complete
    Then  I Should See That The Enrolment Was Successfully Marked As Complete


  @smoke_learning2 @learning_low_risk @course_bulkmark_enrolment_complete
  Scenario: [Learning]Learning Admin Can Mark Enrolments In Bulk As Complete
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Click On "Enrolments" Tab
    And   I Filter For Enrolments With Status Of In Progress
    And   I Select 1 Enrolment For Bulk Action
    And   I Choose To Mark Enrolments As Complete From The Actions Menu
    Then  I Should See That The Enrolments Was Successfully Marked As Complete