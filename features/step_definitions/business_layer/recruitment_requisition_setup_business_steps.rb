
Given(/^I Am On The Recruitment Requisition Listing Page$/) do
  startWebDriver
  GoToThePage(RECRUITMENT_LANDING_PAGE)
  EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  GoToThePage(REQUISITION_LISTING_PAGE)
end

When(/^I Click on New Requisition Button$/) do
  GoToRecruitmentRequisitionAddPage(NEW_REQUISITION_BTN)
end

And(/^I Enter New Requisition Details$/) do
  EnterNewRecruitmentRequisitionDetails(REQUISITION_POS_INDEX_ARROW,0,REQUISITION_POS_INDEX_CLASS,11,REQUISITION_LOC_INDEX_ARROW,1,REQUISITION_LOC_INDEX_CLASS,0,REQUISITION_NUMBER_OF_POSITION,REQUISITION_DUEDATE,REQUISITION_CALENDER_DONE_BTN,REQUISITION_MESSAGE_BODY)
end

Then(/^I Should Be Able To Create A New Requisition Request$/) do
  CreateANewRecruitmentRequisition(REQUISITION_SUBMIT_BTN)
  $driver.quit
end
