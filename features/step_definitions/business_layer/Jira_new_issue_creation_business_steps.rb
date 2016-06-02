
Given(/^I Have Logged In As A Jira User$/) do

  startWebDriver
  GoToTheLoginPage(JIRA_LOGIN_PAGE)
  EnterUsername(USERNAME)
  EnterPassword(PASSWORD)
  LogInAndWaitForTheDashboard()
end

When(/^I Create An Issue By Clicking On Toolbar$/) do

  GoToCreateNewIssueScreenByClickingOnCreateTab(CREATE_TAB)
  CreateNewIssueWithATitle(AUTOMATION_IN_PROGRESS)
end

Then(/^I Am Prompted With A Toast$/) do

  WaitForAToastUponSuccessfulCreation()
end

And(/^I Verify The Newly Created Issue under Recent Issues$/) do

  GoToIssuesTabFromToolBar()
  TouchSearchForIssuesOption()
  SearchForAllIssuesByClickingOnTheLinkText()
  VerifyCreatedIssueAppearsOnTheTopOfTheList(AUTOMATION_IN_PROGRESS)
  ClickOnTheNewIssueAndGoToTheSummaryScreen()

end


Then(/^I Verify The Details And Logged Out Of Jira$/) do

PrintTheNewlyCreatedIssueTitleAndLogout()
end