@general @onboarding

Feature:
  As a Company Admin I want to manage Users Successfully

  @general_user_add @general_high_risk @onboarding_high_risk
  Scenario: [General] [Onboarding] Company Admin Creating New User
    Given I Have Logged In as a ELMO Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    When  I Click On "Add New User" Button
    Then  I Should Be Able To Add 5 New "ELMO" Users In To The System With "auto" As First Name And "test" As Last Name And "manager2.omar2" As Manager Username


  @onboarding_user_add @general_high_risk @onboarding_high_risk
  Scenario: [General][Onboarding]Company Admin Creating New Onboarding User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Onboarding Users under Onboarding section
    When  I Click On "New Onboarding User" Button
    Then  I Should Be Able To Add 5 New "Non-ELMO" Users In To The System With "auto" As First Name And "test" As Last Name And "manager1.omar1" As Manager Username


  @hr_add_contact_emergency @general_high_risk @onboarding_high_risk
  Scenario: [General][Onboarding]General User Editing Profile Page - Emergency Contact Details
    Given I Have Logged In as a Company Admin
    And   I Go To The Menu Profile Section
    And   I Click On "Personal Details" Sub Tab
    When  I Click On Edit Emergency Contact Details Icon
    And   I Use Add "Emergency Contact" Details
    Then  I Should Be Able To Add Emergency Contact Details


  @hr_add_contact_nok @general_high_risk @onboarding_high_risk
  Scenario: [General][Onboarding]Onboarding User Editing Profile Page - Next of Kin
    Given I Have Logged In as a Company Admin
    And   I Go To The Menu Profile Section
    And   I Click On "Personal Details" Sub Tab
    When  I Click On Edit Next Of Kin Icon
    And   I Use Add Next Of Kin Details
    Then  I Should Be Able To Add Next Of Kin Details


  @general_user_deactivate @general_low_risk @onboarding_low_risk
  Scenario: [General][Onboarding]Onboarding or General User List page - De-Activate user
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    And   I Search For A Specific User named auto1.test1
    Then  I Should Be Able To use De-activate user Action on The Specific User


  @general_user_edit_profile @general_low_risk @onboarding_user_edit_profile @onboarding_low_risk @wip
  Scenario: [General][Onboarding]Onboarding or General User List page - Edit Profile Information
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    And   I Search For A Specific User named auto1.test1
    Then  I Should Be Able To use Edit User Profile Action On The Specific User
    And   I Should Be Able to Fill In All Profile Related Information
    And   I Should Be Able To Save The Information Successfully


  #Currently works only on nick01 staging
  @general_low_risk @general_onboarding_user_setup @C16376
  Scenario: [General][Onboarding]Elmo Admins can only access Onboarding User Setup
    Given I Have Logged In As A ELMO Admin
    When  I go to Admin Settings
    Then  I Should Be Able To Access The Onboarding User Setup In Onboarding Section
    And   I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Should Not Be Able To Access The Onboarding User Setup In Onboarding Section