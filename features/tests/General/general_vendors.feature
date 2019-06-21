@general @vendors

Feature:
  As A Company Admin I Can Manage And Create Vendors & Vendor Users

  @general_low_risk @general_vendors_add
  Scenario: [General]Company Admin Can Create A Vendor
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    And   I Can Add A Vendor
    Then  I Should See That The Vendor Is "Added" Successfully

  @general_low_risk @general_vendor_edit
  Scenario: [General]Can Edit A Vendor
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    When  I Search For "testing_vendors" Vendor
    And   I Edit The Name To Be "Testing Vendors"
    Then  I Should See That The Vendor Is "Edited" Successfully

  @general_low_risk @general_vendor_user_add
  Scenario: [General]Can Add A Vendor User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    When  I Search For "Testing Vendors" Vendor
    And   I Choose To "Add Vendor User" For The Vendor
    And   I Enter The Vendor User Details
    Then  I Should See That The Vendor User Is "Added" Successfully
    And   I Activate The Newly Created Vendor User

  @general_low_risk @general_vendor_view_users
  Scenario: [General]Can View Vendor Users
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    When  I Search For "Testing Vendors" Vendor
    And   I Choose To "View Vendor Users" For The Vendor
    Then  I Should See The Vendor Users Listed In The Page

  @general_low_risk @general_vendor_user_edit
  Scenario: [General]Can Edit A Vendor User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    When  I Search For "Testing Vendors" Vendor
    And   I Choose To "View Vendor Users" For The Vendor
    And   I "Edit" Vendor User
    Then  I Should See That The Vendor User Is "Edited" Successfully

  @general_low_risk @general_vendor_user_deactivate
  Scenario: [General]Can Deactivate A Vendor User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    When  I Search For "Testing Vendors" Vendor
    And   I Choose To "View Vendor Users" For The Vendor
    And   I "Deactivate" Vendor User
    Then  I Should See That The Vendor User Is "Deactivated" Successfully

  @general_low_risk @general_vendor_deactivate
  Scenario: [General]Can Deactivate Vendor
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To "Vendors" under "General" section
    When  I Search For "Testing Vendors" Vendor
    And   I Choose To "Deactivate Vendor"
    Then  I Should See That The Vendor Is "Deactivated" Successfully
