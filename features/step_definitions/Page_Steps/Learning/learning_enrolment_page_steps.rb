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


def CheckCoursesEnroled()
  #check enroled courses match the count on My Learning page
  @count_enroled_courses = $daos.get_enroled_courses(@user_id)

  enroled_courses_count = $driver.find_element(:xpath, PAGINATION_ID).text.split(" ")[4].to_i
  if enroled_courses_count.eql? @count_enroled_courses then
    puts COLOR_GREEN + "Enroled Course Count matches"
  end
end


def CheckCourseDetail(field_name)
  case field_name
    when "Course Name"
      Sleep_Until(VerifyAnElementExists("xpath", ENROLED_COURSE_TITLE_ID))
    when "Course Category"
      Sleep_Until(VerifyAnElementExists("xpath", ENROLED_COURSE_CATEGORY_ID))
    when "Course Status"
      Sleep_Until(VerifyAnElementExists("xpath", ENROLED_COURSE_STATUS_ID))
    when "Course Due Date"
      Sleep_Until(VerifyAnElementExists("xpath", ENROLED_COURSE_DUEDATE_ID))
  end
end