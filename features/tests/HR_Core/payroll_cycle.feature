@hr_core @payroll_cycle

Feature:
  As A HR Manager, I Can Manage Payroll Cycles

  @hr_core_low_risk @C16629
  Scenario: [General]HR Manager Cannot Delete Payroll Cycle Associated To An User
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Delete For The Payroll Cycle Associated To User
    Then  I Should Be Displayed With A Warning Message
    And   I Should Not Be Able To Delete The Payroll Cycle

  @hr_core_low_risk @payroll_cycle_delete @C16630
  Scenario: [General]HR Manager Can Delete Payroll Cycle
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Delete For The Unassociated Payroll Cycle
    Then  I Should Be Able To Delete The Payroll Cycle

  @hr_core_low_risk @payroll_cycle_add @C82 @C20940
  Scenario: [General]HR Manager Can Add Payroll Cycle
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Add Payroll Cycle Button
    And   I Enter The Payroll Cycle Details
    Then  I Should Be Able To Create The Payroll Cycle Successfully

  @hr_core_low_risk @payroll_cycle_edit @C16628
  Scenario: [General]HR Manager Can Edit Payroll Cycle
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Edit Payroll Cycle Button
    Then  I Edit The Payroll Cycle Details
    And   I Should Be Able To Edit The Payroll Cycle Successfully

  @hr_core_low_risk @payroll_cycle_weeksperannum_default @C20940
  Scenario: [General]Verify That The Weeks per annum Has The Default Value As "52"
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Add Payroll Cycle Button
    Then  I Should See That The Weeks Per Annum Field Is Set With The Default Value

  @hr_core_low_risk @payroll_cycle_add @C82 @C20943
  Scenario: [General]Can View The Validation Message For Weeks Per Annum Field
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Add Payroll Cycle Button
    And   I Enter The Weeks Per Annum As "101.1523"
    Then  I Should See The Error Message When The Weeks Per Annum Is Invalid

  @hr_core_low_risk @payroll_cycle_weeksperannum_infomsg @C20947
  Scenario: [General]Verify That The Weeks per annum Information Message Is Displayed
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Add Payroll Cycle Button
    Then  I Should See That The Weeks Per Annum Field Information Message Is Displayed

  @hr_core_low_risk @payroll_cycle_4weekly @C20957
  Scenario: [General]Verify That The "4 Weekly" Type Is Available For Payroll Cycle
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Add Payroll Cycle Button
    Then  I Should See That The "4 Weekly" Type Is Available

  @hr_core_low_risk @payroll_cycle_quarterly @C20958
  Scenario: [General]Verify That The Quarterly Type Is Available For Payroll Cycle
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Add Payroll Cycle Button
    Then  I Should See That The Quarterly Type Is Available
    And   I Select Type As Quarterly
    And   The Date of Month Field Is Set To 1st As Default

  #currently can only be run on tmspayrolldev
  @hr_core_low_risk @payroll_cycle_bi-monthly
  Scenario: [General]Verify That The Bi-Monthly Type Is Available For Payroll Cycle
    Given I Have Logged In As A HR Manager
    And   I Go To Admin Settings
    And   I Go To "Payroll Cycle" Under "HR Core" Section
    When  I Click On Add Payroll Cycle Button
    Then  I Should See That The Bi-monthly Type Is Available
