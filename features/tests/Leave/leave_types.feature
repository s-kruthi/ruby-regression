@leavetypes

Feature:
  As a HR Manager I want to manage leave types

@leave_low_risk @leave_type_LSL @C19888
Scenario: [Leave]Create LSL Leave Type
Given I Have Logged In As A HR Manager
And   I Go To Admin Settings
And   I Go To "Leave Types" Under "Leave Management" Section
When  I Create A Leave Type Of Long Service Leave Entitlement Type Named LSL_Auto
Then  I Should See That The Leave Type Is Created Successfully

@leave_low_risk @leave_type_TIL @C19896
Scenario: [Leave]Create LSL Leave Type
Given I Have Logged In As A HR Manager
And   I Go To Admin Settings
And   I Go To "Leave Types" Under "Leave Management" Section
When  I Create A Leave Type Of Rostered Day Off / Time in Lieu Entitlement Type Named RDO_Auto
Then  I Should See That The Leave Type Is Created Successfully