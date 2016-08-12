@Career_Preference_scenarios
Feature:
  I want to test if user can successfully add their career preferences by answering the default Questions

  @Login_test_case
  Scenario: Career Preference Tab Is Disabled (Given The Succession Module Is Not Enabled)
    Given I Have Logged In As A Restricted User
    When I Try To Navigate To The Career Preference Tab
    Then I Verify The Tab Is Disabled
  @enabled
  Scenario: Career Preference Tab Is Enabled (Happy Path)
    Given I Have Logged In As A Regular User
    When I Try To Navigate To The Career Preference Tab
    And I Verify The Tab Is Enabled
    Then I Should Be Able To validate The Career Preference Section With Header And Text

  @Default_question
# We reset the user profile So that its ready for the next test run, This Way we dont exhaust the test data
  Scenario: Career Preference Section Has Default Questions(Happy Path)
    Given I Have Logged In As A Regular User
    When I Navigate To The Career Preference Tab
    And I Verify My Profile Details Are Displayed Properly
    Then Under Career Preference Section, I Should Be Able To Edit The Willing To Relocation Question
    And I Can Edit The Preferred Location Question
    And I Can Enter The Available Position
    And I Can Edit What My Next Career Move Would Be
    And I Should Be Able To Save It Successfully
    Then I Reset The User Profile Back To Initial

    @list_of_positions
  Scenario: Career Preference Section Has Click To Select List Of Positions (Happy Path)
    Given I Have Logged In As A Regular User
    When I Navigate To The Career Preference Tab
    And I Click To View The List Of Available Positions
    Then I Am Prompted With A Modal With The List Of Positions
    And I Am Able To Validate The Search Field
    When I Validate The Position Description By Clicking On View
    Then I Am Taken To The Full View Description
    And I Should Be Able To Add It To My Preferred Position Field
    Then I Reset The User Profile Back To Initial

  Scenario: Configuring The Career Preference Tab And Section As Admin (Negative scenario, Disable the CP)
    Given I Have Logged In As An Admin
    When I Navigate To Career Preference Tab Within User Profile Setup Tab
    And I Disable The Career Preference Tab For That Particular User
    Then I Try To Navigate To The Career Preference Tab As a User
    And I Verify The Career Preference Tab Is Disabled
    Then I Reset The User Profile Back To Initial


# This Scenario requires a tear down as consecutive test run will add the same question again an again, and Deleting a Question is not mentioned
  # in the requirement sheet
  Scenario: Configuring The Career Preference Tab Preferred Questions As An Admin( Lets Add A new Question)
    Given I Have Logged In As An Admin
    When I Navigate To Career Preference Tab Within User Profile Setup Tab
    Then I Should Be Able to Add A New Question

  Scenario: Configuring The Career Preference Tab Preferred Questions As An Admin( Lets Disable the willing to relocate Question)
    Given I Have Logged In As An Admin
    When I Navigate To Career Preference Tab Within User Profile Setup Tab
    Then I Should Be Able to Add A New Question

