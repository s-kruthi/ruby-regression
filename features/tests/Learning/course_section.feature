@learning @Courses
  #@learningTestRailTags
  #C807 C803
  #@learningTestRailTags

Feature: As An Admin I Would Like To View user Enrollment and Refresh The course If Required

  @course_assignments  @learning_high_risk @C807
  Scenario: View Enrolments For A Particular Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Specific Course Named course_section_automation_shanku
    Then  I Can View The Enrolled Users For That Particular Course

  @DeleteAfterFix @f2f_course_refresh @learning_high_risk @C803
  Scenario: Refresh Enrolments For Face to Face Course activity And Verify The Course Status
    Given I Have Logged In as a Specific Automation User
    And   I Go To The Menu Learning Section
    And   I Have Interacted With An Assigned Course course_section_automation_f2f_shanku
    When  I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I Search For A Specific Course Named course_section_automation_f2f_shanku
    And   I Try To Refresh The Enrolments For That Particular Course
    Then  I Should See The Course course_section_automation_f2f_shanku Status Reset To Not Yet Started
    And   I Withdraw The Candidate From Session