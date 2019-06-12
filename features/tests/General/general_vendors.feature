@general @vendors


Feature:
  As A Company Admin I Can Manage And Create Vendors

  @general_low_risk @vendors_add
  Scenario: [General]Company Admin Can Create A Vendor
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    And   I Can Add A Vendor
    Then  I Should See That Vendor Is Successfully Added


  @general_low_risk @vendor_edit
  Scenario: [Recruitment]Can Edit Vendor
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    When  I Search For "testing_vendors" Vendor
    And   I Edit The Name To Be "Testing Vendors"
    Then  I Should See That The Vendor Was "Edited" Successfully
