@elmo_config

Feature:
  As a Company Admin I want to manage Elmo configurations Successfully

  @elmo_config_general_configuration @general_low_risk
  Scenario: [General]As an ELMO Admin, I want to be able to modify ELMO configuration under General Setup and change various settings
    Given I Have Logged In As A ELMO Admin
    And   I go to Admin Settings
    And   I Go To General Setup under General section
    And   I Click On "ELMO Configuration" Tab
    When  I Change "Lock course with enrolments" ELMO Configuration To "No"
    And   I Change "New User Contract" ELMO Configuration to "Disabled"
    And   I Change "New OB User Contract" ELMO Configuration to "Disabled"
    Then  I Should Be Able To Save Configuration Details


  @elmo_config_setup @general_low_risk
#    ## Nested step to setup system configuration and the nested steps are as commented
#    Given I Have Logged In As A ELMO Admin
#    And   I go to Admin Settings
#    And   I Go To General Setup under General section
#    And   I Click On "ELMO Configuration" Tab
#    When  I Change "Lock course with enrolments" ELMO Configuration To "Disabled"
#    Then  I Should Be Able To Save Configuration Details
  Scenario: [Genera]As an ELMO Admin, I want to be able to modify ELMO configuration under General Setup and change various settings
    * The "ELMO Admin" Configure The "Lock course with enrolments" To No