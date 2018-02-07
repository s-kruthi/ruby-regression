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



#############Omar's added course section##############


def go_to_the_learning_as_company_admin(admin_cog,documents_expand,documents_list_path)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  sleep(2)
  goToDocumentsSection(documents_expand)
  sleep(2)
  goToItemLandingPage(documents_list_path)
end

def go_to_new_course_add_page(new_course_btn)
  WaitForAnElementByXpathAndTouch(new_course_btn)
end

def enter_course_title(new_course_title_id, new_course_title_value)
  WaitForAnElementByXpathAndInputValue(new_course_title_id, new_course_title_value)
end

def enter_course_category()
end

def enter_course_code(new_course_code_id, new_course_code_value)
  WaitForAnElementByXpathAndInputValue(new_course_code_id, new_course_code_value)
end

def enter_course_description(form_temp_desc_txt, index_id)
  use_ckeditor_to_enter_description(form_temp_desc_txt, index_id)
end

def enter_course_retrain(course_retrain_input_id, course_retrain_input_value)
  select_from_drop_down(course_retrain_input_id, course_retrain_input_value)
end

def enter_course_retrain_open(course_retrain_open_input_id, course_retrain_open_input_value)
  select_from_drop_down(course_retrain_open_input_id, course_retrain_open_input_value)
end

def enter_course_complete(course_complete_input_id, course_complete_input_value)
  select_from_drop_down(course_complete_input_id, course_complete_input_value)
end

def enter_course_availability(course_availability_input_id, course_availability_input_value)
  select_from_drop_down(course_availability_input_id, course_availability_input_value)
end

def enter_course_certificate_template(course_certificate_template_id, course_certificate_template_value)
  select_from_drop_down(course_certificate_template_id, course_certificate_template_value)
end

def enter_course_self_enrol(course_self_enroll_input_id, course_self_enroll_input_value)
  select_from_drop_down(course_self_enroll_input_id, course_self_enroll_input_value)
end

def enter_course_section_description(course_show_sec_desc_input_id, course_show_sec_desc_input_value)
  select_from_drop_down(course_show_sec_desc_input_id, course_show_sec_desc_input_value)
end

def create_a_new_course_and_verify(form_template_save_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(form_template_save_btn))
end


def search_a_course(course_list_search_box_id, course_list_title_value, course_search_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(course_list_search_box_id, course_list_title_value))
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_search_btn_id))
end

def edit_the_first_course_from_table(xpath_name, partial_link_text)
  Sleep_Until($driver.find_elements(:xpath, xpath_name).last.click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
end

def delete_the_first_course_from_table(xpath_name, partial_link_text)
  Sleep_Until($driver.find_elements(:xpath, xpath_name).last.click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
end

# def delete_the_first_course_from_table(class_name,index_value, partial_link_text)
#   Sleep_Until(WaitForDropdownByClassAndTouchTheIndex(class_name, index_value))
#   Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
# end

def click_on_button_in_iframe(course_delete_btn_name_id)
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    select_item = wait.until {
      element = $driver.find_element(:id, "iframe")
      element if element.displayed?

    }
    $driver.switch_to.frame(select_item)

    Sleep_Until($driver.find_element(:xpath, course_delete_btn_name_id).click)
    sleep (1)
    Sleep_Until(VerifyAnElementExistByXPath("//div[@class='col-md-12']", 'Course has been deleted!'))
    $driver.switch_to.parent_frame
    Sleep_Until($driver.find_element(:xpath, "//button[contains(@class,'close')]").click)

  rescue Exception => e
    puts e.message
    $driver.quit
  end
end


def add_a_new_section(course_add_a_section_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_add_a_section_btn_id))
  # sleep (1)
end


def select_an_activity(select_activity_name)
  Sleep_Until($driver.find_elements(:id, COURSE_SECTION_DROPDOWN_ID).last.click)
  Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_SEARCH_ID).last.send_keys(select_activity_name))
  puts "Adding activity: " + $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID).last.text
  Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID).last.click)
  Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
end

def create_an_activity(course_activity_name)
  begin

    case course_activity_name

      when "Acknowledgement"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(ACK_TITLE_ID, ACK_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(ACK_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(ACK_ACTIVITY_EDITOR_TXT, 1))
          click_on_save_button(ACK_SAVE_BTN_ID)
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ACK_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "ELMO Module"
        begin
        end

      when "ELMO Survey"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(SURVEY_TITLE_ID, SURVEY_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(SURVEY_ACTIVITY_EDITOR_TXT, 0))
          click_on_save_button(SURVEY_SAVE_BTN_ID)
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, SURVEY_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Face-to-Face"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_TITLE_ID, F2F_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(F2F_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(F2F_ACTIVITY_EDITOR_TXT, 1))
          click_on_save_button(F2F_SAVE_BTN_ID)
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, F2F_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Quiz"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(QUIZ_TITLE_ID, QUIZ_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(QUIZ_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(QUIZ_ACTIVITY_EDITOR_TXT, 1))
          Sleep_Until(WaitForAnElementByXpathAndInputValue(QUIZ_PASS_MARK_ID, QUIZ_PASS_MARK_VALUE))
          $driver.find_elements(:xpath, QUIZ_SAVE_BTN_ID).last.click
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, QUIZ_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "File"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(FILE_TITLE_ID, FILE_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(FILE_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(WaitForAnElementByXpathAndTouch(FILE_SELECT_FILE_ID))
          Sleep_Until(select_a_file(BROWSE_FILE_ID, FILE_NAME))
          click_on_save_button(FILE_SAVE_BTN_ID)
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, FILE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Label"
        begin
          Sleep_Until(use_ckeditor_to_enter_description(LABEL_ACTIVITY_EDITOR_TXT, 0))
          click_on_save_button(LABEL_SAVE_BTN_ID)
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, LABEL_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Page"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(PAGE_TITLE_ID, PAGE_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(PAGE_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(PAGE_ACTIVITY_EDITOR_TXT, 1))
          click_on_save_button(PAGE_SAVE_BTN_ID)
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, PAGE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Post"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(POST_TITLE_ID, POST_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(POST_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(POST_ACTIVITY_EDITOR_TXT, 1))
          click_on_save_button(POST_SAVE_BTN_ID)
          Sleep_Until(verifySuccessMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, POST_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

    end

  end
end

def click_on_save_button(btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(btn_id))
  sleep (1)
end

def delete_a_section(section_name)
  Sleep_Until($driver.find_elements(:class, section_name).last.click)
  Sleep_Until(PressEnterConfirm())
  sleep(3)
end


def create_all_notifications()
  begin
    click_add_notification_button()
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_trigger").click)
    limit = $driver.find_elements(:class, "select2-result-selectable").count-1
    puts "Number of Notification Triggers Found: \"#{limit+1}\"\n"
    Sleep_Until($driver.find_elements(:class, "select2-drop").last.click)
    Sleep_Until($driver.find_element(:xpath, "//button[contains(.,'×')]").click)
    add_notification_trigger (limit)
  end
end

def add_notification_trigger(limit)
  i = 0
  for loop in i..limit do
    click_add_notification_button()
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_trigger").click)
    Sleep_Until($driver.find_elements(:class, "select2-result-selectable")[loop].click)
    add_notification_template()
    loop += 1
  end
  puts "Number of Notification Templates added: \"#{limit+1}\"\n"
end


def click_add_notification_button()
  Sleep_Until($driver.find_elements(:xpath, ADD_NOTIFICATION_BUTTON_ID).first.click)
end

def add_notification_template()
  begin
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_template").click)
    puts "Added Template: " + $driver.find_elements(:class, "select2-result-selectable").last.text
    Sleep_Until($driver.find_elements(:class, "select2-result-selectable").last.click)
    Sleep_Until($driver.find_elements(:xpath, "//button[contains(@id,'next')]").first.click)
    sleep(2)
    check_for_trigger_date()
    Sleep_Until(save_notification_template())
  end
end

#This checks if there's an id, "s2id_templateNotification_dueDatePosition" with any value or not. If there's no value then it selects the 1st available option
def check_for_trigger_date()
  if Sleep_Until($driver.find_element(:id, "s2id_templateNotification_dueDatePosition").text) == " "
    begin
    if Sleep_Until($driver.find_element(:id, "s2id_templateNotification_dueDatePosition").text) == nil
      begin
        Sleep_Until($driver.find_element(:id, "s2id_templateNotification_dueDatePosition").click)
        Sleep_Until($driver.find_elements(:class, "select2-result-selectable").last.click)
        Sleep_Until($driver.find_element(:id, "templateNotification_dueDateNumber").send_keys("7"))
        Sleep_Until($driver.find_element(:id, "s2id_templateNotification_dueDateUnit").click)
        Sleep_Until($driver.find_elements(:class, "select2-result-selectable").last.click)
        end
      end
    end
  end
end



def save_notification_template()
  begin
    Sleep_Until($driver.find_elements(:xpath, ADD_NOTIFICATION_TEMP_SAVE_BUTTON_ID).last.click)
    sleep (1)
  end
end

def add_admin_notification_templates()
  begin
    click_add_notification_button()
    Sleep_Until($driver.find_elements(:class, "select2-choice").first.click)
    limit = $driver.find_elements(:class, "select2-result-selectable").count-1
    puts "Number of Notification Triggers Found: \"#{limit+1}\"\n"
    Sleep_Until($driver.find_elements(:class, "select2-drop").last.click)
  end
end

def click_on_first_f2f_activity(f2f_link_text)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(f2f_link_text))
end

def click_add_f2f_session_btn(f2f_session_add_session_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(f2f_session_add_session_btn))
end

def add_f2f_session()
  Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_ADD_FILE_ID))
  Sleep_Until(select_a_file(BROWSE_FILE_ID, FILE_NAME))
end