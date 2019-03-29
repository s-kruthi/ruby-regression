@general @security_profiles


Feature:
  As A Company Admin I Want To Manage Security Profiles

  @general_low_risk @security_profile_access
  Scenario: [General]Company Admin Can Access Security Profiles Page
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    Then  I Should Be Able To See Security Profiles under General section


  @general_low_risk @security_profiles_add
  Scenario Outline: [General]Company Admin Can Create A Security Profile
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Security Profiles under General section
    And   I Can Add A Profile Of Type <profile_type> Named As <profile_name>
    Then  I Should See That The Profile Is Successfully Added

    Examples:
    | profile_type                               | profile_name                             |
    | Learning Administrator Page Permissions    | Learning Admin Scriptonce                |
    | Reports User Page Permissions              | Reports Users Scriptonce                 |
    | Performance Administrator Page Permissions | Performance Admin Scriptonce             |
    | User Administrator Page Permissions        | User Admin Scriptonce                    |
    | Performance Library Administrator          | Performance Library Admin Scriptonce     |
    | Recruitment Administrator Page Permissions | Recruitment Admin Scriptonce             |
    | Requisition Permission                     | Requisition Permission Scriptonce        |
    | Open Requisition Manager                   | Open Requisition Manager Scriptonce      |
    | Recruitment Administrator Page Permissions | Recruitment Admin Scriptonce             |
    | Create a Requisition                       | Create a Requisition Scriptonce          |
    | Onboarding Administrator Page Permissions  | Onboarding Admin Scriptonce              |
    | SBR AusKey Holder                          | SBR AusKey Holder Scriptonce             |
    | Succession Planning Overview               | Succession Planning Overview Scriptonce  |
    | HR Manager                                 | HR Manager Scriptonce                    |
    | Document Administrator Permissions         | Document Admin Scriptonce                |
    | Contract Manager                           | Contract Manager Scriptonce              |
    | Leave Calendar Viewer                      | Leave Calendar Viewer Scriptonce         |
    | Payroll Admin                              | Payroll Admin Scriptonce                 |
    | Survey Approver                            | Survey Approver Scriptonce               |
    | Survey Creator                             | Survey Creator Scriptonce                |


  @general_low_risk @security_profiles_delete
  Scenario: [General]Company Admin Can Delete A Security Profile
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Security Profiles under General section
    And   I Can Delete Security Profile With No Users
    Then  I Should See That The Profile Is Successfully Deleted


  @general_low_risk @security_profiles_add_user @security_profiles_edit
  Scenario: [General]Company Admin Can Edit A Security Profile
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Security Profiles under General section
    And   I Can Edit Security Profile With No Users
    And   I Add company admin scriptonce User To The Security Profile
    And   I Should See That User Is Added To The Profile Successfully


  @general_low_risk @security_profiles_add_user
  Scenario: [General]Company Admin Can Add A User To Specified Security Profile
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Security Profiles under General section
    And   I Can Edit Learning Admin Scriptonce Security Profile
    And   I Add company admin scriptonce User To The Security Profile
    And   I Should See That User Is Added To The Profile Successfully


  @general_low_risk @security_profiles_delete
  Scenario: [General]Company Admin Can Delete Specified Security Profile
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Security Profiles under General section
    And   I Can Delete Learning Admin Scriptonce Security Profile
    Then  I Should See That The Profile Is Successfully Deleted


  @general_low_risk @security_profiles_add_reports
  Scenario: [General]Company Admin Can Add Sections To Specified Security Profile
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Security Profiles under General section
    And   I Can Edit Learning Admin Scriptonce Security Profile
    And   I Go To The Sections Tab Of The Profile
    And   I Select Sections For The Users Assigned To Profile
    | section_name                 |
    | Course Certificate Templates |
    Then  I Should See That The Profile With Filter Details Is Successfully Saved


  @general_low_risk @security_profiles_add_reports @test
  Scenario: [General]Company Admin Can Add Reports To Specified Security Profile
    Given I Have Logged In as a Company Admin
    When  I go to Admin Settings
    And   I Go To Security Profiles under General section
    And   I Can Edit Learning Admin Scriptonce Security Profile
    And   I Go To The Reports Tab Of the Profile
    And   I Select Reports For The Users Assigned To Profile
    | report_name     |
    | None            |
    Then  I Should See That The Profile Is Successfully Saved








