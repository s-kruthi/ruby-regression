
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

Then(/^I Should Be Able To Delete The Plan From the Table$/) do
  DeleteTheFirstSuccessionPlanFromTheTable(DROPDOWN,11)
end