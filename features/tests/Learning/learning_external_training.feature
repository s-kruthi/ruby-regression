@learning @external_training
  #@learningTestRailTags
  #C7206  C7207 C1804
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage External Training

  @learning_low_risk @external_training_enable
  Scenario: [Learning]Learning Admin Can Enable External Training
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    When  I Go To External Training under Learning section
    And   I 
