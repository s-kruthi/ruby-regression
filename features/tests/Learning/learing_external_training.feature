@learning @external_training
  #@learningTestRailTags
  #C
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage External Training

  @learning_low_risk @external_training_enable @test
  Scenario: [Learning]Learning Admin Can Enable External Training
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    And   I Go To External Training under Learning section