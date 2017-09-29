@reports @scheduled_reports

Feature:
  I Want To Test If I Can Successfully Manage Scheduled Reports

  @scheduled_report_add
  Scenario: Create a Scheduled Report
    Given I Have Logged In as a Company Admin to shayan01 site
    And  I Go To The Menu Reports Section
    When I click on Scheduled Report Button
    And  I Enter Scheduled Report Details
    Then I Should Be Able To Create A Scheduled Report

  @scheduled_report_search
  Scenario: Search a Scheduled Report
    Given I Have Logged In as a Company Admin to shayan01 site
    And  I Go To The Menu Reports Section
    Then  I Should Be Able To Search For A Specific Scheduled Report

  @scheduled_report_edit
  Scenario: Hide an Existing Scheduled Report
    Given I Have Logged In as a Company Admin to shayan01 site
    And  I Go To The Menu Reports Section
    When  I Search For A Specific Scheduled Report
    Then I Should Be Able To Edit That Specific Scheduled Report

  @scheduled_report_delete
  Scenario: Delete an Existing Scheduled Report
    Given I Have Logged In as a Company Admin to shayan01 site
    And  I Go To The Menu Reports Section
    When  I Search For A Specific Scheduled Report
    Then  I Should Be Able To Delete That Specific Scheduled Report
