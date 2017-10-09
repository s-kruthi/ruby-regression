@leaveManagement
Feature:
  As a user I want to test the admin rights to create various leave components
  @create_leave_type @leave_high_risk
  Scenario: Create Leave types
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Type
    Then  I Should Be Able To Successfully Create A New Leave Type

  @create_leave_policy @leave_high_risk
  Scenario: Create Leave policy
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Policy
    Then  I Should Be Able To Successfully Create A New Leave Policy

  @create_holiday_management @leave_high_risk
  Scenario: Create Holiday Management
    Given I Have Logged In as a Company Admin To Setup Leave Management
    When  I Try To Create A New Company Holiday
    Then  I Should Be Able To Successfully Create A New Company Holiday

  @CheckleaveBalance_Accruals @leave_low_risk
  Scenario: Check Leave balance of An Employee As A Company HR
    Given I Have Logged In As A Company Admin To Check Leave Balance Section
    When  I Search For Leave Balance Of A Particular Employee
    Then  I Should Be Able To Check The Correct Leave Balance