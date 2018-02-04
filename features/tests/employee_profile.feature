@employee_profile @general

Feature:
  As a Company Administrator I would like to edit an
  employee's personal and payment details

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
    Given I Have Logged In as a Company Admin to hung02 site
    And   I Go To The Menu Profile Section
    Then  I Should Be Able To View Activity Sub-Tab
    And   I Should Be Able To Click Resume Sub-Tab
    And   I Should Be Able To Click My Career Sub-Tab
    And   I Should Be Able To Click Personal Details Sub-Tab
    And   I Should Be Able To Click Payment Details Sub-Tab
    And   I Should Be Able To Click Recognition Sub-Tab


  @ViewAnotherEmployeeDetails @general_low_risk
  Scenario: [General]View Employee Profile to Verify Sub Tabs
    Given I Have Logged In as a Company Manager to hung02 site
    And   I Go To The Menu My Team Section
    And   I Search An Employee named test1.omar1
    Then  I Should Be Able To View The Employee Profile for test1.omar1 and verify Email address test1.omar1@elmodev.com
#    And   I Should Be Able To Click Activity Sub-Tab
    And   I Should Be Able To Click Resume Sub-Tab
    And   I Should Be Able To Click My Career Sub-Tab
    And   I Should Be Able To Click Personal Details Sub-Tab
    And   I Should Be Able To Click Payment Details Sub-Tab
    And   I Should Be Able To Click Recognition Sub-Tab