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

def VerifyUnenrolmentToCourse()
  enrolment = $daos.get_enrolment_status(@course[:course_id], @user_id[:id])

  if enrolment == 0
    puts COLOR_GREEN + "User unenrolment successful"
  else
    #check enrolment changed from self to rule
    enrolment_method = $daos.get_enrolment_method(@course[:course_id], @user_id[:id])
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

#  INFO: Check database mdl_course table in the database and return Course Fullname with self enrolment being Yes/No
  @course = $daos.get_course_selfunenrol(self_unenrol, @user_id[:id])

  unless @course
    puts COLOR_YELLOW + "User has not enrolled to any course with Self-unenroll enabled".upcase
    skip_this_scenario
  end

  puts COLOR_BLUE + "User is enrolled to course " + @course[:fullname] + " which has self unenrol set"
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
  @count_enroled_courses = $daos.get_enroled_courses(@user_id[:id])

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

def GoToEnrolledUserPage()
  Sleep_Until($driver.navigate.to($site_url))
  enrol_user_url = $driver.current_url.chomp('/dashboard')
  $driver.navigate.to("#{enrol_user_url}/admin/course/#{@details[:course_id]}/enrolments")
end

def BulkEnrolUsersToThatCourse()
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch("Bulk Enrol Users"))
  Sleep_Until(WaitForAnElementByIdAndTouch("select-all"))
  Sleep_Until(WaitForAnElementByIdAndTouch("enrol-btn"))
  Sleep_Until(WaitForAnElementByCSSAndTouch('button[data-action="run"]'))
  sleep(7)
end

def VerifyAllSelectedUsersGotBulkEnrolledToTheCourse(course_id)
  count = $daos.get_enrolmentcount(course_id)
  expect(count).to eq(10)
end

def FetchBulkEnrolCount(course_id)
  "select COUNT(*) from epms_lms_course_enrolment where course_id ='#{course_id}' order by id DESC LIMIT 10"
end

def SearchForTheCourseUnderEnrolmentTab(course_name)
  Sleep_Until($driver.find_element(:id, "s2id_autogen1"))
  $driver.find_element(:id, "s2id_autogen1").send_keys "#{course_name}"
  begin
    wait_valid = $driver.find_element(:class, "select2-result-label-4").text.include? "#{course_name}"
    Sleep_Until(wait_valid)
  rescue
    sleep(4)
  end
  $driver.find_element(:id, "select2-result-label-4").click
end
