@Jira_Feature

Feature:
  I want to test if new issues can be created in JIRA


  @create_new_issue
  Scenario: new issue creation
    Given I Have Logged In As A Jira User
    When  I Create An Issue By Clicking On Toolbar
    Then  I Am Prompted With A Toast
#    And   I Verify The Newly Created Issue under Recent Issues
#    Then  I Verify The Details And Logged Out Of Jira