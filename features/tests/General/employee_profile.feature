@employee_profile @general

Feature:
  As A Company Admin I Would Like To Edit An Employee's Details Including Personal And Payment

  @ViewEmploymentDetails @general_high_risk
  Scenario: [General]View Employees hourly Rate and Salary Details (Payment Details)
    Given I Am On The Employee's Payment Details Section
    When  I Try To View The Payment Details Of An Employee For A Particular Employment Type
    Then  I Should Be Able To Unmask The Rate And Salary Details By Tapping The Show Button


  @ViewTfnDetails @general_high_risk
  Scenario: [General]Add Payment Details ( TFN Details )
    Given I Am On The Employee's Payment Details Section
    When  I Try To View The TFN Details Of An Employee
    Then  I Should Be Able To Unmask The TFN Number By Tapping The Show Button


  @ViewOwnEmployeeDetails @general_low_risk
  Scenario: [General]View Employee Profile to Verify Sub Tabs
    Given I Have Logged In As A Company Admin
    And   I Go To The Menu Profile Section
    And   I Should Be Able To Click Resume Sub-Tab
    And   I Should Be Able To Click My Career Sub-Tab
    And   I Should Be Able To Click Personal Details Sub-Tab
    And   I Should Be Able To Click Payment Details Sub-Tab
    And   I Should Be Able To Click Recognition Sub-Tab


  @ViewAnotherEmployeeDetails @general_low_risk
  Scenario: [General]View Employee Profile to Verify Sub Tabs
    Given I Have Logged In As A Company Manager
    And   I Go To The Menu My Team Section
    And   I Search An Employee Named auto1.test1
#    Then  I Should Be Able To View The Employee Profile for auto1.test1 And Verify Email Address auto1.test1@elmodev.com
#    And   I Should Be Able To Click Activity Sub-Tab
    And   I Should Be Able To Click Resume Sub-Tab
    And   I Should Be Able To Click My Career Sub-Tab
    And   I Should Be Able To Click Personal Details Sub-Tab
    And   I Should Be Able To Click Payment Details Sub-Tab
    And   I Should Be Able To Click Recognition Sub-Tab


  @general_low_risk @user_profile_note @user_profile_addnote @C16458
  Scenario Outline: [General]Can Add Note To A User Profile With Different Visibility Settings
    Given I Have Logged In As A Company Manager
    And   I Go To The Menu My Team Section
    And   I Search An Employee Named auto1.scriptonce1
    When  I Click On "Add New Note" Button
    And   I Enter Note
    And   I Add An Attachment To The Note
    And   I Set The Note Visibility To <visibility_value>
    And   I Click On Add Note Button
    Then  I Should See That The Note Has Been Added Successfully

    Examples:
      | visibility_value |
      | default          |
      | Admin            |
      | Manager          |
      | HR Manager       |
      | Any Manager      |

    
  @general_low_risk @user_paymentdetails_autopay @user_paymentdetails_default_autopay @C16724
  Scenario: [General] Company Admin Can View Autopay Default Setting As No
    Given I Have Logged In As A Payroll Admin
    And   I go to Admin Settings
    And   I Go To Users Under General Section
    When  I Search For An Employee With Default Autopay Setting
    Then  I Can View The Default Autopay Setting As No


  @general_low_risk @user_paymentdetails_autopay @user_paymentdetails_autopay_message @C16725
  Scenario: [General] Company Admin Can View Autopay Message
    Given I Have Logged In As A Payroll Admin
    And   I go to Admin Settings
    And   I Go To Users Under General Section
    When  I Search For An Employee With Employment Details
    And   I Edit The User's Employment Details Section
    And   I Set The Autopay Setting As Yes
    Then  I Should Be Displayed With Autopay Message


  @general_low_risk @user_paymentdetails_autopay @user_paymentdetails_autopay_edit @C16725
  Scenario: [General] Company Admin Can View Autopay Is Set to Default No
    Given I Have Logged In As A Payroll Admin
    And   I go to Admin Settings
    And   I Go To Users Under General Section
    When  I Search For An Employee With Employment Details
    And   I Edit The User's Employment Details Section
    And   I Set The Autopay Setting As Yes
    And   I Save The Payment Details Changes For Autopay
    Then  I Should Be Able To See The Autopay Setting Changed To Yes
s

  @general_low_risk @user_profile_note @user_profile_editnote @C16877
  Scenario: [General]Can Edit Note To A User Profile
    Given I Have Logged In As A Company Manager
    And   I Go To The Menu My Team Section
    And   I Search An Employee Named auto1.scriptonce1
    When  I Edit Note Added By Me
    And   I Click On Save Note Button
    Then  I Should See That The Note Has Been Edited Successfully


  @general_low_risk @user_profile_note @user_profile_deletenote @C16877
  Scenario: [General]Can Delete Note To A User Profile
    Given I Have Logged In As A Company Manager
    And   I Go To The Menu My Team Section
    And   I Search An Employee Named auto1.scriptonce1
    When  I Delete Note Added By Me
    Then  I Should See That The Note Has Been Deleted Successfully


  @general_low_risk @user_profile_note @user_profile_managenote @C16456
  Scenario: [General]Company Admin Can Manage Notes
    Given I Have Logged In As A Company Admin
    And   I go to Admin Settings
    And   I Go To Users Under General Section
    And   I Search For A User named auto1 scriptonce
    When  I View The User's Profile
    Then  I Should See That I Can Manage The Notes Added To The User


  @general_low_risk @user_profile_note @C7585
  Scenario: [General]User Cannot View Notes Section On Own Profile
    Given I Have Logged In As A Company Employee
    When  I Go To The Menu Profile Section
    Then  I Should Not Be Able To See Notes Section


#  NOTE: currently can only be run on tmspayrolldev.dev
  @general_low_risk @user_paymentdetails @user_empdetails_leavepolicy_placeholder @C19761
  Scenario: [General] Company Admin Can View Placeholder When No Leave Policy Is Selected
    Given I Have Logged In As A Company Admin
    And   I go to Admin Settings
    And   I Go To Users Under General Section
    When  I Search For An Employee With No Leave Policy
    And   I Edit The User's Employment Details Section
    Then  I Should See The Placeholder For No Leave Policy


#  NOTE: currently can only be run on tmspayrolldev.dev
  @general_low_risk @user_paymentdetails @user_empdetails_leavepolicy_assign @C19762
  Scenario: [General] Company Admin Can Assign Leave Policy In Employment Details Section
    Given I Have Logged In As A Company Admin
    And   I go to Admin Settings
    And   I Go To Users Under General Section
    When  I Search For An Employee With Employment Details
    And   I Edit The User's Employment Details Section
    Then  I Should Be Able To Assign Leave Policy For The User

#TODO: Need to make changes to the tests since requirement has changed(User has to be assigned to legal entity which has costcentres)
##  NOTE: currently can only be run on tmspayrolldev.dev
#  @general_low_risk @user_details_costcentre @user_details_mulitple_costcentre @C19743 @C19745
#  Scenario: [General] Company Admin Can Associate A User With Multiple Cost Centres
#    Given I Have Logged In As A Company Admin
#    And   I Go To Admin Settings
#    And   I Go To Users Under General Section
#    When  I Search For An Employee Associated With Single/No Cost Centre
#    And   I Edit The User's Profile
#    Then  I Should Be Able To Associate 3 Cost Centres To The User
#    And   I Should Be Able To Assign Split Percent Values For The Cost Centres
#
#
##  NOTE: currently can only be run on tmspayrolldev.dev
#  @general_low_risk @user_details_costcentre @user_details_mulitple_costcentre_err @C19744
#  Scenario: [General] Company Admin Can View Error Message When Split % Does Not Sum Upto 100
#    Given I Have Logged In As A Company Admin
#    And   I Go To Admin Settings
#    And   I Go To Users Under General Section
#    When  I Search For An Employee Associated With Single/No Cost Centre
#    And   I Edit The User's Profile
#    And   I Associate 2 Cost Centres To The User
#    And   I Assign The Split Percent Values For The Cost Centres As 59 And 61
#    Then  I Should Be Able To See The Error Message When Split % Does Not Sum Upto 100
#
#
#  #  NOTE: currently can only be run on tmspayrolldev.dev
#  @general_low_risk @user_details_costcentre @user_details_mulitple_costcentre_nodecimal
#  Scenario: [General] Company Admin Can View Error Message When Split % Are Decimal Values
#    Given I Have Logged In As A Company Admin
#    And   I Go To Admin Settings
#    And   I Go To Users Under General Section
#    When  I Search For An Employee Associated With Single/No Cost Centre
#    And   I Edit The User's Profile
#    And   I Associate 2 Cost Centres To The User
#    And   I Assign The Split Percent Values For The Cost Centres As 59.23 And 60.77
#    Then  I Should Be Able To See The Error Message When Split % Are Decimal Values









