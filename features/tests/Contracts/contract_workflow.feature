@contracts @contract_workflow
  #@contractworkflowTestRailTags
  #C9171

  Feature: As a Company Admin I want to manage the Contract Placeholder Library

  Scenario Outline: [Contracts]Assign contract workflow to users
    Given I Have Logged In as a Contract Admin
    And   I Go To The Menu Contracts Section
    When  I Click On The Assign Contract Button
    And   I Search for an "<user_type>" user with no contract workflows
    Then  I should be able to differentiate user as "<user_type>"

    Examples:
    | user_type  |
    | existing   |
    | onboarding |