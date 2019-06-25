@general @vendors

Feature:
  As A Company Admin I Can Manage And Create Vendors & Vendor Users

  @general_low_risk @general_vendors_add @C20995 @C20996 @C20997
  Scenario: [General]Company Admin Can Create A Vendor
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Vendors" Under "General" Section
    And   I Can Add A Vendor
    Then  I Should See That The Vendor Is "Added" Successfully

  @general_low_risk @general_vendor_edit
  Scenario: [General]Can Edit A Vendor
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Vendors" Under "General" Section
    When  I Search For "Vendor Scriptonce" Vendor
    And   I Edit The Name To Be "Vendor Scriptonce Edit"
    Then  I Should See That The Vendor Is "Edited" Successfully

  @general_low_risk @general_vendor_user_add @C20998 @C20999 @C21000 @C21001 @C21007
  Scenario: [General]Can Add A Vendor User
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Vendors" Under "General" Section
    When  I Search For "Vendor Scriptonce Edit" Vendor
    And   I Choose To "Add Vendor User" For The Vendor
    And   I Enter The Vendor User Details
    Then  I Should See That The Vendor User Is "Added" Successfully
    And   I Activate The Newly Created Vendor User

  @general_low_risk @general_vendor_view_users
  Scenario: [General]Can View Vendor Users
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Vendors" Under "General" Section
    When  I Search For "Vendor Scriptonce Edit" Vendor
    And   I Choose To "View Vendor Users" For The Vendor
    Then  I Should See The Vendor Users Listed In The Page

  @general_low_risk @general_vendor_user_edit @C21008
  Scenario: [General]Can Edit A Vendor User
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Vendors" Under "General" Section
    When  I Search For "Vendor Scriptonce Edit" Vendor
    And   I Choose To "View Vendor Users" For The Vendor
    And   I "Edit" Vendor User
    Then  I Should See That The Vendor User Is "Edited" Successfully

  @general_low_risk @general_vendor_user_deactivate
  Scenario: [General]Can Deactivate A Vendor User
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Vendors" Under "General" Section
    When  I Search For "Vendor Scriptonce Edit" Vendor
    And   I Choose To "View Vendor Users" For The Vendor
    And   I "Deactivate" Vendor User
    Then  I Should See That The Vendor User Is "Deactivated" Successfully

  @general_low_risk @general_vendor_deactivate
  Scenario: [General]Can Deactivate Vendor
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    And   I Go To "Vendors" Under "General" Section
    When  I Search For "Vendor Scriptonce Edit" Vendor
    And   I Choose To "Deactivate Vendor"
    Then  I Should See That The Vendor Is "Deactivated" Successfully
