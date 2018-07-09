@general @user_profile_setup

Feature:
  As a Company Admin I want to manage User Profile Setup

  @general_low_risk @user_details_config @C762
  Scenario: [General]Company Admin Modifying User Details Section in User Profile Setup
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To User Profile Setup under General section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Expiry Date" item from left side bar under "User Details" section
    And   I select Enabled Toggle to "Enabled"
    And   I select "Required" dropdown to "Required"
    And   I select "Self Registration" dropdown to "Yes"
    And   I select "Visible" dropdown to "Manager and Company Admin"
    And   I select "Editable" dropdown to "Company Admin Only"
    And   I select "Profile" dropdown to "Company Admin Only"
    Then  I Should Be Able To Save The User Details Configuration
    And   I Verify That The Configuration Status Is Saved


  @general_low_risk @built-in_hierarchies_config @C779
  Scenario: [General]Company Admin Modifying Built-in Hierarchies Section in User Profile Setup
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To User Profile Setup under General section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Position" item from left side bar under "Built-In Hierarchies" section
    And   I select Enabled Toggle to "Disabled"
    And   I Click On "Department" item from left side bar under "Built-In Hierarchies" section
    And   I select Enabled Toggle to "Enabled"
    And   I select "Self Registration" dropdown to "Yes"
    And   I select "Visible" dropdown to "Manager and Company Admin"
    And   I select "Editable" dropdown to "Company Admin Only"
    And   I select "Profile" dropdown to "Company Admin Only"
    Then  I Should Be Able To Save The Built-In Hierarchies Configuration
    And   I Verify That The Configuration Status Is Saved


  @general_low_risk @custom_user_fields_config @C778
  Scenario: [General]Company Admin Modifying Custom User Fields Section in User Profile Setup
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To User Profile Setup under General section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Gender" item from left side bar under "Custom User Fields" section
    And   I select Enabled Toggle to "Disabled"
    And   I Click On "Date Joined" item from left side bar under "Custom User Fields" section
    And   I select Enabled Toggle to "Enabled"
    And   I Click On "Payroll Number" item from left side bar under "Custom User Fields" section
    And   I select Enabled Toggle to "Enabled"
    And   I select "Force Unique" dropdown to "Yes"
    And   I select "Visible" dropdown to "Company Admin Only"
    And   I select "Editable" dropdown to "Company Admin Only"
    And   I select "Profile" dropdown to "Company Admin Only"
    Then  I Should Be Able To Save The Custom User Fields Configuration
    And   I Verify That The Configuration Status Is Saved