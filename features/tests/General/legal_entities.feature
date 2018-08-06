@general @legal_entities

Feature:
  As A Company Admin I Want To Manage Legal Entities


  @general_low_risk
  Scenario: [General]Company Admin Can Access Legal Entities Page
    Given That Legal Entity Is Enabled
    And   I Have Logged In as a Company Admin
    When  I go to Admin Settings
    Then  I Should Be Able To See Legal Entities under General section


  @general_low_risk @test
  Scenario: [General]Company Admin Can Create A Legal Entity
    Given That Legal Entity Is Enabled
    And   I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Can Add A Legal Entity
   # Then  I Should Be Able To See Legal Entities under General section


  @general_low_risk
  Scenario: [General]ATO Details Tab Is Not Accessible
    Given That Legal Entity Is Enabled
    And   I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To General Setup under General section
    Then  I Should Not See The ATO Details Tab