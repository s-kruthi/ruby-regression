@learning @external_training
  #@learningTestRailTags
  #C
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage External Training

  @learning_low_risk @external_training_edit
  Scenario: [Learning]Learning Admin Can Edit External Training Settings
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    When  I Go To External Training under Learning section
    And   I Enable The External Training For Users
    And   I Enable The Description Field
    And   I Set The Description Field As Optional
    And   I Enable The Training Duration Field
    Then  I Should Be Able To Save The Configuration Successfully


  @learning_low_risk @external_training_disable
  Scenario: [Learning]Learning Admin Can Disable External Training
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    When  I Go To External Training under Learning section
    And   I Disable The External Training For Users
    Then  I Should Be Able To Save The Configuration Successfully
    And   I Go To The Menu Learning Section
    And   I Should See That I Cannot Add External Training


  @learning_low_risk @external_training_enable
  Scenario: [Learning]Learning Admin Can Enable External Training
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    When  I Go To External Training under Learning section
    And   I Enable The External Training For Users
    And   I Should Be Able To Save The Configuration Successfully
    Then  I Go To The Menu Learning Section
    And   I Should See That I Can Add External Training


  @learning_low_risk @external_training_add
  Scenario: [Learning]User Can Add External Training
    Given That External Training Is Enabled For Users
    And   I Have Logged In as a Company Employee
    When  I Go To The Menu Learning Section
    And   I Add An External Training
    Then  I Should See That I Can Successfully Submit My Course Request
