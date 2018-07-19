@Notifications_learning @learning
#@learningTestRailTags
#C12706 C12257 C12258
#@learningTestRailTags
Feature:
  As a user I want to test combinations of Learning Course Activity notifications to test if they were triggered successfully
  @smoke_learning9 @generate_data @wip
  Scenario: generate test data For learning
    Given I Want To Generate Learning Notification data On Any Staging


  @smoke_learning9 @course_assignments  @learning_high_risk @NotificationsLearning @C12706
  Scenario: [Learning]User Enrols For A Particular Course Which triggers Notification to Both The User And His Manager(auto approval)
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Specific Course Named course_section_automation_QuizActivity_shanku
    And   I Re Enrol The Candidate For The Activity
    Then  The User Should Be Instantly Notified About The New Enrolment


  @smoke_learning9 @course_assignments_approval  @learning_high_risk @NotificationsLearning  @C12257 @C12258
  Scenario: [Learning]User Enrols For A Particular Course Which triggers Notification to Both The User And His Manager(approval required)
    Given I Have Logged In as a Specific Automation User
    And   I Go To The Menu Learning Section
    And   I Have Enrolled For An Assigned quiz Course course_section_automation_QuizActivity_shanku(Approval)
    Then  The Approver Should Be Instantly Notified About The New Enrolment Request
    When  I Have Logged In as a Specific Automation User Manager
    And   I Go To The Menu Learning Section
    And   I Approve The Course Enrolment Request
    Then  The User Should Be Instantly Notified About The New Enrolment Request


  @smoke_learning9 @course_assignments_via_rules @learning_high_risk @NotificationsLearning @C1010
  Scenario: [Learning] Verify that user who is assigned a course via assignment rule receives "New Enrolment" notification
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Assignment Rules under General section
    And   I Search For A Specific Assignment Rule Named notification_course_assignment
    When  I Reset The Assignment Rule
    Then  The User Should Be Instantly Notified About The New Course Enrolment


  @smoke_learning9 @course_notification_verify @learning_high_risk
  Scenario: [Learning] Verify That User Receives Notification When Enrolling Into A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To The Menu Learning Section
    And   I Click On "Course Catalogue" Tab
    When  I Search For A Specific Course With Enrolments Named DO NOT DELETE
    And   I Click On "Enrol" Button
    Then  I Should Receive A Notification With Trigger Named Learning.CourseNewEnrolmentTrigger For Recipient company.omar


  @smoke_learning9 @course_bulk_enrolment_notification  @learning_high_risk @C1640
  Scenario: [Learning] Bulk Enrol Users Into A Particular Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I Create A Random Course For Automation
    When  I Search For The Randomly Created Course
    Then  I Should Be Able To Bulk Enrol Users To That Course
    And   All Bulk Enrolled Users Should Be Instantly Notified About The New Course Enrolment