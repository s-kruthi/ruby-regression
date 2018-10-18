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
