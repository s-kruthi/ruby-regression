def AddACoursesAndGoToCourseSection(course_btn_path)
  sleep(1)
  WaitForAnElementByXpathAndTouch(course_btn_path)
  sleep(2)
end

def FillTheCourseFormAndSaveIt(course_name_id,course_name_val,course_code_id,course_code_val,save_course_id)
  WaitForAnElementByIdAndInputValue(course_name_id,course_name_val)
  WaitForAnElementByIdAndInputValue(course_code_id,course_code_val)
  MakeItvisibleToAllusers()
  WaitForAnElementByIdAndTouch(save_course_id)
  sleep(3)
  course_url = $driver.current_url
  course_id = course_url.split('/')[-1]
  $new_course_id = "#{course_id}"
  puts $new_course_id
  sleep(4)
end

def MakeItvisibleToAllusers()
  course_availability_dropdown = $driver.find_element(:id, 'elmo_learningbundle_course_visible')
  select_list = Selenium::WebDriver::Support::Select.new(course_availability_dropdown)
  select_list.select_by(:text, 'Available to all users')
end

def GoToTheCourseSection(course_section_id)
  $driver.find_element(:xpath, %(//a[@href='/admin/course/#{$new_course_id}/setSections'])).click
  sleep(3)
  WaitForAnElementByIdAndTouch(course_section_id)
  sleep(1)
  $driver.navigate.refresh
  sleep(2)
  # WaitForAnElementByIdAndTouch(activity_dropdown)
  # sleep(1)
  # WaitForDropdownByClassAndTouchTheIndex(quiz_activity_cls,index_value)

  #WaitForAnElementByCSSAndTouch(add_activity)
  $driver.find_element(:class, "activity-select").send_keys "Quiz"
  $driver.find_element(:name, "addsection").click


  sleep(3)
end

def SetupTheQuizActivityAndSaveIt()
  $driver.find_element(:xpath, "//input[@data-description='learning.course.modQuiz.edit.name.description']").send_keys "Automation Quiz Activity"
  sleep(1)
  $driver.find_element(:xpath, "//a[@class='btn btn-primary add-question']").click
  sleep(2)
  $driver.find_elements(:class, "cke_wysiwyg_frame")[2].click
  puts "i am here"
  $driver.find_elements(:class, "cke_wysiwyg_frame")[2].send_keys "What's The capital Of Australia?"
  #puts i am here
  $driver.find_element(:xpath, "//button[@class='save-question btn btn-primary']").click
  sleep(2)
  $driver.find_element(:xpath, "//input[@id='elmo_learningbundle_mod_modquiz_quizSettings_passMark-clone']").send_keys "50"
  $driver.find_element(:xpath, "//label[@class='btn btn-default active toggle-off']").click
  $driver.find_element(:xpath, "//button[@class='btn btn-primary save-quiz']").click
  Sleep_Until($driver.find_element(:class, "alert-success"))
end

def SearchForTheCourseAndDeleteIt(course_name)
  GoToThePage(ADMIN_COURSE_PAGE)
  sleep(2)
  $driver.find_element(:id, "coureSearch_searchText").send_keys("#{course_name}", :return)
  sleep(2)
  $driver.find_elements(:class, "dropdown-toggle")[3].click
  $driver.find_element(:class, "delete-course").click
  sleep(3)
  $driver.switch_to.frame("iframe")
  sleep(2)
  $driver.find_element(:xpath, "//button[@type='submit']").click
end