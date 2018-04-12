@contracts @contract_workflow
  #@ContractTestRailTags
  #C9670 C9689
  #@ContractTestRailTags


  Feature: As a Company Admin I want to manage the Contract Workflow for users

  @differentiate_users_assign_contract @contracts_high_risk
  Scenario Outline: [Contracts]Differentiate users while assigning contracts
    Given I Have Logged In as a Contract Admin
    And   I Go To The Menu Contracts Section
    When  I Click On The Assign Contract Button
    And   I Search For An "<user_type>" User With No Contract Workflow Assigned
    Then  I Should Be Able To Differentiate User As "<user_type>"

    Examples:
    | user_type  |
    | existing   |
    | onboarding |

  @assign_contract @contracts_high_risk
  Scenario Outline: [Contracts]Company Admin can assign contracts to users with no contract workflow
    Given I Have Logged In as a Contract Admin
    And   I Go To The Menu Contracts Section
    When  I Click On The Assign Contract Button
    And   I Search For An "<user_type>" User With No Contract Workflow Assigned
    And   I Choose The User Who Is To Be Assigned A Contract
    Then  I Should See That The User Has Been Assigned A Contract

    Examples:
    | user_type  |
    | existing   |
    | onboarding |