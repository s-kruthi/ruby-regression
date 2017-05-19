@employee_contracts

Feature:
  I want to Test if I can Successfully Manage Contract Library

  @add_employee_contract
  Scenario: Create a New Contract
    Given I Have Logged In as a Company Admin
    And I Go To The Contract Library Section
    When I click on New Contract Button
    And I Enter New Employee Contract Details
    Then I Should Be Able To Create A New Contract

  @search_employee_contract
  Scenario: Search an Existing Contract
    Given I Have Logged In as a Company Admin
    And I Go To The Contract Library Section
    Then I Should Be Able To Search For A Contract


  @edit_employee_contract
  Scenario: Edit an Existing Contract
    Given I Have Logged In as a Company Admin
    And I Go To The Contract Library Section
    When I Search For A Contract
    Then I Should Be Able To Edit A Specific Contract

  @copy_employee_contract
  Scenario: Copy an Existing Contract
    Given I Have Logged In as a Company Admin
    And I Go To The Contract Library Section
    When I Search For A Contract
    Then I Should Be Able To Copy A Contract

  @hide_employee_contract
  Scenario: Hide/Unhide an Existing Contract
    Given I Have Logged In as a Company Admin
    And I Go To The Contract Library Section
    When I Search For A Contract
    Then I Should Be Able To Hide/Unhide A Contract

  @delete_employee_contract
  Scenario: Delete an Existing Contract
    Given I Have Logged In as a Company Admin
    And I Go To The Contract Library Section
    When I Search For A Contract
    Then I Should Be Able To Delete The Specific Contract


#Feature:
#  I want to Test if I can Successfully Manage Contract Placeholder Library
#
#  @add_employee_contract_placeholder
#  Scenario: Create a New Contract Placeholder
#    Given I Have Logged In as a Company Admin
#    And I Go To The Contract Placeholder Library Section
#    When I click on New Placeholder Button
#    And I Enter New Placeholder Details
#    Then I Should Be Able To Create A New Contract Placeholder
#
#  @search_employee_contract_placeholder
#  Scenario: Search an Existing Contract Placeholder
#    Given I Have Logged In as a Company Admin
#    And I Go To The Contract Placeholder Library Section
#    Then I Should Be Able To Search For A Contract Placeholder
#
#  @edit_employee_contract_placeholder
#  Scenario: Edit an Existing Contract Placeholder
#    Given I Have Logged In as a Company Admin
#    And I Go To The Contract Placeholder Library Section
#    When I Search For A Contract Placeholder
#    Then I Should Be Able To Edit A Specific Contract
#
#  @hide_employee_contract_placeholder
#  Scenario: Hide/Unhide an Existing Contract Placeholder
#    Given I Have Logged In as a Company Admin
#    And I Go To The Contract Placeholder Library Section
#    When I Click On A Hide/Unhide Button
#    Then I Should Be Able To Hide/Unhide The Specific Contract Placeholder
#
#  @delete_employee_contract
#  Scenario: Delete an Existing Contract Placeholder
#    Given I Have Logged In as a Company Admin
#    And I Go To The Contract Placeholder Library Section
#    When I Search For A Contract Placeholder
#    Then I Should Be Able To Delete a Specific Contract
#
#  @import_employee_contract_placeholder
#  Scenario: Import Contract Placeholder CSV File
#    Given I Have Logged In as a Company Admin
#    And I Go To The Contract Placeholder Library Section
#    When I Click on The Import Button
#    And I Select A CSV File via Browse Button
#    Then I Should Be Able To Successfully Import Contract Placeholders