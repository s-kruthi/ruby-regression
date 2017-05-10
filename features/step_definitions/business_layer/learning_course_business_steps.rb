Given(/^I Have Logged In as a Company Admin To Setup A Course$/) do
  startWebDriver
  GoToThePage(ADMIN_COURSE_PAGE)
  EnterUsername(USER_NAME,ADMIN_COURSE_USER)
  EnterPassword(PASS_WORD,ADMIN_COURSE_PASS)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end


When(/^I Setup A Course To Edit The Section$/) do
  AddACoursesAndGoToCourseSection(ADD_COURSE_BTN)
  FillTheCourseFormAndSaveIt(COURSE_NAME_ID,COURSE_NAME_VAL,COURSE_CODE_ID,COURSE_CODE_VAL,SAVE_COURSE_ID)
end

And(/^I Try To Setup A Quiz Activity Under The Section$/) do
  GoToTheCourseSection(ADD_COURSE_SECTION)
end

Then(/^I Should be Able To Successfully Setup The Quiz Activity$/) do
  SetupTheQuizActivityAndSaveIt()
  #SearchForTheCourseAndDeleteIt(COURSE_NAME_VAL)
end

