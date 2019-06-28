@learning @∑∑
  #@learningTestRailTags
  #C238	C239	C792	C240	C241	C242	C244	C245	C247	C248	C243	C246	C744
  #C1827	C1817	C1818	C745	C746	C1027	C1028	C1633	C818	C1786	C1640
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @smoke_learning1 @learning_high_risk @course_add @C238
  Scenario: [Learning]Learning Admin Creating New Course
    Given I Have Logged In As A Learning Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Click On The New Course Button
    And   I Add New Course Details
    Then  I Should Be Able To Create A New Course

  @smoke_learning1 @learning_low_risk @course_search @C792
  Scenario: [Learning]Learning Admin Searching New Course
    Given I Have Logged In As A Learning Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Search For A Specific Course Named "DO NOT DELETE"
    Then  I Should Be Able To Edit The Specific Course

  @smoke_learning1 @learning_low_risk @course_copy
  Scenario: [Learning]Learning Admin Deleting New Course
    Given I Have Logged In As A Learning Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Search For A Specific Course Named "DO NOT DELETE"
    Then  I Should Be Able To Copy The Specific Course

  @smoke_learning1 @learning_low_risk @course_delete @C6091
  Scenario: [Learning]Learning Admin Deleting New Course
    Given I Have Logged In As A Learning Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Search For A Specific Course With "No Enrolments" Named "DO NOT DELETE"
    Then  I Should Be Able To Delete The Specific Course

  @learning_low_risk @course_notifications_add
  Scenario: [Learning]Learning Admin Adding Notification Templates in Course
    Given I Have Logged In As A Learning Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Edit A Specific Course Named "DO NOT DELETE"
    Then  I Should Be Able To Add All Notifications