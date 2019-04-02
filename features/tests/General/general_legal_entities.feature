@general @legal_entities


Feature:
  As A Company Admin I Want To Manage Legal Entities

  @general_low_risk @legal_entities_access @C16908
  Scenario: [General]Company Admin Can Access Legal Entities Page
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    Then  I Should Be Able To See Legal Entities under General section


  @general_low_risk @legal_entities_add @C16910
  Scenario: [General]Company Admin Can Create A Legal Entity
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Can Add A Legal Entity
    Then  I Should See That Legal Entity Is Successfully Added


  @general_low_risk @legal_entities_noATO
  Scenario: [General]ATO Details Tab Is Not Accessible
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To General Setup under General section
    Then  I Should Not See The ATO Details Tab


  @general_low_risk @legal_entities_edit @C16913
  Scenario: [General]Company Admin Can Edit A Legal Entity
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Can Edit A Legal Entity
    Then  I Should See That Legal Entity Is Updated Successfully


  @general_low_risk @legal_entities_abnlookup @C16917
  Scenario: [General]Company Admin Can Lookup ABN For Business Name Suggestion
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Click On Add Legal Entity Button
    When  I Enter An Valid ABN in the ABN Field
    Then  I Should See The Corresponding Business Name As Suggestion
    And   I Should Be Able To Edit The Business Name


  @general_low_risk @legal_entities_no_delete @C16915
  Scenario: [General]Legal Entities Cannot Be Deleted
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    Then  I Should See That I Cannot Delete A Legal Entity


  @general_low_risk @legal_entities_pageview @C16918
  Scenario: [General]Company Admin Can View Legal Entities In A Grid
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    Then  I Should View Name, ABN, Is Default And Active Fields For Legal Entity


  @general_low_risk @legal_entities_default_inactive @C16912
  Scenario: [General]Company Admin Cannot Set A Default Entity As InActive
    Given I Have Logged In as A ELMO Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Edit The Default Legal Entity
    Then  I Should See That I Cannot Set The Entity To Inactive


  @general_low_risk @legal_entities_sameabn @C16911
  Scenario: [General]Company Admin Cannot Create Legal Entities With Same ABN
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Click On Add Legal Entity Button
    And   I Enter Existing Legal Entity Details
    Then  I Should Not Be Able To Create Legal Entities With Same ABN


  @general_low_risk @legal_entities_default @C16914
  Scenario: [General]Only One Legal Entity Can Be Set As Default
    Given I Have Logged In as A ELMO Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Edit The Default Legal Entity
    Then  I Should See That I Cannot Set It As Not Default


  @general_low_risk @legal_entities_deactivate @C18909
  Scenario: [General]Legal Entity Linked To User Cannot Be Deactivated
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Edit The Legal Entity Linked To User To Deactivate
    Then  I Should See That I Cannot Deactivate Legal Entity Linked To User


  @general_low_risk @legal_entities_jurisdiction @C21035
  Scenario Outline: [General]Jurisdiction Field Is Read-only When Only One Client Country
    Given That The Client Country Is Set As <country>
    When  I go to Admin Settings
    And   I Go To Legal Entities under General section
    And   I Click On Add Legal Entity Button
    Then  I Should See That The Jurisdiction Is Set To <country>
    And   I Should See That The Jurisdiction Field Is Read-only


    Examples:
      | country     |
      | Australia   |
      | New Zealand |