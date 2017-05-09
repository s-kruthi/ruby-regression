@scheduled_reports

Feature:
  I Want To Test If I Can Successfully Manage Scheduled Reports

  @add_scheduled_report
  Scenario: Create a Scheduled Report
    Given I Have Logged In as a Company Admin
    And  I Go To The Scheduled Reports Section
    When I click on Scheduled Report Button
    And  I Enter Scheduled Report Details
    Then I Should Be Able To Create A Scheduled Report

  @search_scheduled_report
  Scenario: Search a Scheduled Report
    Given I Have Logged In as a Company Admin
    And  I Go To The Scheduled Reports Section
    Then  I Should Be Able To Search For A Specific Scheduled Report

  @hide_scheduled_report
  Scenario: Hide an Existing Scheduled Report
    Given I Have Logged In as a Company Admin
    And  I Go To The Scheduled Reports Section
    When  I Search For A Specific Scheduled Report
    Then I Should Be Able To Hide That Specific Scheduled Report

  @delete_scheduled_report
  Scenario: Delete an Existing Scheduled Report
    Given I Have Logged In as a Company Admin
    And  I Go To The Scheduled Reports Section
    When  I Search For A Specific Scheduled Report
    Then  I Should Be Able To Delete That Specific Scheduled Report
