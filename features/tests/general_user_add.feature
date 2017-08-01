@General

Feature:
  As a Company Admin I want to manage Internal Employess Successfully

  @general @user_add
  Scenario: Comapny Admin Creating New User
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I Go To The General Users Section
    When  I Click On Add New User Button
    And   I Enter 4 New User Details
    Then  I Should Be Able To Add New Users In To The System

  @general @onboarding_user_add
  Scenario: Comapny Admin Creating New Onboarding User
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I Go To The Onboarding Users Section
    When  I Click On Add New User Button
    And   I Enter 4 New User Details
    Then  I Should Be Able To Add New Users In To The System

#  @general @onboarding_user_edit
#  Scenario: Onboarding User Editing Profile Page
#    Given I Have Logged In as an Onboarding User
#    And   I Go To The Profile Section
#    When  I Click On Personal Details Tab
#    Then  I Should Be Able To Add Emergency Contact Details
#    And I Should Be Able To Add Payment Details