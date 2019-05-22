@general @security_profiles

Feature:
  As A Company Admin I Want To Manage Security Profiles

  @general_low_risk @security_profile_access
  Scenario: [General]Company Admin Can Access Security Profiles Page
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    Then  I Should Be Able To See Security Profiles Under General Section

  @general_low_risk @security_profiles_add
  Scenario Outline: [General]Company Admin Can Create A Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Add A Profile Of Type "<profile_type>" Named As "<profile_name>"
    Then  I Should See That The Profile Is Successfully Added

    Examples:
    | profile_type                               | profile_name                             |
    | HR Manager                                 | HR Manager Scriptonce                    |
    | Learning Administrator Page Permissions    | Learning Admin Scriptonce                |
#    | Reports User Page Permissions              | Reports Users Scriptonce                 |
#    | Performance Administrator Page Permissions | Performance Admin Scriptonce             |
#    | User Administrator Page Permissions        | User Admin Scriptonce                    |
#    | Performance Library Administrator          | Performance Library Admin Scriptonce     |
#    | Recruitment Administrator Page Permissions | Recruitment Admin Scriptonce             |
#    | Requisition Permission                     | Requisition Permission Scriptonce        |
#    | Open Requisition Manager                   | Open Requisition Manager Scriptonce      |
#    | Recruitment Administrator Page Permissions | Recruitment Admin Scriptonce             |
#    | Create a Requisition                       | Create a Requisition Scriptonce          |
#    | Onboarding Administrator Page Permissions  | Onboarding Admin Scriptonce              |
#    | SBR AusKey Holder                          | SBR AusKey Holder Scriptonce             |
#    | Succession Planning Overview               | Succession Planning Overview Scriptonce  |
#    | Document Administrator Permissions         | Document Admin Scriptonce                |
#    | Contract Manager                           | Contract Manager Scriptonce              |
#    | Leave Calendar Viewer                      | Leave Calendar Viewer Scriptonce         |
#    | Payroll Admin                              | Payroll Admin Scriptonce                 |
#    | Survey Approver                            | Survey Approver Scriptonce               |
#    | Survey Creator                             | Survey Creator Scriptonce                |

  @general_low_risk @security_profiles_delete
  Scenario: [General]Company Admin Can Delete A Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Delete Security Profile With No Users
    Then  I Should See That The Profile Is Successfully Deleted

  @general_low_risk @security_profiles_add_user @security_profiles_edit
  Scenario: [General]Company Admin Can Edit A Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Edit Security Profile With No Users
    And   I Add company admin scriptonce User To The Security Profile
    And   I Should See That User Is Added To The Profile Successfully

  @general_low_risk @security_profiles_add_user
  Scenario: [General]Company Admin Can Add A User To Specified Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Edit Learning Admin Scriptonce Security Profile
    And   I Add company admin scriptonce User To The Security Profile
    And   I Should See That User Is Added To The Profile Successfully

  @general_low_risk @security_profiles_delete
  Scenario: [General]Company Admin Can Delete Specified Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Delete Learning Admin Scriptonce Security Profile
    Then  I Should See That The Profile Is Successfully Deleted

  @general_low_risk @security_profiles_sections_add
  Scenario: [General]Company Admin Can Add Sections To Specified Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Edit Learning Admin Scriptonce Security Profile
    And   I Go To The Sections Tab Of The Profile
    And   I Select Sections For The Users Assigned To Profile
    | section_name                 |
    | Course Certificate Templates |
    Then  I Should See That The Profile With Details Is Successfully Saved

  @general_low_risk @security_profiles_learningreports_add
  Scenario: [General]Company Admin Can Add Reports To Specified Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Edit Learning Admin Scriptonce Security Profile
    And   I Go To The Reports Tab Of The Profile
    And   I Select Reports For The Users Assigned To Learning Security Profile
    | report_name           |
    | Misconceptions Report |
    Then  I Should See That The Profile With Details Is Successfully Saved

  #NOTE: Currently only works on hcsp.dev
  @general_low_risk @security_profiles_hrreports_add
  Scenario: [General]Company Admin Can Add Reports To Specified Security Profile
    Given I Have Logged In As A Company Admin
    When  I Go To Admin Settings
    And   I Go To "Security Profiles" Under "General" Section
    And   I Can Edit HR Manager - HC-1740 - Omar Security Profile
    And   I Go To The Reports Tab Of The Profile
    And   I Select Reports For The Users Assigned To HR Manager Security Profile
      | section_name | report_name     |
      | HR Core      | HR Audit Report |
      | Leave        | Leave Balances and Accrual Report |
    Then  I Should See That The Profile With Details Is Successfully Saved
