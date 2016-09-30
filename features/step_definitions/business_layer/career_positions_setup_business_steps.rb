

Given(/^I Have Logged In As A Regular User$/) do
  startWebDriver
  GoToThePage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,EMO_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,EMO_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


When(/^I Go To The Career Positions Section$/) do
  GoToPositionsUnderCareersTab(CAREERS_TAB, 1, POSITIONS_LINK)
end

Then(/^The Default Positions Should Be Returned In An Alphabetical Order$/) do
  WaitForThePositionsListingAndVerifyTheAlphabeticalSorting()
end


Then(/^The I Should Be Able To Search A Position By Typing The Keywords$/) do
  SearchForAPositionAndVerifyTheResult(POS_SEARCH_FIELD,POS_SEARCH_VALUE,POS_SEARCH_BTN,POS_SEARCH_RESULT)
end

Given(/^I Have Logged In As A Specific User$/) do
  startWebDriver
  GoToThePage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,SPECIFIC_USERNAME)
  EnterPassword(PASS_WORD,EMO_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

And(/^I Try To Search A Position Based On Interested Positions$/) do
  SelectAndSearchInterestedPositionsFromTheDropdown(POSITIONS_DROPDOWN_ID,DROPDOWN_RESULT_CLASS, 2)
end

Then(/^The Search Should Return The Interested Position Based On My Previous Selections$/) do
  ValidateTheSearchResultReturnsTheInterestedPosition(INTERESTED_POSITION_PATH, INTERESTED_POSITION_VALUE)
end

And(/^I Try To Search A Position Based On Suggested Positions$/) do
  SelectAndSearchSuggestedPositionsFromTheDropdown(POSITIONS_DROPDOWN_ID,DROPDOWN_RESULT_CLASS, 1)
end

Then(/^The Search Should Return The Suggested Positions Based On The Next Positions Within Two Steps$/) do
  ValidateTheSearchReturnsNextTwoSuggestedPositions(SUGGESTED_POS_PATH1,SUGGESTED_POS_VALUE1, SUGGESTED_POS_PATH2,SUGGESTED_POS_VALUE2)
end