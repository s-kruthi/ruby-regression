@Notifications_learning @learning
#@learningTestRailTags
#C12706 C12257 C12258
#@learningTestRailTags
Feature:
  As a user I want to test combinations of Learning Course Activity notifications to test if they were triggered successfully

  @course_assignments  @learning_high_risk @C12706
  Scenario: [Learning]User Enrols For A Particular Course Which triggers Notification to Both The User And His Manager(auto approval)
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Specific Course Named course_section_automation_QuizActivity_shanku
    And   I Re Enrol The Candidate For The Activity
    Then  The User Should Be Instantly Notified About The New Enrolment


  @course_assignments_approval  @learning_high_risk   @C12257 @C12258
  Scenario: [Learning]User Enrols For A Particular Course Which triggers Notification to Both The User And His Manager(approval required)
    Given I Have Logged In as a Specific Automation User
    And   I Go To The Menu Learning Section
    And   I Have Enrolled For An Assigned quiz Course course_section_automation_QuizActivity_shanku(Approval)
    Then  The Approver Should Be Instantly Notified About The New Enrolment Request
    When  I Have Logged In as a Specific Automation User Manager
    And   I Go To The Menu Learning Section
    And   I Approve The Course Enrolment Request
    Then  The User Should Be Instantly Notified About The New Enrolment Request
