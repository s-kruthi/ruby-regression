

Given(/^I Have Logged In As A Regular User$/) do
  startWebDriver
  GoToTheLoginPage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,EMO_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,EMO_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


When(/^I Go To The Career Positions Section$/) do
  GoToPositionsUnderCareersTab(CAREERS_TAB,POSITIONS_LINK)
end

Then(/^The Default Positions Should Be Returned In An Alphabetical Order$/) do
  WaitForThePositionsListingAndVerifyTheAlphabeticalSorting()
end

