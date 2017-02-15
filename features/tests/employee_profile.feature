@employee_profile
Feature:
  As a Company Administrator I would like to edit an
  employee's personal and payment details


  Scenario: View Employees hourly Rate and Salary Details (Payment Details)
    Given I Am On The Employee's Payment Details Section
    When  I Try To View The Payment Details Of An Employee For A Particular Employment Type
    Then  I Should Be Able To Unmask The Rate And Salary Details By Tapping The Show Button

  Scenario: Add Payment Details ( TFN Details )
    Given I Am On The Employee's Payment Details Section
    When  I Try To View The TFN Details Of An Employee
    Then  I Should Be Able To Unmask The TFN Number By Tapping The Show Button