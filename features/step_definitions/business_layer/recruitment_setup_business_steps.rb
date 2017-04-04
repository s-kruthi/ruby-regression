
Given(/^I Am On The Recruitment Requisition Listing Page$/) do
  startWebDriver
  GoToThePage(REQUISITION_LANDING_PAGE)
  EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(3)
end

When(/^I Click on New Requisition Button$/) do
  GoToRecruitmentRequisitionAddPage(NEW_REQUISITION_BTN)
end

And(/^I Enter New Requisition Details$/) do
  EnterNewRecruitmentRequisitionDetails(REQUISITION_POS_INDEX_ARROW,0,REQUISITION_POS_INDEX_CLASS,0,REQUISITION_LOC_INDEX_ARROW,1,REQUISITION_LOC_INDEX_CLASS,0,REQUISITION_NUMBER_OF_POSITION,NUMBER_OF_POSITION_INPUT,REQUISITION_CALENDER_DUEDATE,REQUISITION_DUEDATE,REQUISITION_CALENDER_DONE_BTN)
end

Then(/^I Should Be Able To Create A New Requisition Request$/) do
  CreateANewRecruitmentRequisition(REQUISITION_SUBMIT_BTN)
  $driver.quit
end


Given(/^I Am On The Recruitment Menu Section$/) do
  startWebDriver
  GoToThePage(RECRUITMENT_LANDING_PAGE)
  EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  GoToTheRecruitmentMenuPageAsAdmin(ADMIN_COG,RECRUITMENT_EXPAND)
  sleep(2)
end

And(/^I Click on The Candidates Button$/) do
  GoToCandidatesListingPage(CANDIDATES_LIST_PATH)
end

And(/^I am on Candidates Listing Page$/) do
  SearchAndVerifyCandidatesBtnExists(NEW_CANDIDATE_BTN_XPATH,NEW_CANDIDATE_BTN_LABEL)
  sleep(2)
end

When(/^I Click on New Candidate Button$/) do
  ClickOnNewCandidateButton(NEW_CANDIDATE_BTN_XPATH)
  sleep(2)
end

And(/^I Enter New Candidate Details$/) do
  EnterNewCandidateDetails()
  sleep(2)
end

And(/^I Click on The Save Button$/) do
  ClickOnSaveButton(SAVE_NEW_CANDIDATE_BTN)
  sleep(2)
end

Then(/^I Should Be Able To Create A New Candidate$/) do
  GoToThePage(RECRUITMENT_CANDIDATE_LANDING_PAGE)
  sleep(2)
  VerifyANewCandidateHasBeenCreated(CANDIDATE_NAME_CLASS,TRANS1)
  sleep(2)
  $driver.quit
end

