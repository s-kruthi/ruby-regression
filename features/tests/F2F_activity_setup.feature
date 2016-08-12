@F2F

Feature:
  As a Company Administrator I want to test combinations of F2F activities to test if they were triggered successfully

  @course @add @view
  Scenario: Admin logging in to access F2F Activities (Happy Path)
    Given I Have Logged In as an Admin User
    When  I Access a Course that has F2F Activity
    Then  I Should Be Able To See The F2F Activities in the Course sections page
    And   I Should Be Able to Add/Edit F2F Activities to the Course


  @course @add @view

  Scenario: Admin logging in to access F2F Sessions (Happy Path)
    Given I Have Logged In as an Admin User
    When  I Have Opened a F2F Activity
    Then  I Should Be Able To See The F2F Sessions (if available)
    And   I Should Be Able to Add/Edit F2F Sessions to the Activity

  Scenario: Admin logging in to view F2F reports in TMS
    Given I Have Logged In as an Admin User
    When  I Open the Reports tab
    Then  I Should Be Able To See All the Reports related to F2F Activities and Sessions


  Scenario: Admin edits the F2F Activity
    Given I Have Logged In as an Admin User
    And I Have Opened a Course that contains F2F Activity
    When  I Edit the F2F Activity
    Then  I Should Be Able To Edit the Activity description and Template details
    And I Should Be Able to Select Whether Location, Venue and Session Facilitator are Enabled for the Sessions or not
    And I Should Be Able to Select Whether Location, Venue and Session Facilitator are Optional Fields or not

  Scenario: Admin verifies the Sessions page
    Given I Have Logged In as an Admin User
    And I Have Opened a Course that contains F2F Activity
    When  I Verify the Sessions Page
    Then  I Should Be Able To View the List of Upcoming sessions by default
    And I Should Be Able to View the List of Sessions with various statuses by Selecting the Session Status dropdown
    And I Should Be Able to Search for Sessions between particular dates by using the date search on the header

  Scenario: Admin views the available sessions on the Sessions page
    Given I Have Logged In as an Admin User
    And I Have Opened a Course that contains F2F Activity
    And I Have the Opened Sessions Page
    When I View a session on the sessions list page
    Then  I Should Be Able To View the Location, Venue, Facilitator, Start Time, End Time, Capacity and Status for the Session
    And I Should Be Able to Select the Actions for an Upcoming Session such as Edit Session, Attendance and Cancel Session


  Scenario: Admin Adds a Session for a F2F Activity
    Given I Have Opened a F2F Activity
    And I Have Opened a Course that contains F2F Activity
    When I Add a Session for the F2F Activity
    Then  I Should Be Able To See the Session Instructions and Attachments Copied from the F2F Activity
    And   I Should Be Able to Select the Session Details such as Start and Finish Time
    And   I Should Be Able to Select the Session Capacity, Location, Venue and Availability to Employees
    And   I Should Be Able to Allow Overbooking and Waitlisting for the Session
    And   I Should Be Able to Select the Approvers who need to Approve Employee Requests to Enrol to the Session


  Scenario: Admin Edits a Session for a F2F Activity
    Given I Have Opened a F2F Activity
    And I Have Opened a Course that contains F2F Activity
    And I Have Opened a F2F Activity that contains F2F Sessions
    When I Edit a Session for the F2F Activity
    Then  I Should Be Able To Edit the Session Instructions and Attachments Copied from the F2F Activity
    And   I Should Be Able to Edit the Session Details such as Start and Finish Time
    And   I Should Be Able to Edit the Session Capacity, Location, Venue and Availability to Employees
    And   I Should Be Able to Edit Overbooking and Waitlisting for the Session
    And   I Should Be Able to Edit the Approvers who need to Approve Employee Requests to Enrol to the Session


  Scenario: Admin Edits Attendance for a Session
    Given I Have Opened a F2F Activity
    And I Have Opened a Course that contains F2F Activity
    And I Have Opened a F2F Activity that contains F2F Sessions
    When I Select Attendance Action for a Session
    Then  I Should Be Able To Enrol Employees to the Session manually
    And   I Should Be Able To Enrol Employees to the Session in bulk
    And   I Should Be Able to Import attendance from a csv file
    And   I Should Be Able to Export attendance to a pdf file
    And   I Should Be Able to Search Employees who are enrolled to the Session


  Scenario: Admin Marks Attendance for a Session
    Given I Have Opened a F2F Activity
    And I Have Opened a Course that contains F2F Activity
    And I Have Opened a F2F Activity that contains F2F Sessions
    And I Have Selected Attendance Action for a Session
    When I Select Mark Attendance for an Employee who is enrolled to the session
    Then  I Should Be Able To Select Whether the Employee attended the session
    And   I Should Be Able To Select the Score for the Employee for the session


  Scenario: Admin Adds Note for an Employee attending the session
    Given I Have Opened a F2F Activity
    And I Have Opened a Course that contains F2F Activity
    And I Have Opened a F2F Activity that contains F2F Sessions
    And I Have Selected Attendance Action for a Session
    When I Select Add Note for an Employee who is enrolled to the session
    Then  I Should Be Able To Add a Note for the Employee for the session
    And   I Should Be Able To Add an Attachment while adding the Note


  Scenario: Admin Un-enrols  an Employee who has enrolled for a session
    Given I Have Opened a F2F Activity
    And I Have Opened a Course that contains F2F Activity
    And I Have Opened a F2F Activity that contains F2F Sessions
    And I Have Selected Attendance Action for a Session
    When I Select Unenrol for an Employee who is enrolled to the session
    Then  I Should Be Able To Remove the Employee from the enrolments for the session