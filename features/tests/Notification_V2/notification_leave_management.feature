@Notifications_leave_management @smoke
Feature:
  As a user I want to test combinations of Leave management notifications to test if they were triggered successfully

  @leave_request_submit @leave_request_action_reminder @group_by_1
  Scenario: Employee Applies For Leave which triggers notification to both employee and his/her approver
    Given I Am On The New Leave Request Page
    When  I Apply For A Leave As An Employee
    Then  I Should Be Instantly Notified About My Leave Request

  @leave_request_cancelled_by_employee @group_by_1
  Scenario: Employee Cancels The Leave which triggers notification to the employee
    Given I Am On The New Leave Request Page
    When  I Cancel The Leave That I have Requested For
    Then  I Should Be Instantly Notified About My Leave Request cancellation

  @leave_request_cancelled_by_approver @group_by_2
  Scenario: Employee's Manager Cancels The Leave Request which triggers notification to the employee
    Given An Employee Has Applied For A Leave Which Is Awaiting Approval
    When  I Am On The Managers Leave Management Page
    And   I Cancel The Leave That My Employee has Requested For
    Then  My Employee Should Be Instantly Notified About The Leave Request cancellation

  @leave_request_Rejected @group_by_3
  Scenario: Manger Rejects The Leave which triggers notification to the employee
    Given An Employee Has Applied For A Leave Which Is Awaiting Approval
    When  I Am On The Managers Leave Management Page
    And   I Reject The Leave That My Employee has Requested For
    Then  My Employee Should Be Instantly Notified About The Leave Request Rejection

  @leave_request_resubmitted @group_by_3
  Scenario: Employee Resubmits The Leave which triggers notification
    Given I Am On The New Leave Request Page
    When  I Edit The Leave That Is Reopened Post Rejection By Approver
    Then  There Should Be An Instant Notification About Leave Resubmission

  @leave_request_RejectedAndClosed @group_by_3
  Scenario: Manager Finally Reject And Close The Leave Request which triggers notification
    When  I Am On The Managers Leave Management Page
    And   I Reject And Close The Leave That My Employee has Requested For
    Then  There Should Be An Instant Notification About Leave Rejection