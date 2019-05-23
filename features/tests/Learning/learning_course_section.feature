@learning @Courses
  #@learningTestRailTags
  #C807 C803 C9222 C9234
  #@learningTestRailTags

Feature: As An Admin I Would Like To View user Enrollment and Refresh The course If Required

  @smoke_learning6 @course_assignments  @learning_high_risk @C807
  Scenario: [Learning]View Enrolments For A Particular Course
    Given I Have Logged In As A Automation Company Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    When  I Search For A Specific Course Named "course_section_automation_QuizActivity_shanku"
    Then  I Can View The Enrolled Users For That Particular Course

  @smoke_learning6 @DeleteLastStpAfterFix @f2f_course_refresh @learning_high_risk @C803
  Scenario: [Learning]Refresh Enrolments For Face to Face Course activity And Verify The Course Status
    Given I Have Logged In As A Specific Automation User
    And   I Go To The "Menu Learning" Section
    And   I Have Interacted With An Assigned F2F Course course_section_automation_f2f_shanku
    When  I Have Logged In As A Automation Company Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    And   I Search For A Specific Course Named "course_section_automation_f2f_shanku"
    And   I Try To Refresh The Enrolments For That Particular Course
    Then  I Should See The Course course_section_automation_f2f_shanku Status Reset To Not Yet Started
    #And   I Withdraw The Candidate From Session

  @smoke_learning6 @HappyPath @quiz_course_refresh @learning_high_risk @C9222
  Scenario: [Learning]ReEnrolling The Candidates For Quiz activity Post Refresh Enrolments Resets The Status And Opens The Activity
    Given I Have Logged In As A Specific Automation User
    And   I Go To The "Menu Learning" Section
    And   I Have Interacted With An Assigned quiz Course course_section_automation_QuizActivity_shanku
    And   I Validate the Status As In Progress
    When  I Have Logged In As A Automation Company Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    And   I Search For A Specific Course Named "course_section_automation_QuizActivity_shanku"
    And   I Try To Refresh The Enrolments For That Particular Course
    Then  I Should See The Course course_section_automation_QuizActivity_shanku Status Reset To Not Yet Started
    And   I Re Enrol The Candidate For The Activity

   @ShouldFailUntilFixed @quiz_course_reset_refresh @learning_high_risk @C9234
  Scenario: [Learning] Just Refreshing Enrolments For Quiz Activity Resets The Status And Opens The Activity
    Given I Have Logged In As A Specific Automation User
    And   I Go To The "Menu Learning" Section
    #should fail on the next step, quiz refresh reset bug fix will fix this scenario
    And   I Have Interacted With An Assigned quiz Course course_section_automation_QuizActivity_(FAIL)
    And   I Validate the Status As In Progress
    When  I Have Logged In As A Automation Company Admin
    And   I Go To Admin Settings
    And   I Go To "Courses" Under "Learning" Section
    And   I Search For A Specific Course Named "course_section_automation_QuizActivity_(FAIL)"
    And   I Try To Refresh The Enrolments For That Particular Course
    Then  I Should See The Course course_section_automation_QuizActivity_(FAIL) Status Reset To Not Yet Started

  @smoke_learning7 @individual_course_activity_refresh @learning_high_risk @C812
    Scenario: [Learning] Just Refreshing Enrolments For Quiz Activity Resets The Status And Opens The Activity
    Given I Have Logged In As A Automation Company Admin
    And   I Go To Admin Settings
    And   I Go To "Enrolments" Under "Learning" Section
    And   I Create A Random Course For Automation With "Quiz" Activity
    And   I Search For The Randomly Created Course Under Enrolment
    And   I Choose To Mark An Enrolment As Complete
    Then  I Should See That The Enrolment Was Successfully Marked As Complete
    And   I Choose To Refresh The Enrolment For Completed Activity
    When  I Refresh The Enrolment For That Activity
    Then  I Should See The Activity Successfully Marked As Not Yet Started
    And   I Should See The Course Status Successfully Marked As In Progress

  @smoke_learning7 @bulk_course_activity_refresh @learning_high_risk @C816
  Scenario: [Learning] Just Refreshing Enrolments For Quiz Activity Resets The Status And Opens The Activity
    Given I Have Logged In As A Automation Company Admin
    And   I Go To Admin Settings
    And   I Go To "Enrolments" Under "Learning" Section
    And   I Create A Random Course For Automation With "All" Activity
    And   I Search For The Randomly Created Course Under Enrolment
    And   I Choose To Mark An Enrolment As Complete
    Then  I Should See That The Enrolment Was Successfully Marked As Complete
    When  I Choose To Refresh The Enrolment For Completed Activity
    And   I Refresh The Enrolment For All The Activities
    Then  I Should See The Course Status Successfully Marked As Not Yet Started