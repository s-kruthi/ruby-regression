
Given(/^I Am On The Change Password Section Of A Specific User Profile$/) do
  startWebDriver
  GoToTheLoginPage(NEW_USER_EDIT_PAGE)
  EnterUsername(USER_NAME,EMO_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,EMO_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

When(/^I Successfully Change The Password and Opt To Get Notified$/) do
  EnterPassword(CHANGE_PASSWORD,EMO_ADMIN_PASSWORD)
  EnterPassword(CONF_CHANGE_PASSWORD,EMO_ADMIN_PASSWORD)
  SelectNotifyUserOptionAndChangeThePassword(NOTIFY_ID,CHANGE_PASS_BTN)
end

Then(/^I Should Be Instantly Notified About My Password Change$/) do
  ConnectToDatabaseAndValidateTheTriggeredNotifications()
end