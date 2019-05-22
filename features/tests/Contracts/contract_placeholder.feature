@contracts @contract_placeholders
  #@ContractTestRailTags
  # C9654 C9656
  #@ContractTestRailTags

  Feature: As a Company Admin I want to manage the Contract Placeholder Library

  @create_contract_placeholder  @contracts_low_risk
    Scenario Outline: [Contracts]Company Admin can create new contract placeholders
      Given I Have Logged In As A Contract Admin
      And   I Go To Admin Settings
      And   I Go To "Contract Placeholder Library" Under "General" Section
      When  I Click on "New Placeholder" Button
      And   I Enter The Contract Placeholder Title
      And   I Choose The Type as "<contract_placeholder_type>"
      And   I Enter The Contract Placeholder Text
      Then  I Should Be Able To Create A New Contract Placeholder

      Examples:
        | contract_placeholder_type |
        | Number           |
        | Date             |
        | Text             |
        | Currency         |
        | Text Area        |

  @contracts_textarea_characteristics  @contracts_low_risk
    Scenario: [Contracts]Default value for Text area placeholders have CK editor and size limitation
      Given I Have Logged In As A Contract Admin
      And   I Go To Admin Settings
      And   I Go To "Contract Placeholder Library" Under "General" Section
      When  I Click on "New Placeholder" Button
      And   I Enter The Contract Placeholder Title
      And   I Choose The Type as "Text Area"
      And   I Enter The Contract Placeholder Text
      Then  I Should See The Default Value field Has a CK Editor
      And   I Should See That The Field Is Limited to "5000" characters
      And   I Should See The Instructional Text Indicating The Size Limitation

  @contracts_low_risk @search_contract_placeholder
    Scenario: Search for Existing Contract Placeholders
      Given I Have Logged In As A Contract Admin
      And   I Go To Admin Settings
      And   I Go To "Contract Placeholder Library" Under "General" Section
      When  I Search For Contract Placeholders Starting With "Auto"
      Then  I Should Be Able To See The Contract Placeholders
