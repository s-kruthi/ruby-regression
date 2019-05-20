@leaveManagement
#@leaveTestRailTags
#C111	C195	C184	C185	C186	C187	C188	C189	C190	C191	C192	C193
#C823	C141	C235	C112	C113	C114	C115	C116	C117	C118	C119	C122
#C123	C125	C181	C127	C144	C147	C151	C152	C154	C155	C158	C148
#C205	C153	C156	C741	C203	C201	C164	C163	C209	C822	C165	C166
#@leaveTestRailTags
Feature:
  As a user I want to test the admin rights to create various leave components


  @create_leave_type @leave_high_risk
  Scenario: [Leave]Create Leave types
    Given I Have Logged In As A Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Type
    Then  I Should Be Able To Successfully Create A New Leave Type


  @create_leave_policy @leave_high_risk
  Scenario: [Leave]Create Leave policy
    Given I Have Logged In As A Company Admin To Setup Leave Management
    When  I Try To Create A New Leave Policy
    Then  I Should Be Able To Successfully Create A New Leave Policy


  @create_holiday_management @leave_high_risk
  Scenario: [Leave]Create Holiday Management
    Given I Have Logged In As A Company Admin To Setup Leave Management
    When  I Try To Create A New Company Holiday
    Then  I Should Be Able To Successfully Create A New Company Holiday


  @CheckleaveBalance_Accruals @leave_low_risk
  Scenario: [Leave]Check Leave balance of An Employee As A Company HR
    Given I Have Logged In As A Company Admin To Check Leave Balance Section
    When  I Search For Leave Balance Of A Particular Employee
    Then  I Should Be Able To Check The Correct Leave Balance


