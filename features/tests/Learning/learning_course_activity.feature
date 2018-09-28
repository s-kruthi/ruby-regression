@learning @courses
  #@learningTestRailTags
  #C1027 C1028
  #@learningTestRailTags

    Feature: As An Admin I Would Like to Manage Course Activities Which can Further Be Used To Create Recordable And Non Recordable Activities


    @smoke_learning2 @learning_high_risk @course_activity_add @course_activity_ack_add
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A Acknowledgement Activity


    @smoke_learning2 @learning_high_risk @course_activity_add @course_activity_elmomodule_add @C1633
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A ELMO Module Activity


    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_elmosurvey_add @C244
    Scenario: [Learning]Learning Admin creating New ELMO Survey Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A ELMO Survey Activity


    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_f2f_add
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A Face-to-Face Activity


    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_quiz_add
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A Quiz Activity


    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_file_add @C12720
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A File Activity


    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_label_add @C12721
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A Label Activity


    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_page_add @C12720
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A Page Activity


    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_post_add @C16352
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A Post Activity


  # Survey currently works on faraz1 only
    @smoke_learning3 @learning_high_risk @course_activity_add @course_activity_survey2_add
    Scenario: [Learning]Learning Admin creating New Activities In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Add A ELMO Survey (new) Activity


    @smoke_learning4 @learning_low_risk @course_activity_edit
    Scenario: [Learning]Learning Admin Editing A Section In A Course
      Given The Lock Course With Enrolments Is Configured To No
      And   I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Edit A ELMO Module Activity Named Test ELMO Module Activity - Please DO NOT DELETE


    @smoke_learning4 @learning_high_risk @course_activity_edit_validation @lock_course_enrolment
    Scenario: [Learning]Learning Admin Can Edit Only The Session Details In A Face-to-Face Activity
      Given The Lock Course With Enrolments Is Configured To Yes
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


    @smoke_learning4 @learning_low_risk @course_activity_survey_edit @C15704
    Scenario: [Learning]Learning Admin Can Edit An ELMO Survey Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Edit A Specific ELMO Survey Activity Named Test ELMO Survey Activity - Please DO NOT DELETE
      And   I Set Compulsory Settings To Enabled


    @smoke_learning4 @learning_low_risk @course_activity_delete @course_activity_survey_delete @C15705
    Scenario: [Learning]Learning Admin Can Delete An ELMO Survey Activity In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE With No Enrolments
      Then  I Should Be Able To Delete A Specific ELMO Survey Activity Named Test ELMO Survey Activity - Please DO NOT DELETE


    @smoke_learning4 @learning_low_risk @course_activity_section_delete
    Scenario: [Learning]Learning Admin Deleting A Section In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      Then  I Should Be Able To Delete A Specific Section


    @smoke_learning4 @learning_high_risk @course_activity_add @course_activity_f2f_session_add @C744
    Scenario: [Learning]Learning Admin Creating New Session In A Face-to-Face Activity
      Given The Lock course with enrolments Is Configured To Yes
      And   I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity


    @smoke_learning4 @learning_high_risk @course_activity_f2f_session_edit
    Scenario: [Learning]Learning Admin Can Edit A Session In A Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Edit A Session In The Face-to-Face Activity


    @smoke_learning4 @learning_high_risk @course_activity_f2f_session_delete
    Scenario: [Learning]Learning Admin Can Delete A Session In A Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Delete A Session In The Face-to-Face Activity


    @smoke_learning5 @learning_low_risk @course_activity_f2f_delete
    Scenario: [Learning]Learning Admin Deleting A Section In A Course
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE With No Enrolments
      Then  I Delete A Specific Face-to-Face Activity Named Test Face-to-Face Activity - Please DO NOT DELETE


    @learning_low_risk @course_activity_f2f_session_notifications_add
    Scenario: [Learning]Learning Admin Adding Notification Templates in Face-to-Face Activity
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To Add All Notifications


    @smoke_learning5 @learning_low_risk @course_activity_f2f_session_list_sort @C6082
    Scenario: [Learning]When viewing face-to-face session list, can sort by ascending/descending for all field headers
      Given I Have Logged In as a Learning Admin
      And   I go to Admin Settings
      And   I Go To Courses under Learning section
      When  I Edit A Specific Course Named DO NOT DELETE
      And   I Open A Specific Activity Named Test Face-to-Face
      Then  I Should Be Able To View The Face-To-Face Activity Session List
      And   I Should Be Able to Sort The The Face-To-Face Activity Session List By Location


    @smoke_learning6 @learning_low_risk @add_edit_scorm_package @C1027
    Scenario: As a company admin, i want to be able to add/edit a scorm package and make necessary changes
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      Then  I Should Be Able To Add A SCORM Package Activity
      Then  I Should Edit The Scorm Section Name And Description


    @smoke_learning6 @learning_low_risk @course_enrolment_lock_course_enrolment_edit_scorm @C1028
    Scenario Outline: User can edit the scorm activity regardless of course lock config or user enrolled in the course
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      Then  I Should Be Able To Add A SCORM Package Activity
      Given The "ELMO Admin" Configure The "Lock course with enrolments" To <course_lock>
      But   I Have Logged In As A Company Admin
      When  I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      And   I Search For Created Course In The Scenario
      And   I Change The Created Course Enrolment With Employee Being <user_enrolled>
      And   I Go To The Sections Of The Created Course
      Then  I Should Edit The Scorm Section Name And Description

      Examples:
        | course_lock | user_enrolled |
        |    Yes      | Enrolled      |
        |    Yes      | NonEnrolled   |
        |    No       | Enrolled      |
        |    No       | Enrolled      |


    @smoke_learning6 @learning_low_risk @quiz_activity_edit @C247
    Scenario: As A Company Admin, I Want To Be Able To Add/edit A Quiz And Make Necessary Changes
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      And  I Should Be Able To Add A Quiz Activity
      And  I Go To The Page Which Has The List Of Current Editing Item
      Then  I Should Edit The Quiz activity


    @smoke_learning6 @learning_low_risk @quiz_activity_setting
    Scenario: Verify Default Settings Of Quiz Activity And Change Activity Settings
    Default settings for Settings is "Completion Terminology: Pass/Fail", "Show Feedback: Yes", "Marker: Manager"
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      And   I Should Be Able To Add A Quiz Activity
      And   I Verify That Default Settings For Quiz Is Correct
      Then  I Should Change Quiz Settings


    @learning_low_risk @course_enrolment_lock_course_enrolment_edit_quiz
    Scenario Outline: Ability To Edit Quiz Activity As Per Enrolment And System Configuration
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Create A New Course With A Unique Name
      Then  I Should Be Able To Add A Quiz Activity
      Given The "ELMO Admin" Configure The "Lock course with enrolments" To <course_lock>
      But   I Have Logged In As A Company Admin
      When  I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      And   I Search For Created Course In The Scenario
      And   I Change The Created Course Enrolment With Employee Being <user_enrolled>
      And   I Go To The Sections Of The Created Course
      Then  I Should Edit The Quiz activity
      And   Modifying Settings Of Quiz Activity Is <settings>

      Examples:
        | course_lock | user_enrolled | settings |
        |    Yes      | Enrolled      | Disabled |
        |    Yes      | NonEnrolled   | Enabled  |
        |    No       | Enrolled      | Enabled  |
        |    No       | Enrolled      | Enabled  |


    @smoke_learning @learning_low_risk @course_face_to_face_session_management @C1829
    Scenario: As An Administrator I Want To Manage Face 2 Face Course Activity Sessions Such As Create Copy Edit Cancel Delete
      Given A Company Admin Creates A New Course With Unique Name
      Then  I Should Be Able To Add A Face-to-Face Activity
      And   I Open The Activity Named Test Face-to-Face On Sections List Page After Editing
#   COMMENT in the following step the function 'AddSessionTimings()' of saves session time to test data for validation
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity
      When  I Go To The Page Which Has The List Of Current Editing Item
#   COMMENT the following step can verify web table detail pre-defined in test data as Hash value
      Then  I Should Be Able To Verify The Session Details As Per Created
      When  I Should Be Able To Copy A Session In The Face-to-Face Activity
      And   I Go To The Page Which Has The List Of Current Editing Item
      Then  I Should Be Able To Verify The Session Details As Per Copied
      And   I Should Be Able To Edit A Session In The Face-to-Face Activity
      And   I Go To The Page Which Has The List Of Current Editing Item
      And   I Should Be Able To Cancel A Session In The Face-to-Face Activity
      And   I Should Be Able To Delete A Session In The Face-to-Face Activity


    @smoke_learning @learning_low_risk @face_to_face_session_notifications @C745
      Scenario: As An Administrator I Want To Manage Face 2 Face Activity Session Notifications Such As Create Edit Delete
      Given A Company Admin Creates A New Course With Unique Name
      Then  I Should Be Able To Add A Face-to-Face Activity
      When  I Open The Activity Named Test Face-to-Face On Sections List Page After Editing
      Then  I Should Be Able To Create Face To Face Notification With Name Course Face-to-Face Confirmation
      And   I Should Be Able To Edit Face To Face Notification With Name Course Face-to-Face Confirmation
      And   I Should Be Able To Delete Face To Face Notification With Name Course Face-to-Face Confirmation


    @smoke_learning @learning_low_risk @signup_attendance_manually_mark_attendance @C1830
    Scenario: Signup Attendance To Face To Face Session And Mark User Attendance
      Given A Face To Face Session With Status Over Is Created For A Course
      And   I Go To The Page Which Has The List Of Current Editing Item
      When  I Click On "Attendance" Button
      Then  I Should Be Able To Manual Signup ELMO Compàny Admin
      Then  I Should Be Able To Mark Attendance "Fully Attended" With Grade 90 And Mark As Attendance Complete
      And   I Should Be Able To Mark Attendance "Partially Attended" With Grade 90 And Mark As Attendance Complete
      And   I Should Be Able To Mark Attendance As No Show With Grade 90
      And   I Should Be Able To Mark Attendance "Cancelled" With Grade 90 And Mark As Attendance Complete


    @smoke_learning @learning_low_risk @signup_attendance_bulk_mark_attendance @C1831 @C1832
    Scenario: Signup Attendance To Face To Face Session And Mark User Attendance
      Given I Create A Random Course For Automation With Face-To-Face Activity
      And   I Have Logged In as a Company Admin
      And   I Go To The Face To Face Session Of The Course
      When  I Go To The Attendance Of The Session
      Then  I Should Bulk Sign Up Users On Page
      When  I Go To Attendance Page From Bulk Signup
      Then  I Should Bulk Sign Up All Users
      When  I Go To Attendance Page From Bulk Signup
      Then  I Should Bulk Mark Attendance All Users


    @learning_low_risk @C6071 @C6070
    Scenario: As A User, I Want To Signup / Withdraw For A Face 2 Face Activity Session So That I Should Be Able To Self Sign Up / Withdraw Myself From The Face-to-face Session
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Courses Under Learning Section
      When  I Click On The New Course Button
      And   I Add New Course Details
      And   I Select The Availability As All Users
      Then  I Should Be Able To Create A New Course
      Then  I Should Be Able To Add A Face-to-Face Activity
      And   I Open The Activity Named Test Face-to-Face On Sections List Page After Editing
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity
      And   I Have Logged Out
      And   I Have Logged In As A Company Employee
      And   I Go To The Menu Learning Section
      And   I Click On "Course Catalogue" Tab
      And   I Search For A Specific Course With No Enrolments Named DO NOT DELETE
      And   I Click On The Enrol Button For A Course
      And   I Click On "My Learning" Tab
      And   I Search For A Specific Course Named DO NOT DELETE
      And   I Can View The Learning Course Named DO NOT DELETE
      When  I Can View The Face-to-Face Session Named Test Face-to-Face
      Then  I Should Be Able To "Sign Up" For That Session
      And   I Should Be Able To "Withdraw" For That Session
      Then  I Should Receive A Notification With Trigger Named Learning.CourseNewEnrolmentTrigger For Recipient auto1.test1


    @learning_low_risk @course_cpd_category_add @C1772
    Scenario: As a company Administrator, I want to manage Continuing Professional Development (CPD) Categories
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Continuing Professional Development Under Learning Section
      And   I Click On "Categories" Tab
      When  I Click On "New Category" Button
      And   I Enter CPD "New Category" Details
      Then  I Should Be Able To Add CPD "New Category" Successfully
      
      
    @learning_low_risk @course_cpd_add @C1771
    Scenario: As A Company Administrator, I Want To Manage Continuing Professional Development (CPD) Points
      Given I Have Logged In As A Company Admin
      And   I Go To Admin Settings
      And   I Go To Continuing Professional Development Under Learning Section
      When  I Click On "New Plan" Button
      And   I Enter CPD "New Plan" Details
      And   I Select CPD "Category" Named "DO NOT DELETE"
      Then  I Should Be Able To Add CPD "New Plan" Successfully
