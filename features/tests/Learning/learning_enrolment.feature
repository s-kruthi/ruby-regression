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


  @learning_low_risk @course_self_unenroll @C7952
  Scenario: [Learning]User Can Self-Unenroll From A Course
    Given I Have Logged In as a Company Employee
    And   The User Has Enrolled To A Course With Self-Unenroll Set To Yes
    And   I Go To The Menu Learning Section
    And   I Click On "Course Catalogue" Tab
    And   I Search For The Course I Have Enrolled To
    When  I Click On The Enrolled Button For The Course
    And   I Click On The Unenrol Button In The Course
    Then  I Should See The Success Message For the Unenrollment
    And   I Should See That I Am Unenrolled To The Course


  @learning_low_risk @course_no_unenroll @C7953
  Scenario: [Learning]User Cannot Self-Unenroll From A Course
    Given I Have Logged In as a Company Employee
    And   The User Has Enrolled To A Course With Self-Unenroll Set To No
    And   I Go To The Menu Learning Section
    And   I Click On "Course Catalogue" Tab
    When  I Search For The Course I Have Enrolled To
    And   I Click On The Enrolled Button For The Course
    Then  I Should See That I Cannot Unenroll From The Course


  @learning_low_risk @course_user_enrolments
  Scenario: [Learning]User Can View Enroled Courses And Details
    Given I Have Logged In as a Company Admin
    When  I Go To The Menu Learning Section
    Then  I Should See All The Courses I Am Enrolled To
    And   I Should See The Course Name On The Page
    And   I Should See The Course Category On The Page
    And   I Should See The Course Status On The Page
    And   I Should See The Course Due Date On The Page


  @course_manual_enrolment  @learning_low_risk  @C794
  Scenario: [Learning]Manually Enrol User To A Particular Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Specific Course Named course_section_automation_QuizActivity_shanku
    And   I Re Enrol The Candidate For The Activity


  @course_bulk_enrolment  @learning_high_risk  @C795
  Scenario: [Learning]Manually Bulk Enrol Users Into A Particular Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    And   I Create A Random Course For Automation
    When  I Search For The Randomly Created Course
    Then  I Should Be Able To Bulk Enrol Users To That Course