@leaveManagement
Feature:
  As a user I want to test the admin rights to create various leave components
  @create_leave_type
  Scenario: Create Leave types
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Type
    Then  I Should Be Able To Successfully Create A New Leave Type

  @create_leave_policy
  Scenario: Create Leave policy
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Policy
    Then  I Should Be Able To Successfully Create A New Leave Policy

  @create_holiday_management
  Scenario: Create Holiday Management
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Company Holiday
    Then  I Should Be Able To Successfully Create A New Company Holiday

  @ApprovedLeaveRequestNotification
  Scenario: Modify The Work Hrs And Cancel A Submitted Request As A Company HR
    Given An Employee Has Applied For A Leave Which Is Awaiting Approval
    When  I Log In As A Company Admin To Process A Leave Request
    And   I Approved The Submitted Request To Modify It Further
    Then  I Should Be Able To Successfully Process A Modified Leave Request
    And   I Should Be Able To Cancel The Request

  @CheckleaveBalance_Accruals
  Scenario: Check Leave balance of An Employee As A Company HR
    Given I Have Logged In As A Company Admin To Check Leave Balance Section
    When  I Search For Leave Balance Of A Particular Employee
    Then  I Should Be Able To Check The Correct Leave Balance