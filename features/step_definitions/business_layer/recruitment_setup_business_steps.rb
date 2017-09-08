
Given(/^I Am On The Recruitment Requisition Listing Page$/i) do
  startWebDriver
  GoToThePage(REQUISITION_LANDING_PAGE)
  EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(3)
end

When(/^I Click on New Requisition Button$/i) do
  GoToRecruitmentRequisitionAddPage(NEW_REQUISITION_BTN)
end

And(/^I Enter New Requisition Details$/i) do
  EnterNewRecruitmentRequisitionDetails(REQUISITION_POS_INDEX_ARROW,0,REQUISITION_POS_INDEX_CLASS,0,REQUISITION_LOC_INDEX_ARROW,1,REQUISITION_LOC_INDEX_CLASS,0,REQUISITION_NUMBER_OF_POSITION,NUMBER_OF_POSITION_INPUT,REQUISITION_CALENDER_DUEDATE,REQUISITION_DUEDATE,REQUISITION_CALENDER_DONE_BTN)
end

Then(/^I Should Be Able To Create A New Requisition Request$/i) do
  CreateANewRecruitmentRequisition(REQUISITION_SUBMIT_BTN)
  $driver.quit
end


Given(/^I Am On The Recruitment Menu Section$/i) do
  startWebDriver
  GoToThePage(RECRUITMENT_LANDING_PAGE)
  EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  GoToTheRecruitmentMenuPageAsAdmin(ADMIN_COG,RECRUITMENT_EXPAND)
  sleep(2)
end

And(/^I Click on The Candidates Button$/i) do
  GoToCandidatesListingPage(CANDIDATES_LIST_PATH)
end

And(/^I am on Candidates Listing Page$/i) do
  SearchAndVerifyCandidatesBtnExists(NEW_CANDIDATE_BTN_XPATH,NEW_CANDIDATE_BTN_LABEL)
  sleep(2)
end

When(/^I Click on New Candidate Button$/i) do
  ClickOnNewCandidateButton(NEW_CANDIDATE_BTN_XPATH)
  sleep(2)
end

And(/^I Enter New Candidate Details$/i) do
  EnterNewCandidateDetails()
  sleep(2)
end

And(/^I Click on The Save Button$/i) do
  ClickOnSaveButton(SAVE_NEW_CANDIDATE_BTN)
  sleep(2)
end

Then(/^I Should Be Able To Create A New Candidate$/i) do
  GoToThePage(RECRUITMENT_CANDIDATE_LANDING_PAGE)
  sleep(2)
  VerifyANewCandidateHasBeenCreated(CANDIDATE_NAME_CLASS,TRANS1)
  sleep(2)
  $driver.quit
end


Given(/^I Am Under A Recruitment Requisition$/i) do
  startWebDriver
  require_relative '../../../features/step_definitions/pages/sucession_plan_setup_page_steps'
  GoToThePage(REQUISITION_LANDING_PAGE)
  # puts "#{$newme}"
  # EnterUsername(USER_NAME,"#{$newme}")
  EnterUsername(USER_NAME,RECRUITMENT_COMP_USER)
  EnterPassword(PASS_WORD,RECRUITMENT_COMP_PASS)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
  sleep(1)
end

And(/^I Try To Create A New Job Ad$/i) do
  GoToNewJobPostTabUnderARequisition(MY_REQ_LINK,JOB_AD_LINK,NEW_JOB_POST_LINK)
end

When(/^I Fill The Details Of A New Job Ad$/i) do
  AddTheJobDetailsAndSubmitIt(SALARY_FROM,SALARY_FROM_VALUE,SALARY_TO,SALARY_TO_VALUE,JB_START_DATE_BTN,JB_START_DATE,JB_END_DATE,JB_END_DATE_VALUE,INT_CAR_BTN,EXT_CAR_BTN)
end

Then(/^I Should be Able To Post The New Job$/i) do
  SaveTheJobAdAndGoToTheLandingPage(SAVE_JOB)
end

And(/^I Have A New candidate Applied for A Position$/i) do
  SignupAndApplyAsACandidate()

end

When(/^I Move The Candidate From New To Notsuitable Category$/i) do
  CheckTheCandidateAppearsUnderNewStatus(NEW_STATUS)
  MoveTheCandidateFromNewToNotSuitable(ADD_TO_NOTSUITABLE)
end

Then(/^I Should Be Able To View The Candidate Under Unsuccessful Category$/i) do
  VerifyThecandidateAppearsUnderNotSuitableCategory()
end