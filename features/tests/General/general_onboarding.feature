@general @onboarding

Feature:
  As a Company Admin I want to manage Users Successfully

  @general_user_add @general_high_risk @onboarding_high_risk
  Scenario: [General] [Onboarding] Company Admin Creating New User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    When  I Click On "Add New User" Button
    Then  I Should Be Able To Add 1 New "Non-ELMO" Users In To The System With "auto" As First Name And "scriptonce" As Last Name And "manager1.scriptonce1" as Manager
    And   I Click On "Users" Breadcrumb Menu
    And   I Click On "Notify Users" Button
    And   I Click On "Notify All Users" Button
    Then  I Should Be Able to Notify All Users


  @onboarding_user_add @general_high_risk @onboarding_high_risk
  Scenario: [General][Onboarding]Company Admin Creating New Onboarding User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Onboarding Users under Onboarding section
    When  I Click On "New Onboarding User" Button
    Then  I Should Be Able To Add 5 New "Non-ELMO" Users In To The System With "auto" As First Name And "scriptonce" As Last Name And "manager1.scriptonce1" As Manager


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


  @general_low_risk @new_user_details_legal_entity @legal_entities @C16922
  Scenario: [General]Default Legal Entity Is Set For Newly Created User
    Given That Company Legal Entity Field Is Visible
    And   I Have Created A New User
    When  I Click On The Profile Tab Of The Newly Created User
    Then  I Should See That The Default Entity Is Set For the User's Company Field


  @general_low_risk @legal_entities @user_details_legal_entity_edit
  Scenario: [General]Company Admin Can Choose From Existing Legal Entities For Users
    Given That Company Legal Entity Field Is Editable
    And   I Have Logged In As A Company Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    When  I Choose To Edit An Existing User's Profile
    Then  I Can See That I Can Choose To Set The Company Legal Entity From The Existing Entities


  @general_low_risk @user_details_cost_centre_edit @payroll_cost_centre @C16941
  Scenario: [General]Company Admin Can Set Cost Centre From Existing Values In Elmo Payroll
    Given That Cost Centre Field Is Editable
    And   I Have Logged In As A Company Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    When  I Choose To Edit An Existing User's Profile
    Then  I Should See The Cost Centre Field
    And   I Can See That I Choose To Set The Cost Centre From The Existing Cost Centres


  @general_user_emp_add @general_high_risk @onboarding_high_risk
  Scenario: [General] [Onboarding] Company Admin Creating New User
    Given I Have Logged In as a Company Admin
    And   I go to Admin Settings
    And   I Go To Users under General section
    When  I Click On "Add New User" Button
    Then  I Should Be Able To Add 2 New "Non-ELMO" Users In To The System With "auto" As First Name And "scriptonce" As Last Name
  @general_low_risk @hr_nz_personal_details @C21013
  Scenario Outline: [General]NZ Address Format In Personal Details Section
    Given I Have Logged In as a Company Admin
    And   I Go To The Menu Profile Section
    When  I Edit <contact_type> Details
    Then  I Can See The Suburb/Town/City Field

    Examples:
      | contact_type |
      | Emergency Contact |
      | Next of Kin       |
#this will be changed as part of another ticket HC-1526
#    | Contact           |
