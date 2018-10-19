When(/^I Apply For The Job Ad Titled "(.*)"$/i) do | job_title |
  jobad_xpath = "//a[text() = '#{job_title}']"

  #click on the job ad title
  Sleep_Until(ClickElement('xpath', jobad_xpath))

  #click on apply
  Sleep_Until(ClickElement('xpath', RECRUITMENT_JOBAD_APPLY_ID))
end


And(/^I Upload (My |The )(Resume|Cover Letter)$/i) do | arg1, document_type |
  if document_type == "Resume"
    element_id = RECRUITMENT_JOBAD_RESUME_UPLOAD_ID
  else
    element_id = RECRUITMENT_JOBAD_COVERLETTER_UPLOAD_ID
  end

  #uploading a pdf file
  @file_for_upload = File.join(File.absolute_path("../../Test_Data/", File.dirname(__FILE__)), PDF_FILE_NAME)

  Sleep_Until(select_a_file(element_id, @file_for_upload))
end


And(/^I Upload Other Documents$/i) do
  Sleep_Until(WaitForAnElementByXpathAndTouch(RECRUITMENT_JOBAD_ADDDOC_ID))

  #using absolute since the choose file has same id for resume, cover letter and other documents
  $driver.find_elements(:css, 'input[id*=resumeFile]')[2].send_keys(@file_for_upload)
  sleep (2)
  Sleep_Until(WaitForAnElementByIdAndTouch(RECRUITMENT_JOBAD_NEXT_ID))
end


And(/^I Provide( My| The Candidate) Contact Details$/i) do | arg1 |
  ClearInputFields(6)
  EnterJobAdContactDetails()

  #navigate to the next step
  Sleep_Until(WaitForAnElementByIdAndTouch(RECRUITMENT_JOBAD_NEXT_ID))
end


Then(/^I Should Be Able To Successfully Apply For The Job Ad$/i) do
  Sleep_Until(WaitForAnElementByIdAndTouch(RECRUITMENT_JOBAD_SUBMIT_ID))
  VerifySuccessAlertMessage(JOBAD_APPLY_SUCCESSFUL_ID, JOBAD_APPLY_SUCCESSFUL_VALUE)
end


Given(/^I Have Logged In To The External Career Portal (.*) Using The Username "(.*)" And Password "(.*)"$/i) do | ext_portal, user_name, user_pwd|
  LoginToExtPortal(ext_portal, user_name, user_pwd)
end


When(/^I Go To The Browse Jobs Page$/i) do
  GoToNavBarSection(BROWSE_JOBS_LINK)
end


And(/^I Search For The Job Ad Titled "(.*)"$/i) do | jobad_title |
  SearchJobAd(jobad_title)
end


When(/^I Submit Candidate For The Job Ad Titled "(.*)"$/i) do | job_title |
  steps %{And I Apply For The Job Ad Titled "#{job_title}"}
end


And(/^I Enter Candidate Details$/i) do
  EnterCandidateDetails()

  #navigate to the next step
  Sleep_Until(WaitForAnElementByIdAndTouch(RECRUITMENT_JOBAD_NEXT_ID))
end
