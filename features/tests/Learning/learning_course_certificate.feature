@learning @courses
  #@learningTestRailTags
  #C1027 C1028
  #@learningTestRailTags

Feature: Manage certificates on the certificate list page
  Background: Generate data when necessory
    Given Create Certificate Templates Once Less Than 15 Exist In The Database

  @smoke_learning @learning_low_risk @learning_manage_certificates @C16442
  Scenario: As A Learning Admin, I can manage a specific certificate on the certificate list page
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    When  I Go To Course Certificate Templates Under Learning Section
#   Check templates are listed with required column whose values are defined in test data. Create templates(>10) when necessary.
    Then  I should see the certificates listed in desceding order
    Then  I Should Create A Certificate With A Unique Name
    When  I Go To The Page Which Has The List Of Current Editing Item
    Then  I Should Edit The Created Certificate
    When  I Go To The Page Which Has The List Of Current Editing Item
    Then  I should Copy The Created Certificate
    When  I Go To The Page Which Has The List Of Current Editing Item
    Then  I should search for The Created Certificate and reset the search