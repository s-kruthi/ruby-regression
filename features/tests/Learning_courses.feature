@Course_setup
  Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @xxx430
  Scenario: Create A New Course With Quiz Activity
    Given I Have Logged In as a Company Admin To Setup A Course
    When  I Setup A Course To Edit The Section
    And   I Try To Setup A Quiz Activity Under The Section
    Then  I Should be Able To Successfully Setup The Quiz Activity

   # Scenario: Assign The Quiz Activity To An User


    #####################Added Omar's course section##########################
    @course_add
    Scenario: Learning Admin Creating New Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Click On The New Course Button
      And   I Add New Course Details
      Then  I Should Be Able To Create A New Course

    @course_search
    Scenario: Learning Admin Searching New Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Search For A Specific Course
      Then  I Should Be Able To Edit The Specific Course

    @course_delete
    Scenario: Learning Admin Creating New Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Search For A Specific Course
      Then  I Should Be Able To Delete The Specific Course

    @activity_ack_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Acknowledgement Activity

    @activity_survey_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New ELMO Survey Activity

    @activity_f2f_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Face-to-Face Activity

    @activity_quiz_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Quiz Activity

    @activity_file_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New File Activity

    @activity_label_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Label Activity

    @activity_page_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Page Activity

    @activity_post_add @activity_add
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add A New Post Activity

    @activity_delete
    Scenario: Learning Admin creating New Activity In A Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Delete A Specific Section

    @course_notifications
    Scenario: Learning Admin Adding Notification Templates in Course
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      Then  I Should Be Able To Add All Notifications

    @f2f_session_add
    Scenario: Learning Admin creating New Session In A Face-to-Face Activity
      Given I Have Logged In as a Learning Admin to shayan02 site
      And   I Go To The Courses Section
      When  I Edit A Specific Course
      And   I Open A Specific Face-to-Face Activity
      Then  I Should Be Able To Create A Session In The Face-to-Face Activity



#  Scenario: Admin verifies the Sessions page
#    Given I Have Logged In as an Admin User
#    And I Have Opened a Course that contains F2F Activity
#    When  I Verify the Sessions Page
#    Then  I Should Be Able To View the List of Upcoming sessions by default
#    And I Should Be Able to View the List of Sessions with various statuses by Selecting the Session Status dropdown
#    And I Should Be Able to Search for Sessions between particular dates by using the date search on the header
#
#  Scenario: Admin views the available sessions on the Sessions page
#    Given I Have Logged In as an Admin User
#    And I Have Opened a Course that contains F2F Activity
#    And I Have the Opened Sessions Page
#    When I View a session on the sessions list page
#    Then  I Should Be Able To View the Location, Venue, Facilitator, Start Time, End Time, Capacity and Status for the Session
#    And I Should Be Able to Select the Actions for an Upcoming Session such as Edit Session, Attendance and Cancel Session
#
#
#  Scenario: Admin Adds a Session for a F2F Activity
#    Given I Have Opened a F2F Activity
#    And I Have Opened a Course that contains F2F Activity
#    When I Add a Session for the F2F Activity
#    Then  I Should Be Able To See the Session Instructions and Attachments Copied from the F2F Activity
#    And   I Should Be Able to Select the Session Details such as Start and Finish Time
#    And   I Should Be Able to Select the Session Capacity, Location, Venue and Availability to Employees
#    And   I Should Be Able to Allow Overbooking and Waitlisting for the Session
#    And   I Should Be Able to Select the Approvers who need to Approve Employee Requests to Enrol to the Session
#
#
#  Scenario: Admin Edits a Session for a F2F Activity
#    Given I Have Opened a F2F Activity
#    And I Have Opened a Course that contains F2F Activity
#    And I Have Opened a F2F Activity that contains F2F Sessions
#    When I Edit a Session for the F2F Activity
#    Then  I Should Be Able To Edit the Session Instructions and Attachments Copied from the F2F Activity
#    And   I Should Be Able to Edit the Session Details such as Start and Finish Time
#    And   I Should Be Able to Edit the Session Capacity, Location, Venue and Availability to Employees
#    And   I Should Be Able to Edit Overbooking and Waitlisting for the Session
#    And   I Should Be Able to Edit the Approvers who need to Approve Employee Requests to Enrol to the Session
#
#
#  Scenario: Admin Edits Attendance for a Session
#    Given I Have Opened a F2F Activity
#    And I Have Opened a Course that contains F2F Activity
#    And I Have Opened a F2F Activity that contains F2F Sessions
#    When I Select Attendance Action for a Session
#    Then  I Should Be Able To Enrol Employees to the Session manually
#    And   I Should Be Able To Enrol Employees to the Session in bulk
#    And   I Should Be Able to Import attendance from a csv file
#    And   I Should Be Able to Export attendance to a pdf file
#    And   I Should Be Able to Search Employees who are enrolled to the Session
#
#
#  Scenario: Admin Marks Attendance for a Session
#    Given I Have Opened a F2F Activity
#    And I Have Opened a Course that contains F2F Activity
#    And I Have Opened a F2F Activity that contains F2F Sessions
#    And I Have Selected Attendance Action for a Session
#    When I Select Mark Attendance for an Employee who is enrolled to the session
#    Then  I Should Be Able To Select Whether the Employee attended the session
#    And   I Should Be Able To Select the Score for the Employee for the session
#
#
#  Scenario: Admin Adds Note for an Employee attending the session
#    Given I Have Opened a F2F Activity
#    And I Have Opened a Course that contains F2F Activity
#    And I Have Opened a F2F Activity that contains F2F Sessions
#    And I Have Selected Attendance Action for a Session
#    When I Select Add Note for an Employee who is enrolled to the session
#    Then  I Should Be Able To Add a Note for the Employee for the session
#    And   I Should Be Able To Add an Attachment while adding the Note
#
#
#  Scenario: Admin Un-enrols  an Employee who has enrolled for a session
#    Given I Have Opened a F2F Activity
#    And I Have Opened a Course that contains F2F Activity
#    And I Have Opened a F2F Activity that contains F2F Sessions
#    And I Have Selected Attendance Action for a Session
#    When I Select Unenrol for an Employee who is enrolled to the session
#    Then  I Should Be Able To Remove the Employee from the enrolments for the session