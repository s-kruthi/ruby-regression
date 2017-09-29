@general @onboarding

Feature:
  As a Company Admin I want to manage Internal Employess Successfully

  @general_user_add
  Scenario: Comapny Admin Creating New User
    Given I Have Logged In as a Company Admin to tony01 site
    And   I go to Admin Settings
    And   I Go To The Users under General section
    When  I Click On "Add New User" Button
    And   I Enter New User Details
    Then  I Should Be Able To Add 3 New Users In To The System

  @onboarding_user_add
  Scenario: Comapny Admin Creating New Onboarding User
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I go to Admin Settings
    And   I Go To The Users under Onboarding section
    When  I Click On Add New User Button
    And   I Enter New User Details
    Then  I Should Be Able To Add 10 New Users In To The System

  @hr_add_contact_emergency
  Scenario: General User Editing Profile Page - Emergency Contact Details
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I Go To The Menu Profile Section
    And   I Click On Personal Details Sub Tab
    When  I Click On Edit Emergency Contact Details Icon
    And   I Click On Add Emergency Contact Details Button
    And   I Use Add Emergency Contact Details
    Then  I Should Be Able To Add Emergency Contact Details

  @hr_add_contact_nok
  Scenario: Onboarding User Editing Profile Page - Next of Kin - WIP
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I Go To The Menu Profile Section
    And   I Click On Personal Details Sub Tab
    When  I Click On Edit Next Of Kin Icon
    And   I Click On Add Next Of Kin Button
    And   I Use Add Next Of Kin Details
    Then  I Should Be Able To Add Next Of Kin Details

  @general_user_delete
  Scenario: Onboarding or General User List page - delete user
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I go to Admin Settings
    And   I Go To The Users under General section
    And   I Search For A Specific User
    Then  I Should Be Able To Delete The Specific User


  @general_user_notify
  Scenario: Onboarding or General User List page - delete user
    Given I Have Logged In as a Company Admin to nick02 site
    And   I go to Admin Settings
    And   I Go To The Users under General section
    And   I Click on "Notify Users" Button
    And   I Search For A Specific User
    Then  I Should Be Able To Delete The Specific User


#    @wip
#    Scenario: This is a work in progress - WIP
#      Given I Have Logged In With Given Credential
#        |login_type|login_name|login_password|login_site|
#        |Company Admin|company.omar |Admin1234567|tmsfull|
#        |Company Admin|company.omar|Admin1234567|faraz1 |
#      And   I Go To The General Users Section
#      And   I Search For A Specific User
#      Then  I Should Be Able To Delete The Specific User



