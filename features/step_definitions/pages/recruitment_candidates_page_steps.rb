def GoToTheRecruitmentMenuPageAsAdmin(admin_cog,recruitment_expand)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  GoToCandidatesListingPage(recruitment_expand)
end

def GoToRecruitmentCandidatesListingPage(recruitment_expand)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(recruitment_expand)
end

def GoToCandidatesListingPage(recruitment_expand)
  sleep(1)

  WaitForAnElementByXpathAndTouch(recruitment_expand)
end

def SearchAndVerifyCandidatesBtnExists(candidate_btn_xpath,candidate_btn_label)
  VerifyAnElementExistByXPath(candidate_btn_xpath,candidate_btn_label)
end

def ClickOnNewCandidateButton(new_candidadate_xpath)
  WaitForAnElementByXpathAndTouch(new_candidadate_xpath)
end

def EnterNewCandidateDetails()
  WaitForAnElementByIdAndInputValue(FIRSTNAME_INPUT_ID,CANDIDATE[:FIRST])
  WaitForAnElementByIdAndInputValue(LASTNAME_INPUT_ID,CANDIDATE[:LAST])
  CreateARandomEmailAddress()
  WaitForAnElementByIdAndInputValue(HOMEPHONE_INPUT_ID ,CANDIDATE[:HOMEPHONE])
  WaitForAnElementByIdAndInputValue(MOBILE_INPUT_ID,CANDIDATE[:MOBILE])
  WaitForAnElementByIdAndInputValue(ADDRESS_INPUT_ID,CANDIDATE[:ADDRESSLINE1])
  WaitForAnElementByIdAndInputValue(SUBURB_INPUT_ID,CANDIDATE[:SUBURB])
  WaitForAnElementByIdAndInputValue(STATE_INPUT_ID,CANDIDATE[:STATE])
  WaitForAnElementByIdAndInputValue(POSTCODE_INPUT_ID,CANDIDATE[:POSTCODE])
  # WaitForAnElementByIdAndInputValue(COUNTRY_INPUT_ID,CANDIDATE[:COUNTRY])
  # WaitForAnElementByIdAndInputValue(TIMEZONE_INPUT_ID,CANDIDATE[:TIMEZONE])
  WaitForAnElementByIdAndInputValue(PASSWORD_INPUT_ID,CANDIDATE[:PASSWORD])
  WaitForAnElementByIdAndInputValue(PASSWORD_CONFIRM_INPUT_ID,CANDIDATE[:PASSWORD])

end

def CreateARandomEmailAddress()
  email_addrress = CANDIDATE[:EMAIL].to_s + ((Time.now).to_i).to_s + "@elmotalent.com.au"
  WaitForAnElementByIdAndInputValue(EMAIL_INPUT_ID,email_addrress)
end

def ClickOnSaveButton(candidate_save_btn)
  WaitForAnElementByIdAndTouch(candidate_save_btn)
end

def VerifyANewCandidateHasBeenCreated(candidate_name_xpath,last_name,first_name)
  VerifyAnElementExistByXPath(candidate_name_xpath,last_name)
  VerifyAnElementExistByXPath(candidate_name_xpath,first_name)
end
