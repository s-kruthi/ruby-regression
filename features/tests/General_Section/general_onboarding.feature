@general @onboarding

Feature:
  As a Company Admin I want to manage Internal Employess Successfully

  @general_user_add  @general_high_risk @onboarding_high_risk
  Scenario: [General] [Onboarding] Company Admin Creating New User
    Given I Have Logged In as a ELMO Super Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    When  I Click On "Add New User" Button
    And   I Enter New User Details
    Then  I Should Be Able To Add 1 New Users In To The System

  @onboarding_user_add @general_high_risk @onboarding_high_risk
  Scenario: [General][Onboarding]Company Admin Creating New Onboarding User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Onboarding Users under Onboarding section
    When  I Click On Add New User Button
    And   I Enter New User Details
    Then  I Should Be Able To Add 10 New Users In To The System

  @hr_add_contact_emergency @general_high_risk @onboarding_high_risk
  Scenario: [General][Onboarding]General User Editing Profile Page - Emergency Contact Details
    Given I Have Logged In as a Company Admin
    And   I Go To The Menu Profile Section
    And   I Click On Personal Details Sub Tab
    When  I Click On Edit Emergency Contact Details Icon
    And   I Click On Add Emergency Contact Details Button
    And   I Use Add Emergency Contact Details
    Then  I Should Be Able To Add Emergency Contact Details

  @hr_add_contact_nok @general_high_risk @onboarding_high_risk
  Scenario: [General][Onboarding]Onboarding User Editing Profile Page - Next of Kin
    Given I Have Logged In as a Company Admin
    And   I Go To The Menu Profile Section
    And   I Click On Personal Details Sub Tab
    When  I Click On Edit Next Of Kin Icon
    And   I Click On Add Next Of Kin Button
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



   # @wip
#    Scenario: This is a work in progress - WIP
#      Given I Have Logged In With Given Credential
#        |login_type|login_name|login_password|login_site|
#        |Company Admin|company.omar |Admin1234567|tmsfull|
#        |Company Admin|company.omar|Admin1234567|faraz1 |
#      And   I Go To The General Users Section
#      And   I Search For A Specific User
#      Then  I Should Be Able To Delete The Specific User


