def EnrolToCourse()
  #Capture the course id for verification
  @course_id = $driver.find_elements(:xpath, ENROL_BUTTON_ID)[0].attribute('href').split('/').pop()

  #Click the first enrol button
  Sleep_Until(WaitForAnElementByXpathAndTouchTheIndex(ENROL_BUTTON_ID, 0))
end


def VerifyEnrolmentToCourse()
  #Verify that the user has been enrolled to the course id
  $driver.find_element(:xpath,"//a[contains(@href, #{@course_id})]").text == "Enrolled"
end