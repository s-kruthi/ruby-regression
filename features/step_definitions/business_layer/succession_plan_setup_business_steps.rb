
Given(/^I Am On The Succession Menu Page$/) do
  startWebDriver
  GoToTheLoginPage(ELMO_LANDING_PAGE)
  EnterUsername(USER_NAME,EMO_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,EMO_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  GoToTheSuccessionMenuPageAsAdmin(ADMIN_COG,SUCCESSION_EXPAND)
end

When(/^I Go To The Succession Landing Page$/) do
  GoToTheSuccessionSetupPageAsAdmin(SUCCESSION_REVIEW_SETUP_PATH)
end

And(/^I Create A New Succession Plan$/) do
  CreateANewSuccessionPlan(NEW_PLAN_BTN,TITLE_ID,TITLE_VALUE,SAVE_BTN,SUCCESSION_REVIEW_LINK)
end

Then(/^I Should Be Able To Delete The Plan From the Table$/) do
  DeleteTheFirstSuccessionPlanFromTheTable(DROPDOWN,11)
  $driver.quit
end

Then(/^I Should Be Able To Hide The Plan From the Table$/) do
  HideTheFirstSuccessionPlanFromTheTable(DROPDOWN,11, HIDE_PATH)
end

And(/^I Should Be Able To Make It Back Visible Again$/) do
  GoToTheShowHiddenScreenAndMakeThePlanVisible(SHOW_HIDDEN_BTN,VISIBLE_BTN,SHOW_VISIBLE_BTN)
end

And(/^I Create A New Succession Plan To Search For$/) do
  CreateANewSuccessionPlan(NEW_PLAN_BTN,TITLE_ID,TITLE_VALUE_SEARCH,SAVE_BTN,SUCCESSION_REVIEW_LINK)
end

Then(/^I Should Be Able To Search The Succession From The List$/) do
  SearchAndVerifyTheSuccessionReturnsSuccessfully(SEARCH_FIELD,SEARCH_FIELD_VALUE,SEARCH_BTN,SEARCH_RESULT)
end


And(/^I Should Be Able To Delete The Searched Plan From the Table$/) do
  DeleteTheFirstSuccessionPlanFromTheTable(DROPDOWN,2)
  $driver.quit
end

And(/^I Try To Delete A Pre Assigned Succession Plan$/) do
  DeleteTheFirstAssignedSuccessionPlanFromTheTable(DROPDOWN,3)
end

Then(/^I Am Returned With Cannot Be Deleted Message$/) do
  VerifyTheMessageCannotBeDeletedExist(MESSAGE_CLASS,MESSAGE_BODY)
end

