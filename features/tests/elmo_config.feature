@elmo_config

Feature:
  As a Company Admin I want to manage User Profile related configurations Successfully

  @elmo_config_save @general_low_risk
  Scenario: Comapny Admin Modifying User Details Section Configuration Data
    Given I Have Logged In as a Company Admin to chao site
    And   I go to Admin Settings
    And   I Go To The User Profile Setup under General section
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