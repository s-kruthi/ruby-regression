@employee_contracts

Feature:
  I want to Test if I can Successfully Manage Contract Library

  @employee_contract_add @general_high_risk
  Scenario: [General]Create a New Contract
    Given I Have Logged In as a Company Admin to staging5 site
    And   I go to Admin Settings
    And   I Go To Contract Library Under General Section
    When I click on New Contract Button
    And I Enter New Employee Contract Details
    Then I Should Be Able To Create A New Contract

  @employee_contract_search @general_high_risk
  Scenario: [General]Search an Existing Contract
    Given I Have Logged In as a Company Admin to staging5 site
    And   I go to Admin Settings
    And   I Go To Contract Library under General section
    Then I Should Be Able To Search For An Employee Contract

  @employee_contract_edit @general_high_risk
  Scenario: [General]Edit an Existing Contract
    Given I Have Logged In as a Company Admin to staging5 site
    And   I go to Admin Settings
    And   I Go To Contract Library under General section
    When I Search For An Employee Contract
    Then I Should Be Able To Edit An Employee Contract

  @employee_contract_copy @general_low_risk
  Scenario: [General]Copy an Existing Contract
    Given I Have Logged In as a ELMO Admin to staging5 site
    And   I go to Admin Settings
    And   I Go To Contract Library under General section
    When I Search For An Employee Contract
    Then I Should Be Able To Copy An Employee Contract

  @employee_contract_hide @general_low_risk
  Scenario: [General]Hide/Unhide an Existing Contract
    Given I Have Logged In as a Company Admin to staging5 site
    And   I go to Admin Settings
    And   I Go To Contract Library under General section
    When I Search For An Employee Contract
#    Then I Should Be Able To Hide/Unhide An Employee Contract

  @employee_contract_delete @general_low_risk
  Scenario: [General]Delete an Existing Contract
    Given I Have Logged In as a Company Admin to staging5 site
    And   I go to Admin Settings
    And   I Go To Contract Library under General section
    When I Search For An Employee Contract
#    Then I Should Be Able To Delete An Employee Contract