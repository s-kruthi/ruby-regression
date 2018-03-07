@rewards @badges

Feature:
  As a Company Admin I want to manage Badges

  @create_badge  @rewards_low_risk
  Scenario: [Rewards]Company Admin Creating A New Badge Available To All Users
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Badge Management under Rewards section
    When  I Click On "Add Badge" Button
    And   I Enter The Badge Title
    And   I Upload The Badge Image
    And   I Select The Availability As All Users
    Then  I Should Be Able To Create A New Badge Successfully