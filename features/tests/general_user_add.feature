@General

Feature:
  As a Company Admin I want to manage Internal Employess Successfully

  @general @user_add
  Scenario: Comapny Admin Creating New User
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I Go To The General Users Section
    When  I Click On Add New User Button
    And   I Enter 1 New User Details
    Then  I Should Be Able To Add New Users In To The System

  @general @onboarding_user_add
  Scenario: Comapny Admin Creating New Onboarding User
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I Go To The Onboarding Users Section
    When  I Click On Add New User Button
    And   I Enter 1 New User Details
    Then  I Should Be Able To Add New Users In To The System

  @wip
  Scenario: Onboarding User Editing Profile Page - WIP
    Given I Have Logged In as a Company Admin to faraz1 site
    And   I Go To The Menu Profile Section
    And   I Click On Personal Details Sub Tab
    When  I Click On Edit Emergency Contact Details Icon
    And   I Click On Add Emergency Contact Details Button
    And   I Use Emergency Contact Details
    Then  I Should Be Able To Add Emergency Contact Details
    And   I Should Be Able To Add Payment Details