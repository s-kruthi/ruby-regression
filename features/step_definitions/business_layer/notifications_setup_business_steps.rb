
Given(/^I Am On The Change Password Section Of A Specific User Profile$/) do
  startWebDriver
  GoToThePage(NEW_USER_EDIT_PAGE)
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
  ConnectToDatabaseAndValidateTheChangePasswordTriggeredNotifications()
end

Given(/^I Am On The Forgot Password Reset Section Of A Specific User$/) do
  startWebDriver
  GoToThePage(NEW_USER_LOGIN_PAGE)
  SelectForgotPasswordLink(FORGOT_PASSWORD_LINK)
  EnterEmail(FORGOT_PASSWORD_EMAIL, EMAIL_ADD)
end

When(/^I Successfully Trigger The Reset Password Email$/) do
 SelectResetPasswordButton(RESET_BUTTON)
end

Then(/^I Should Be Instantly Notified With The Reset Forgot Password Email$/) do
  ConnectToDatabaseAndValidateTheForgotPasswordTriggeredNotifications()
end

