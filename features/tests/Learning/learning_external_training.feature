@learning @external_training
  #@learningTestRailTags
  #C
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage External Training

  @learning_low_risk @external_training_enable @wip
  Scenario: [Learning]Learning Admin Can Enable External Training
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    When  I Go To External Training under Learning section
    And   I Enable The External Training For Users
    And   I Enable The Description Field
    And   I Set The Description Field As Optional
    And   I Enable The Training Duration Field
    Then  I Should Be Able To Save The Configuration Successfully


  @learning_low_risk @external_training_disable @wip
  Scenario: [Learning]Learning Admin Can Enable External Training
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    When  I Go To External Training under Learning section
    And   I Disable The External Training For Users
    Then  I Should Be Able To Save The Configuration Successfully