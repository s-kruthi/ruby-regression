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


  Sleep_Until(WaitForAnElementByIdAndInputValue('candidateForm_firstName', 'auto_ext'))
  Sleep_Until(WaitForAnElementByIdAndInputValue('candidateForm_lastName', lastname))
  Sleep_Until(WaitForAnElementByIdAndInputValue('candidateForm_email', ext_candiate_email))
  Sleep_Until(WaitForAnElementByIdAndInputValue('candidateForm_password_first', 'Admin1234567'))
  Sleep_Until(WaitForAnElementByIdAndInputValue('candidateForm_password_second', 'Admin1234567'))

  puts COLOR_BLUE + 'Created new candidate with firstname "auto_ext", lastname "'+ lastname + '" having email "'+ ext_candiate_email +'"'
end