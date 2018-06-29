@learning @course_enrolment
  #@learningTestRailTags
  #C7952
  #@learningTestRailTags

Feature: As An User I Would Like To Manage My Enrolments To Courses

  @learning_low_risk @course_self_enrolment @C7952
  Scenario: [Learning]Learning Admin Creating New Course
    Given I Have Logged In as a Company Employee
    And   I Go To The Menu Learning Section
    And   I Click On "Course Catalogue" Tab
    When  I Click On The Enrol Button For A Course
    Then  I Should See The Success Message For The Enrolment
    And   I Should See That I Am Enrolled To The Course

