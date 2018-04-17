@elmo_config

Feature:
  As a Company Admin I want to manage User Profile related configurations Successfully

  @elmo_config_user @general_low_risk
  Scenario: [General]Company Admin Modifying User Configuration Section data
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To User Profile Setup under General section
    And   I Click On "User Profile Setup" Tab
    When  I Click On "Expiry Date" item from left side bar under "User Details" section
    And   I select "Enabled" option to "Enabled"
    And   I select "Required" dropdown to "Required"
    And   I select "Self Registration" dropdown to "Yes"
    And   I select "Visible" dropdown to "Manager and Company Admin"
    And   I select "Editable" dropdown to "Company Admin Only"
    And   I select "Profile" dropdown to "Company Admin Only"
    And   I select "Reports" dropdown to "Company Admin Only"
    Then  I Should Be Able To Save Configuration Details
    And   Verify That "Configuration Status" Is Displayed As "Saved"



  @elmo_config_activity_resume @general_low_risk
  Scenario: [General]Company Admin Modifying Activity And Resume Configuration Section data
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To User Profile Setup under General section
    And   I Click On "Personal And Payment Details" Tab
    When  I Click On "Expiry Date" item from left side bar under "User Details" section
#    And   I select "Enabled" option to "Enabled"
#    And   I select "Required" dropdown to "Required"
#    And   I select "Self Registration" dropdown to "Yes"
#    And   I select "Visible" dropdown to "Manager and Company Admin"
#    And   I select "Editable" dropdown to "Company Admin Only"
#    And   I select "Profile" dropdown to "Company Admin Only"
#    And   I select "Reports" dropdown to "Company Admin Only"
#    Then  I Should Be Able To Save Configuration Details
#    And   Verify That "Configuration Status" Is Displayed As "Saved"


  @elmo_config_general_configuration
  Scenario: [Genera]As an ELMO Admin, I want to be able to modify ELMO configuration under General Setup and change various settings
    Given I Have Logged In As A Company Admin
    And   I go to Admin Settings
    And   I Go To General Setup under General section
    And   I Click On "ELMO Configuration" Tab
    When  I Change "Lock course with enrolments" ELMO Configuration To "Disabled"
    Then  I Should Be Able To Save Configuration Details