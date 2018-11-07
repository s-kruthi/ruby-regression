#clears all input fields of type text on job ad contact details page
def ClearInputFields(num_textfields)
  i = 0
  
  while i <= num_textfields
    $driver.find_elements(:xpath, "//input[@type='text']")[i].clear
    i=i+1
  end
end


def EnterJobAdContactDetails()
  Sleep_Until(WaitForAnElementByXpathAndInputValue(RECRUITMENT_JOBAD_HOMEPH_ID, RECRUITMENT_JOB_AD_PHONE_VALUE))
  
  Sleep_Until(WaitForAnElementByXpathAndInputValue(RECRUITMENT_JOBAD_MOBILE_ID, RECRUITMENT_JOB_AD_PHONE_VALUE))
  
  Sleep_Until(WaitForAnElementByXpathAndInputValue(RECRUITMENT_JOBAD_ADDR1_ID, RECRUITMENT_JOB_AD_ADDR1_VALUE))
  
  Sleep_Until(WaitForAnElementByXpathAndInputValue(RECRUITMENT_JOBAD_SUBURB_ID, RECRUITMENT_JOB_AD_SUBURB_VALUE))
  
  Sleep_Until(WaitForAnElementByXpathAndInputValue(RECRUITMENT_JOBAD_STATE_ID, RECRUITMENT_JOB_AD_STATE_VALUE ))
  
  Sleep_Until(WaitForAnElementByXpathAndInputValue(RECRUITMENT_JOBAD_POSTCODE_ID, RECRUITMENT_JOB_AD_POSTCODE_VALUE))
  
  Sleep_Until(SelectFromDropdown(RECRUITMENT_JOBAD_COUNTRY_ID, RECRUITMENT_JOB_AD_COUNTRY_VALUE))
end


def LoginToExtPortal(external_portal, user_name, user_pwd)
  startWebDriver
  
  @external_portal = external_portal
  GoToSite()
  
  EnterUsername(USER_NAME, user_name)
  EnterPassword(PASS_WORD, user_pwd)
  
  TouchLoginButton(LOGIN_BUTTON)
  puts COLOR_BLUE + "Title: " + $driver.title
  puts COLOR_BLUE + "URL: " + $driver.current_url
  sleep(3)
  
  expect($driver.current_url).to include('/view-profile')
end


def SearchJobAd(jobad_title)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(SEARCH_JOBAD_ID, jobad_title))
  Sleep_Until(WaitForAnElementByXpathAndTouch(SEARCH_BUTTON_ID))
end


def EnterCandidateDetails()
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_JOBAPPLN_CANDIDATE_EMAIL_ID, RECRUITMENT_JOBAPPLN_CANDIDATE_EMAIL_VALUE))
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_JOBAPPLN_CANDIDATE_FNAME_ID, RECRUITMENT_JOBAPPLN_CANDIDATE_FNAME_VALUE))
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_JOBAPPLN_CANDIDATE_LNAME_ID, RECRUITMENT_JOBAPPLN_CANDIDATE_LNAME_VALUE))
end


def NavigateToCareerSite(external_portal)
  startWebDriver
  
  @external_portal = external_portal
  GoToSite()
end


def EnterProfileDetails()
  suffix = Time.now.strftime("%Y%m%d%H%M%S").to_s
  ext_candiate_email = 'test'+ suffix +'@elmodev.com'
  lastname = 'scriptonce' + suffix
  
  
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_EXTCANDIDATE_PROFILE_FNAME_ID, RECRUITMENT_EXTCANDIDATE_PROFILE_FNAME_VALUE))
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_EXTCANDIDATE_PROFILE_LNAME_ID, lastname))
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_EXTCANDIDATE_PROFILE_EMAIL_ID, ext_candiate_email))
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_EXTCANDIDATE_PROFILE_PWD_ID, RECRUITMENT_EXTCANDIDATE_PROFILE_PWD_VALUE))
  Sleep_Until(WaitForAnElementByIdAndInputValue(RECRUITMENT_EXTCANDIDATE_PROFILE_REPEATPWD_ID, RECRUITMENT_EXTCANDIDATE_PROFILE_PWD_VALUE))
  
  puts COLOR_BLUE + 'Creating new candidate with firstname "auto_ext", lastname "'+ lastname + '" having email "'+ ext_candiate_email +'"'
end


def CreateExternalCandidateProfiles(num_candidates)
  #getting the num of existing candidates to compare after creation
  @num_existing_candidates = $daos.get_count_candidates()
  
  i = 1
  while i <= num_candidates
    EnterProfileDetails()
    Sleep_Until(WaitForAnElementByIdAndTouch('candidateForm_save'))
    VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, RECRUITMENT_EXTCANDIDATE_CREATE_SUCCESS_VALUE)
    LogoutExtPortal()
    i+=1
  end
end


def LogoutExtPortal()
  Sleep_Until(ClickElement('xpath', RECRUITMENT_EXTPORTAL_SIGNOUT_ID, 1))
end


def VerifyCreationExtCandidates(num_candidates)
  #getting the count of candidates to verify creation
  count_ext_candidates = $daos.get_count_candidates()
  
  total = @num_existing_candidates + num_candidates
  
  #comparing current count to (earlier count + num of candidates created now)
  expect(count_ext_candidates).to eq(total)
  
  puts COLOR_GREEN + 'Successfully created '+ num_candidates.to_s + ' external candidates'
end


def CreateExternalCandidateUsingJmeter()
  $create_against = $site_url.gsub("https://","").split("/",2)[0]
  $method_path = $site_url.gsub("https://","").split("/",2)[1].gsub("/login","")
  
  if ENV['MYMAC']
    %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Recruitment/ExternalCareerSite.jmx -Jserver=#{$create_against} -Jmpath=#{$method_path})
  else
    %x(/var/lib/apache-jmeter/bin/./jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Recruitment/ExternalCareerSite.jmx -Jserver=#{$create_against} -Jmpath=#{$method_path})
  end
  # csv = CSV.read('JMETER_AUTO/Jmeter_tests/Learning/learning_user_id.csv', :headers=>false)
  # puts "manager_id:" + csv[0][0]
  # puts "manager_username:" + csv[0][1]
  # puts "user_id:" + csv[0][2]
  # $created_username = puts "username:" + csv[0][3]
end


#verifies that the alert message is displayed when a user applies to an already applied job ad
def VerifyAlertMessageForCandidate()
  VerifyErrorAlertMessage(VERIFY_ALERT_ID, RECRUITMENT_JOBAPPLN_ALERT_VALUE)
  
  #verifying that the error message contains the job title
  VerifyAnElementExistByXPath(VERIFY_ALERT_ID, @job_title)
  
  #verifying that the error message contains todays date since we just applied for the job
  applied_date = Time.now.strftime("%d/%m/%Y")
  VerifyAnElementExistByXPath(VERIFY_ALERT_ID, applied_date)
end


def VerifyJobApplnDB(recruitment_job_ad_type, recruitment_job_title, candidate_email)
  job_ad_result = $daos.verify_job_application_from_database(recruitment_job_ad_type, recruitment_job_title, candidate_email)

  #mysql row_count() returns -1 for select query
  if job_ad_result[:affected].eql? -1
    puts COLOR_GREEN + "Candidate was successful in applying to the job ad"
  else
    puts COLOR_RED + "Insuccessful application, check manually"
  end
end


def RemoveJobApplnDB(recruitment_job_ad_type, recruitment_job_title, candidate_email)
  #deleting the applied job
  job_ad_result = $daos.remove_job_application_from_database(recruitment_job_ad_type, recruitment_job_title, candidate_email)

  puts COLOR_GREEN + "Number of rows affected: " + job_ad_result[:affected].to_s
end