@learning @courses
  #@learningTestRailTags
  #C1802 C1803
  #@learningTestRailTags

Feature: Manage cost category for learning
  Cost categories are used to track costs associated with course activities

  @smoke_learning5 @create_new_learning_cost @C1802 @learning_high_risk @loc_transform
  Scenario: [Learning]Create A New Cost Category
    Given I Have Logged In as a Learning Admin
    And   I Go To Admin Settings
    And   I Go To Cost Categories Under Learning Section
    #   Find the local_transforms.rb for the undefined Gherkin step
    When  I Create A Cost Category With A Unique Name
    Then  I Should Be Able To Create The Learning Cost Category

  @smoke_learning5 @manipulate_learning_cost_category @C1802 @learning_high_risk @loc_transform
  Scenario: [Learning]Create A New Cost Category
    Given I Have Logged In As A Learning Admin
    When   I Go To Admin Settings
    And   I Go To Cost Categories Under Learning Section
    Then  I Can Toggle The Visibility State Of Existing Cost Category
    When  I Edit The Cost Category
    #   Find the local_transforms.rb for the undefined Gherkin step
    Then  I Can Edit The Learning Cost Category With A Unique Sentence