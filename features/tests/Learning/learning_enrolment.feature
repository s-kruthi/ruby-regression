@learning @course_enrolment
  #@learningTestRailTags
  #C7952
  #@learningTestRailTags

Feature: As An User I Would Like To Manage My Enrolments To Courses

  @learning_low_risk @course_self_enrolment @C7952
  Scenario: [Learning]User Can Self Enrol To A Course
    Given I Have Logged In as a Company Employee
    And   I Go To The Menu Learning Section
    And   I Click On "Course Catalogue" Tab
    When  I Click On The Enrol Button For A Course
    Then  I Should See The Success Message For The Enrolment
    And   I Should See That I Am Enrolled To The Course


  @learning_low_risk @course_self_unenroll
  Scenario: [Learning]User Can Self-Unenroll To A Course
    Given A Course Has Self-Unenroll Set To Yes
    And   The User Has Enrolled To The Course
    And   I Have Logged In as a Company Employee
    And   I Go To The Menu Learning Section
    And   I Click On "Course Catalogue" Tab
    And   I Search For The Course Which Has Self-Unenroll Enabled
    When  I Click On The Enrolled Button For The Course
    And   I Click On The Unenrol Button In The Course
    Then  I Should See The Success Message For the Unenrollment
    And   I Should See That I Am Unenrolled To The Course

