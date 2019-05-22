@leave_request

Feature:
  As An Employee I Can Manage My Leave

#  NOTE: currently can only be run on tmspayrolldev.dev
  @submit_leave_request @time_in_lieu_request @leave_request_bank @leave_low_risk
  Scenario: [Leave]Employee Can Bank A RDO/ Time in Lieu Leave Request
    Given I Have Logged In As An Employee Using The Username "auto1.scriptonce1" And Password "Admin1234567"
    And   I Go To The "Menu Leave" Section
    When  I Click On "New Request" Button
    And   I Choose To Bank The Request
    And   I Can Select RDO/ Time in Lieu Leave Type
    Then  I Should Be Able To See That My Leave Request Was Successfully Submitted

#  NOTE: currently can only be run on tmspayrolldev.dev
  @submit_leave_request @time_in_lieu_request @leave_request_take @leave_low_risk
  Scenario: [Leave]Admin Can Submit A TIL/RDO Leave Request For An Employee
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Users" Under "General" Section
    And   I Search For The User With RDO/ Time in Lieu Balance
    And   I Use The Log in as this user Option To Login
    And   I Go To The "Menu Leave" Section
    When  I Click On "New Request" Button
    And   I Choose To Take The Request
    And   I Can Select RDO/ Time in Lieu Leave Type
    Then  I Should Be Able To See That My Leave Request Was Successfully Submitted

#  NOTE: currently can only be run on tmspayrolldev.dev
  @submit_leave_request @long_service_leave_request @leave_low_risk
  Scenario: [Leave]Admin Can Submit A LSL Leave Request For An Employee
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Users" Under "General" Section
    And   I Search For The User With Long Service Leave Balance
    And   I Use The Log in as this user Option To Login
    And   I Go To The "Menu Leave" Section
    When  I Click On "New Request" Button
    And   I Can Select Long Service Leave Leave Type
    Then  I Should Be Able To See That My Leave Request Was Successfully Submitted

#  NOTE: currently can only be run on tmspayrolldev.dev
  @submit_leave_request @long_service_leave_request @leave_low_risk @leave_balance_error
  Scenario: [Leave]Leave Balance Insufficient Error Message Is Displayed
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Users" Under "General" Section
    And   I Search For The User Having Insufficient Long Service Leave Balance
    And   I Use The Log in as this user Option To Login
    And   I Go To The "Menu Leave" Section
    When  I Click On "New Request" Button
    And   I Can Select Long Service Leave Leave Type
    Then  I Should Be Able To See That My Leave Request Cannot Be Submitted
