@activities @learning @courses

Feature: As An Admin I Would Like to Manage Course Activities Which can Further Be Used To Create Recordable And Non Recordable Activities


  @smoke_learning @learning_high_risk @course_activity_add @course_activity_ack_add
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A Acknowledgement Activity


  @learning_high_risk @course_activity_add @course_activity_elmomodule_add @C1633
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A ELMO Module Activity


  @learning_high_risk @course_activity_add @course_activity_elmosurvey_add
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A ELMO Survey Activity


  @smoke_learning @learning_high_risk @course_activity_add @course_activity_f2f_add
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A Face-to-Face Activity


  @smoke_learning @learning_high_risk @course_activity_add @course_activity_quiz_add
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A Quiz Activity


  @smoke_learning @learning_high_risk @course_activity_add @course_activity_file_add @C12720
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A File Activity


  @learning_high_risk @course_activity_add @course_activity_label_add @C12720
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A Label Activity


  @learning_high_risk @course_activity_add @course_activity_page_add @C12720
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A Page Activity


  @learning_high_risk @course_activity_add @course_activity_post_add @C12720
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A Post Activity


  # Survey currently works on faraz1 only
  @learning_high_risk @course_activity_add @course_activity_survey2_add
  Scenario: [Learning]Learning Admin creating New Activities In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Add A ELMO Survey (new) Activity


  @learning_low_risk @course_activity_edit
  Scenario: [Learning]Learning Admin Editing A Section In A Course
    Given The Lock Course With Enrolments Is Configured To No
    And   I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Edit A ELMO Module Activity Named Test ELMO Module Activity - Please DO NOT DELETE


  @learning_high_risk @course_activity_edit_validation @lock_course_enrolment
  Scenario: [Learning]Learning Admin Can Edit Only The Session Details In A Face-to-Face Activity
    Given The Lock Course With Enrolments Is Configured To No
    And   Courses Have User Enrolments
    And   I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Search For A Course With Active User Enrolments
    And   I Edit The Course
    Then  I Should Not Be Able To Delete Any Course Related Activities
    And   I Should Not Be Able To Add New Sections
    And   I Should Be Able To Only Add Non-Recordable Activities
    And   I Should Be Able To Only Edit Existing Activities For The Course


  @learning_low_risk @course_activity_survey_edit
  Scenario: [Learning]Learning Admin Can Edit An ELMO Survey Activity In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Edit A ELMO Survey Activity Named Test ELMO Survey Activity - Please DO NOT DELETE
    And   I Set Compulsory Settings To Enabled


  @learning_low_risk @course_activity_delete @course_activity_survey_delete
  Scenario: [Learning]Learning Admin Can Delete An ELMO Survey Activity In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Delete A Specific ELMO Survey Activity Named Test ELMO Survey Activity - Please DO NOT DELETE


  @learning_low_risk @course_activity_section_delete
  Scenario: [Learning]Learning Admin Deleting A Section In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Should Be Able To Delete A Specific Section


  @learning_high_risk @course_activity_add
  Scenario: [Learning]Learning Admin Creating New Session In A Face-to-Face Activity
    Given The Lock course with enrolments Is Configured To Yes
    And   I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    And   I Open A Specific Activity Named Test Face-to-Face
    Then  I Should Be Able To Create A Session In The Face-to-Face Activity


  @learning_high_risk @course_activity_f2f_session_edit
  Scenario: [Learning]Learning Admin Can Edit A Session In A Face-to-Face Activity
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    And   I Open A Specific Activity Named Test Face-to-Face
    Then  I Should Be Able To Edit A Session In The Face-to-Face Activity


  @learning_high_risk @course_activity_f2f_session_delete
  Scenario: [Learning]Learning Admin Can Delete A Session In A Face-to-Face Activity
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    And   I Open A Specific Activity Named Test Face-to-Face
    Then  I Should Be Able To Delete A Session In The Face-to-Face Activity


  @learning_low_risk @course_activity_f2f_delete
  Scenario: [Learning]Learning Admin Deleting A Section In A Course
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    Then  I Delete A Specific Face-to-Face Activity Named Test Face-to-Face Activity - Please DO NOT DELETE


  @learning_low_risk @course_activity_f2f_session_notifications_add
  Scenario: [Learning]Learning Admin Adding Notification Templates in Face-to-Face Activity
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    And   I Open A Specific Activity Named Test Face-to-Face
    Then  I Should Be Able To Add All Notifications


  @learning_low_risk @course_activity_f2f_session_list_sort @C6082
  Scenario: [Learning]When viewing face-to-face session list, can sort by ascending/descending for all field headers
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To Courses under Learning section
    When  I Edit A Specific Course Named DO NOT DELETE
    And   I Open A Specific Activity Named Test Face-to-Face
    Then  I Should Be Able To View The Face-To-Face Activity Session List
    And   I Should Be Able to Sort The The Face-To-Face Activity Session List By Location




