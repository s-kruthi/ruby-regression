@hr_core @payroll_cycle

Feature:
  As A HR Manager, I Can Manage Payroll Cycles

  @hr_core_low_risk @C16629
  Scenario: [General]HR Manager Cannot Delete Payroll Cycle Associated To An User
    Given I Have Logged In as a HR Manager
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Delete For The Payroll Cycle Associated To User
    Then  I Should Be Displayed With A Warning Message
    And   I Should Not Be Able To Delete The Payroll Cycle


  @hr_core_low_risk @payroll_cycle_delete @C16630
  Scenario: [General]HR Manager Can Delete Payroll Cycle
    Given I Have Logged In as a HR Manager
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Delete For The Unassociated Payroll Cycle
    Then  I Should Be Able To Delete The Payroll Cycle


  #currently can only be run on payroll04
  @hr_core_low_risk @payroll_cycle_add @C82 @C20940
  Scenario: [General]HR Manager Can Add Payroll Cycle
    Given I Have Logged In as a HR Manager
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section 
    When  I Click On Add Payroll Cycle Button
    And   I Enter The Payroll Cycle Details
    Then  I Should Be Able To Create The Payroll Cycle Successfully


  #currently can only be run on payroll04
  @hr_core_low_risk @payroll_cycle_edit @C16628
  Scenario: [General]HR Manager Can Edit Payroll Cycle
    Given I Have Logged In as a HR Manager
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Edit Payroll Cycle Button
    Then  I Edit The Payroll Cycle Details
    And   I Should Be Able To Edit The Payroll Cycle Successfully


  #currently can only be run on payroll04
  @hr_core_low_risk @payroll_cycle_weeksperannum_default @C20940
  Scenario: [General]Verify That The Weeks per annum Has The Default Value As 52
    Given I Have Logged In as a HR Manager
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Add Payroll Cycle Button
    Then  I Should See That The Weeks per annum Field Is Set With The Default Value


  #currently can only be run on payroll04
  @hr_core_low_risk @payroll_cycle_add @C82 @C20943
  Scenario: [General]Can View The Validation Message For Weeks Per Annum Field
    Given I Have Logged In as a HR Manager
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Add Payroll Cycle Button
    And   I Enter The Weeks Per Annum As 101.1523
    Then  I Should See The Error Message When The Weeks Per Annum Is Invalid


  #currently can only be run on payroll04
  @hr_core_low_risk @payroll_cycle_weeksperannum_infomsg @C20947
  Scenario: [General]Verify That The Weeks per annum Information Message Is Displayed
    Given I Have Logged In as a HR Manager
    And   I go to Admin Settings
    And   I Go To Payroll Cycle under HR Core section
    When  I Click On Add Payroll Cycle Button
    Then  I Should See That The Weeks per annum Field Information Message Is Displayed
