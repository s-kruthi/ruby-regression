@learning @learning_certificate_template
  #@learningTestRailTags
  #@C16442
  #@learningTestRailTags

#  Currently the Certificate feature is not deployed to TMSFull yet
Feature: Manage Certificates On The Certificate List Page
  Background: Generate Data When Necessory
    Given Create Certificate Templates Once Less Than 15 Exist In The Database

  @smoke_learning6 @learning_low_risk @learning_manage_certificates @C16442 @C16440 @C16441 @C16551 @C16553 @C16554 @C16555 @C16736 @loc_transform
  Scenario: As A Learning Admin, I Can Manage A Specific Certificate Template On The Template List Page
    Given I Have Logged In As A Company Admin
    And   I Go To Admin Settings
    When  I Go To Course Certificate Templates Under Learning Section
#   Check templates are listed with required column whose values are defined in test data. Create templates(>10) when necessary.
    Then  I Should See The Certificates Listed In Descending Order
#   Find the local_transforms.rb for the undefined Gherkin step
    Then  I Should Create A Certificate With A Unique Name
    When  I Go To The Page Which Has The List Of Current Editing Item
    Then  I Should Edit The Created Certificate
    When  I Go To The Page Which Has The List Of Current Editing Item
    Then  I Should Copy The Created Certificate
    When  I Go To The Page Which Has The List Of Current Editing Item
    Then  I Should Search For The Created Certificate And Reset The Search