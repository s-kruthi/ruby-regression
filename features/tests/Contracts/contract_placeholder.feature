@contracts @contract_placeholders
  #@contractplaceholderlibraryTestRailTags
  #C9171

  Feature: As a Company Admin I want to manage the Contract Placeholder Library

  @create_placeholder  @placeholders_low_risk
    Scenario Outline: [Contracts]Company Admin can create new contract placeholders
      Given I Have Logged In as a Contract Admin
      And   I go to Admin Settings
      And   I Go To Contract Placeholder Library Under General Section
      When  I Click on "New Placeholder" Button
      And   I Enter The Placeholder Title
      And   I Choose The Type as "<placeholder_type>"
      And   I Enter The Placeholder Text
      Then  I Should Be Able To Create A New Contract Placeholder

      Examples:
        | placeholder_type |
        | Number           |
        | Date             |
        | Text             |
        | Currency         |
        | Text Area        |

