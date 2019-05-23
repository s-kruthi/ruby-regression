When(/^I Apply For The Job Ad Titled "(.*)"$/i) do | job_title |
  jobad_xpath = "//a[normalize-space()='#{job_title}']"
  
  #Try doing a database cleanup before applying
  #click on the job ad title
  Sleep_Until(ClickElement('xpath',jobad_xpath))
  
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

Given(/^I Have Logged In To The External Career Portal "(.*)" Using The Username "(.*)" And Password "(.*)"$/i) do | ext_portal, user_name, user_pwd|
  LoginToExtPortal(ext_portal, user_name, user_pwd)
end

When(/^I Go To The Browse Jobs Page$/i) do
  GoToNavBarSection(BROWSE_JOBS_LINK)
end

And(/^I Search For The Job Ad Titled "(.*)"$/i) do | jobad_title |
  SearchJobAd(jobad_title)
end

And(/^I Should Be Able To Successfully "(Verify|Remove)" The "(Internal|External|Vendor)" Job Ad Named "(.*)" For Username "(.*)" From Database$/i) do |recruitment_action, recruitment_job_ad_type, recruitment_job_title, candidate_email|
  case recruitment_action
    when "Verify"
      job_ad_result = $daos.verify_job_application_from_database(recruitment_job_ad_type, recruitment_job_title, candidate_email)
      puts job_ad_result
    
    when "Remove"
      job_ad_result = $daos.remove_job_application_from_database(recruitment_job_ad_type, recruitment_job_title, candidate_email)
      puts job_ad_result
  end
end

When(/^I Submit Candidate For The Job Ad Titled "(.*)"$/i) do | job_title |
  steps %{
    And I Apply For The Job Ad Titled "#{job_title}"
  }
end

And(/^I Enter Candidate Details$/i) do
  EnterCandidateDetails()
  
  #navigate to the next step
  Sleep_Until(WaitForAnElementByIdAndTouch(RECRUITMENT_JOBAD_NEXT_ID))
end

Given(/^I Am On The External Career Site "(.*)"$/i) do | external_portal |
  NavigateToCareerSite(external_portal)

  CreateExternalCandidateUsingJmeter()
end

When(/^I Provide Details To Create Profile$/i) do
  EnterProfileDetails()
  
  #clicking on Create Profile button
  Sleep_Until(WaitForAnElementByIdAndTouch('candidateForm_save'))
end

Then(/^I Should Be Able To Successfully Create A Profile$/i) do
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, RECRUITMENT_EXTCANDIDATE_CREATE_SUCCESS_VALUE)
  expect($driver.current_url).to include('/view-profile')
end

When(/^I Want To Create "(\d+)" External Candidate Profiles*$/i) do | num_candidates |
  CreateExternalCandidateProfiles(num_candidates)
end

Then(/^I Should Be Able To Create "(\d+)" External Candidate Profiles Successfully$/i) do | num_candidates |
  VerifyCreationExtCandidates(num_candidates)
end

Given(/^I Am Creating Candidates On The External Career Site "(.*)"$/i) do | external_portal |
  NavigateToCareerSite(external_portal)
  CreateExternalCandidateUsingJmeter()
end

Given(/^I Have Already Applied As An Employee For The Job Ad titled "(.*)"$/i) do | job_ad |
  steps %{
    Given I Have Logged In As An Employee Using The Username "auto1.scriptonce1" And Password "Admin1234567"
    And   I Go To The Menu Careers Section
    And   I Search For The Job Ad Titled "#{job_ad}"
    When  I Apply For The Job Ad Titled "#{job_ad}"
    And   I Upload My Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide My Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad
  }
  Sleep_Until(WaitForAnElementByXpathAndTouch(MENU_CAREERS_LINK))
  steps %{
    And   I Have Logged Out
  }
end

And(/^I Try To Apply For The Job Ad Titled "(.*)" As An "(Employee|External Candidate)"$/i) do | job_ad, candidate_type |
  @job_title = job_ad
  
  case candidate_type
    when 'Employee'
      steps %{
        And   I Go To The Menu Careers Section
      }
    when 'External Candidate'
      GoToNavBarSection(BROWSE_JOBS_LINK)
  end
  steps %{
    And   I Search For The Job Ad Titled "#{job_ad}"
    When  I Apply For The Job Ad Titled "#{job_ad}"
  }
end

Then(/^I Should Be Able To See A Message Alerting The User That The Job Has Already Been Applied To$/i) do
  VerifyAlertMessageForCandidate()
end

Given(/^I Have Already Applied As An External Candidate For The Job Ad titled "(.*)" On The External Career Portal "(.*)"$/i) do | job_ad, ext_career_portal |
  steps %{
    Given I Have Logged In To The External Career Portal #{ext_career_portal} Using The Username "auto_ext1.scriptonce1@elmodev.com" And Password "Admin1234567"
    And   I Go To The Browse Jobs Page
    And   I Search For The Job Ad Titled "#{job_ad}"
    When  I Apply For The Job Ad Titled "#{job_ad}"
    And   I Upload My Resume
    And   I Upload My Cover Letter
    And   I Upload Other Documents
    And   I Provide My Contact Details
    Then  I Should Be Able To Successfully Apply For The Job Ad
  }
  Sleep_Until(WaitForAnElementByXpathAndTouch(BROWSE_JOBS_LINK))
  LogoutExtPortal()
end