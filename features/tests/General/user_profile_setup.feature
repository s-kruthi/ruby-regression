@general @user_profile_setup

Feature:
  As a Company Admin I want to manage User Profile Setup

  @general_low_risk @C762
  Scenario: [General]Company Admin Modifying User Details Section In User Profile Setup
    Given I Have Logged In As A ELMO Admin
    And   I Go To Admin Settings
    And   I Go To User Profile Setup Under General Section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Expiry Date" Item From Left Side Bar Under "User Details" section
    And   I Select Enabled Toggle To "Enabled"
    And   I Select "Required" Dropdown To "Required"
    And   I Select "Self Registration" Dropdown To "Yes"
    And   I Select "Visible" Dropdown To "Manager and Company Admin"
    And   I Select "Editable" Dropdown To "Company Admin Only"
    And   I Select "Profile" Dropdown To "Company Admin Only"
    Then  I Should Be Able To Save The User Details Configuration
    And   I Verify That The Configuration Status Is Saved


  @general_low_risk @built-in_hierarchies_config @C779
  Scenario: [General]Company Admin Modifying Built-in Hierarchies Section In User Profile Setup
    Given I Have Logged In As A ELMO Admin
    And   I Go To Admin Settings
    And   I Go To User Profile Setup Under General Section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Position" Item From Left Side Bar Under "Built-In Hierarchies" section
    And   I Select Enabled Toggle to "Disabled"
    And   I Click On "Department" Item From Left Side Bar Under "Built-In Hierarchies" section
    And   I Select Enabled Toggle To "Enabled"
    And   I Select "Self Registration" Dropdown To "Yes"
    And   I Select "Visible" Dropdown To "Manager and Company Admin"
    And   I Select "Editable" Dropdown To "Company Admin Only"
    And   I Select "Profile" Dropdown To "Company Admin Only"
    Then  I Should Be Able To Save The Built-In Hierarchies Configuration
    And   I Verify That The Configuration Status Is Saved


  @general_low_risk @custom_user_fields_config @C778
  Scenario: [General]Company Admin Modifying Custom User Fields Section In User Profile Setup
    Given I Have Logged In As A ELMO Admin
    And   I Go To Admin Settings
    And   I Go To User Profile Setup Under General Section
    And   I Click On "User Profile Setup" Tab
    And   I Edit 3 Custom User Fields In User Profile Setup
    And   I Click On The First Item From Left Side Bar Under "Custom User Fields" section
    And   I Select Enabled Toggle To "Disabled"
    And   I Click On The Second Item From Left Side Bar Under "Custom User Fields" section
    And   I Select Enabled Toggle To "Enabled"
    And   I Click On The Third Item From Left Side Bar Under "Custom User Fields" section
    And   I Select Enabled Toggle To "Enabled"
    And   I Select "Force Unique" Dropdown To "Yes"
    And   I Select "Visible" Dropdown To "Company Admin Only"
    And   I Select "Editable" Dropdown To "Company Admin Only"
    And   I Select "Profile" Dropdown To "Company Admin Only"
    Then  I Should Be Able To Save The Custom User Fields Configuration
    And   I Verify That The Configuration Status Is Saved


  @general_low_risk @cost_centre_user_field @legal_entity_user_field @payroll_cost_centre @C16890 @C16920
  Scenario: [General]Company Admin Can Modify Payroll Related Fields In User Profile Setup
    Given That Cost Centre and Company(Legal Entity) Fields Are Enabled
    And   I Have Logged In As A ELMO Admin
    And   I Go To Admin Settings
    And   I Go To User Profile Setup Under General section
    When  I Click On "User Profile Setup" Tab
    Then  I Can See That I Can Modify The Cost Centre Settings
    And   I Can See That I Can Modify The Company(Legal Entity) Settings


  @general_low_risk @cost_centre_enabled @payroll_cost_centre @C16888
  Scenario: [General]Cost Centres Section Is Not Accessible When Cost Centre Is Enabled
    Given I Have Logged In As A ELMO Admin
    When  I Go To Admin Settings
    Then  I Should Not Be Able To Access Cost Centres Under HR Core Section


  @general_low_risk @employee_number
  Scenario: [General]Company Admin Modifying Employee Number In User Profile Setup
    Given I Have Logged In As A ELMO Admin
    And   I Go To Admin Settings
    And   I Go To User Profile Setup Under General section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Employee Number" Item From Left Side Bar Under "User Details" section
    Then  I Select Auto Generate To Enabled
    And   I Can See That I Can Configure Employee Number


  @general_low_risk @date_of_birth
  Scenario: [General]Company Admin Modifying Date Of Birth In User Profile Setup
    Given I Have Logged In As A ELMO Admin
    And   I Go To Admin Settings
    And   I Go To User Profile Setup Under General section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Date of Birth" Item From Left Side Bar Under "User Details" section
    And   I Select Enabled Toggle To "Enabled"
    And   I Select "Required" Dropdown To "Required"
    And   I Select "Self Registration" Dropdown To "Yes"
    And   I Select "Visible" Dropdown To "Manager and Company Admin"
    And   I Select "Editable" Dropdown To "Company Admin Only"
    And   I Select "Profile" Dropdown To "Company Admin Only"
    Then  I Should Be Able To Save The User Details Configuration
    And   I Verify That The Configuration Status Is Saved



