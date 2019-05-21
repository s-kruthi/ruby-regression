@learning @external_training
  #@learningTestRailTags
  #C1789 C1787 C1788 C16734 C16735
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage External Training

  @learning_low_risk @external_training_edit @C1789
  Scenario: [Learning]Learning Admin Can Edit External Training Settings
    Given I Have Logged In as a Learning Admin
    And   I Go To Admin Settings
    When  I Go To "External Training" Under "Learning" Section
    And   I Enable The External Training For Users
    And   I Enable The Description Field
    And   I Set The Description Field As Optional
    And   I Enable The Duration Field
    Then  I Should Be Able To Save The Configuration Successfully


  @learning_low_risk @external_training_disable @C1787 @C1789
  Scenario: [Learning]Learning Admin Can Disable External Training
    Given I Have Logged In as a Learning Admin
    And   I Go To Admin Settings
    When  I Go To "External Training" Under "Learning" Section
    And   I Disable The External Training For Users
    Then  I Should Be Able To Save The Configuration Successfully
    And   I Go To The "Menu Learning" Section
    And   I Should See That I Cannot Add External Training


  @learning_low_risk @external_training_enable @C1789
  Scenario: [Learning]Learning Admin Can Enable External Training
    Given I Have Logged In as a Learning Admin
    And   I Go To Admin Settings
    When  I Go To "External Training" Under "Learning" Section
    And   I Enable The External Training For Users
    And   I Should Be Able To Save The Configuration Successfully
    Then  I Go To The "Menu Learning" Section
    And   I Should See That I Can Add External Training


  @learning_low_risk @external_training_add
  Scenario: [Learning]User Can Add External Training
    Given That External Training Is Enabled For Users
    And   I Have Logged In as a Company Employee
    When  I Go To The "Menu Learning" Section
    And   I Add An External Training
    Then  I Should See That I Can Successfully Submit My Course Request


  @learning_low_risk @external_training_library_disable @C1788
  Scenario: [Learning]User Can Add Own External Training Course Name
    Given That Library Is Disabled For External Training
    And   I Have Logged In as a Company Employee
    When  I Go To The "Menu Learning" Section
    And   I Can Add My Own External Training Course Name
    Then  I Should See That I Can Successfully Submit My Course Request


  @learning_low_risk @C16734
  Scenario: [Learning]Learning Admin Can Disable External Training
    Given That Attachment Is Enabled For External Training
    And   I Have Logged In as a Company Employee
    When  I Go To The "Menu Learning" Section
    And   I Add An External Training
    Then  I Should See That The Attachments Field Is Displayed


  @learning_low_risk @C16735
  Scenario: [Learning]Learning Admin Can Disable External Training
    Given That Expiry Date Is Disabled For External Training
    And   I Have Logged In as a Company Employee
    When  I Go To The "Menu Learning" Section
    And   I Add An External Training
    Then  I Should See That The Expiry Date Field Is Not Displayed


  @learning_low_risk @external_training_course_template_add
  Scenario: [Learning]Learning Admin Can Edit External Training Course Template
    Given I Have Logged In as a Learning Admin
    And   I Go To Admin Settings
    When  I Go To "External Training" Under "Learning" Section
    And   I Click On The Library Sub-Tab
    And   I Add An External Course Template
    Then  I Should Be Able To Save The Changes


  @learning_low_risk @external_training_course_template_edit @C1801
  Scenario: [Learning]Learning Admin Can Edit External Training Course Template
    Given I Have Logged In as a Learning Admin
    And   I Go To Admin Settings
    When  I Go To "External Training" Under "Learning" Section
    And   I Click On The Library Sub-Tab
    And   I Edit An External Course Template
    Then  I Should Be Able To Save The Changes

