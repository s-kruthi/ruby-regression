@contracts @contract_workflow
  #@contractworkflowTestRailTags
  #C9670

  Feature: As a Company Admin I want to manage the Contract Workflow for users

  @assign_contract
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