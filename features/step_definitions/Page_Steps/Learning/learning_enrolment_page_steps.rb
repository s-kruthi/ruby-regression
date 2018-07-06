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


def VerifyUnenrollmentToCourse()
  enrolment = $daos.get_enrolment_status(@course_id, @user_id)
  if enrolment == nil
    puts COLOR_GREEN + "User unenrolment successful"
  else
    #check enrolment changed from self to rule
    enrolment_method = $daos.get_enrolment_method(@course_id, @user_id)
    if enrolment_method == 2
      puts COLOR_GREEN + "User self unenrolment was successful, but course enrolment is by Rule"
    end
  end
end


def CheckUserEnrolledCourse(self_unenroll_allowed)
  if self_unenroll_allowed == "Yes"
    self_unenrol = 1
  elsif self_unenroll_allowed == "No"
    self_unenrol = 0
  end

  #check and get coursename with self enrolment
  @course_name = $daos.get_course_selfunenrol(self_unenrol, @user_id)

  unless @course_name
    puts COLOR_YELLOW + "User has not enrolled to any course with Self-unenroll enabled".upcase
    skip_this_scenario
  end
end


def GoToCourseViewPageToUnenrol()
  Sleep_Until(WaitForAnElementByXpathAndTouch(ENROLLED_BUTTON_ID))
  #get course id
  @course_id = $driver.current_url.split('/').pop
end


def UnenrolFromCourse()
  Sleep_Until(WaitForAnElementByXpathAndTouch(UNENROL_BUTTON_ID))

  #click on confirm to unenrol
  Sleep_Until(PressConfirm())
end


def CheckNoUnenrolButton()
  Sleep_Until(VerifyAnElementNotExist("xpath", UNENROL_BUTTON_ID))
end