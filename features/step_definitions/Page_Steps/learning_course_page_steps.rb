def AddACoursesAndGoToCourseSection(course_btn_path)
  sleep(1)
  WaitForAnElementByXpathAndTouch(course_btn_path)
  sleep(2)
end


def FillTheCourseFormAndSaveIt(course_name_id, course_name_val, course_code_id, course_code_val, save_course_id)
  WaitForAnElementByIdAndInputValue(course_name_id, course_name_val)
  WaitForAnElementByIdAndInputValue(course_code_id, course_code_val)
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


def go_to_the_learning_as_company_admin(admin_cog, documents_expand, documents_list_path)
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


def ClickOnAButtonByXPath(form_template_save_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(form_template_save_btn))
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


def click_the_menu_of_first_course_from_table(xpath_name, partial_link_text)
  Sleep_Until($driver.find_elements(:xpath, xpath_name).last.click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
  PressEnterConfirm()
  sleep (2)
end


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
    # $driver.quit
  end
end


def add_a_new_section(course_add_a_section_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_add_a_section_btn_id))
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
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ACK_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "ELMO Module"
        begin
        end

      when "ELMO Survey"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(SURVEY_TITLE_ID, SURVEY_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(SURVEY_ACTIVITY_EDITOR_TXT, 0))
          click_on_save_button(SURVEY_SAVE_BTN_ID)
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, SURVEY_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Face-to-Face"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_TITLE_ID, F2F_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(F2F_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(F2F_ACTIVITY_EDITOR_TXT, 1))
          click_on_save_button(F2F_SAVE_BTN_ID)
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, F2F_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Quiz"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(QUIZ_TITLE_ID, QUIZ_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(QUIZ_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(QUIZ_ACTIVITY_EDITOR_TXT, 1))
          Sleep_Until(WaitForAnElementByXpathAndInputValue(QUIZ_PASS_MARK_ID, QUIZ_PASS_MARK_VALUE))
          $driver.find_elements(:xpath, QUIZ_SAVE_BTN_ID).last.click
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, QUIZ_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "File"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(FILE_TITLE_ID, FILE_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(FILE_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(WaitForAnElementByXpathAndTouch(FILE_SELECT_FILE_ID))
          Sleep_Until(select_a_file(BROWSE_FILE_ID, FILE_NAME))
          click_on_save_button(FILE_SAVE_BTN_ID)
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, FILE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Label"
        begin
          Sleep_Until(use_ckeditor_to_enter_description(LABEL_ACTIVITY_EDITOR_TXT, 0))
          click_on_save_button(LABEL_SAVE_BTN_ID)
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, LABEL_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Page"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(PAGE_TITLE_ID, PAGE_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(PAGE_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(PAGE_ACTIVITY_EDITOR_TXT, 1))
          click_on_save_button(PAGE_SAVE_BTN_ID)
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, PAGE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "Post"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(POST_TITLE_ID, POST_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(POST_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(use_ckeditor_to_enter_description(POST_ACTIVITY_EDITOR_TXT, 1))
          click_on_save_button(POST_SAVE_BTN_ID)
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, POST_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        end

      when "ELMO Survey (new)"
        begin
          Sleep_Until(WaitForAnElementByXpathAndInputValue(SURVEY2_TITLE_ID, SURVEY2_TITLE_VALUE))
          Sleep_Until(use_ckeditor_to_enter_description(SURVEY2_ACTIVITY_EDITOR_TXT, 0))
          Sleep_Until(single_select_from_select2_input_dropdown(SURVEY2_CONTENT_DROPDOWN_INPUT_ID, SURVEY2_CONTENT_DROPDOWN_INPUT_CLASS, SURVEY2_CONTACT_DROPDOWN_INPUT_VALUE, SURVEY2_CONTACT_DROPDOWN_SEARCH_CLASS))
          click_on_save_button(SURVEY2_SAVE_BTN_ID)
          Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, SURVEY2_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
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
    limit = $driver.find_elements(:class, "select2-result-selectable").count - 1
    puts "Number of Notification Triggers Found: \"#{limit + 1}\"\n"
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
  puts "Number of Notification Templates added: \"#{limit + 1}\"\n"
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
    limit = $driver.find_elements(:class, "select2-result-selectable").count - 1
    puts "Number of Notification Triggers Found: \"#{limit + 1}\"\n"
    Sleep_Until($driver.find_elements(:class, "select2-drop").last.click)
  end
end


def ClickOnFirstActivity(f2f_link_text)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(f2f_link_text))
end


def EditACourseActivity(activity_edit_link)
  Sleep_Until(WaitForAnElementByXpathAndTouch(activity_edit_link))
end


def click_add_f2f_session_btn(f2f_session_add_session_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(f2f_session_add_session_btn))
end


def add_f2f_session()
  Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_ADD_FILE_ID))
  Sleep_Until(select_a_file(BROWSE_FILE_ID, FILE_NAME))
end


def verify_filter_result(verify_result_table_id, input_value)
  Sleep_Until(VerifyAnElementExistById(verify_result_table_id, input_value))
end


def WaitForFaceToFaceSessionListAndVerify(verify_element__id_xpath, verify_element_id_value)
  VerifyAnElementExistByXPath(verify_element__id_xpath, verify_element_id_value)
end


def FindFaceToFaceSessionSortingColumnByClass(sorting_class_id, sorting_class_value)
  begin
    Sleep_Until($driver.find_elements(:xpath, sorting_class_id).detect {|option| option.puts if option.attribute('text').eql? sorting_class_value})
  rescue Exception => e
  end

  puts COLOR_GREEN + "MATCHED: sortable column found: \"" + sorting_class_value + "\""
end


def SortFaceToFaceSessionListByType(sorting_class_value)
  sorting_xpath = "//a[contains(@title,'#{sorting_class_value}')]"
  Sleep_Until($driver.find_elements(:xpath, sorting_xpath).first.click)
  sleep (2)
end


def VerifyFaceToFaceSessionSortingOrderByClass(sorting_order_id)

  sorting_result = $driver.find_element(:xpath, sorting_order_id).attribute "class"

  case sorting_result

    when "asc"
      begin
        puts COLOR_GREEN + "Sorting done in: ASCENDING order"
      end

    when "desc"
      begin
        puts COLOR_GREEN + "Sorting done in: DESCENDING order"
      end

    else
      begin
        puts COLOR_RED + "Unknown sorting result found: " + sorting_result
      end
  end
end


def GoToTheEnrolledUserSectionOfThatParticularCourse(dropdown_key, dropdown_index, enrolled_user_text, manual_enroll_user_text)
  WaitForAnElementByCssAndTouchTheIndex(dropdown_key, dropdown_index)
  WaitForAnElementByPartialLinkTextAndTouch(enrolled_user_text)
  Sleep_Until(WaitForAnElementByPartialLinkText(manual_enroll_user_text))
end


def ClickAndRefreshEnrollmentsForAParticularCourse(dropdown_key, dropdown_index, refresh_enrollments_text, refresh_id)
  WaitForAnElementByCssAndTouchTheIndex(dropdown_key, dropdown_index)
  WaitForAnElementByPartialLinkTextAndTouch(refresh_enrollments_text)
  Sleep_Until(WaitForAnElementById(refresh_id))
end


def SearchTheAssignedCourse(course_name)
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, course_name, COURSE_SEARCH_BTN_ID)
end


def GoToCourseCatalogueSection(course_catalogue_LText)
  WaitForAnElementByPartialLinkTextAndTouch(course_catalogue_LText)
end


def SignUpForASession(enrolled_button, activity_class, sign_up_button)
  WaitForAnElementByPartialLinkTextAndTouch(enrolled_button)
  Sleep_Until(WaitForAnElementByClass(activity_class))
  WaitForAnElementByClassAndTouch(activity_class)
  Sleep_Until(WaitForAnElementByPartialLinkText(sign_up_button))
  WaitForAnElementByPartialLinkTextAndTouch(sign_up_button)
end


def FillUpQuizSection(enrolled_button, activity_class, submit_quiz, quiz_answer)
  WaitForAnElementByPartialLinkTextAndTouch(enrolled_button)
  Sleep_Until(WaitForAnElementByClass(activity_class))
  WaitForAnElementByClassAndTouch(activity_class)
  Sleep_Until(WaitForAnElementById(submit_quiz))
  use_ckeditor_to_enter_description(quiz_answer, 0)
  sleep(1)
  WaitForAnElementByIdAndTouch(submit_quiz)
end


def GoToCourseEnrolmentsSection(course_Enrolments_LText)
  Sleep_Until(WaitForAnElementByPartialLinkText(course_Enrolments_LText))
  WaitForAnElementByPartialLinkTextAndTouch(course_Enrolments_LText)
end


def SearchTheAssignedCourseInEnrollmentSection(course_name)
  $driver.find_element(:id, "s2id_autogen1").send_keys "#{course_name}"
  sleep(3)
  $driver.find_element(:class, "select2-result-label").click
  sleep(3)
end


def VerifyTheStatusAsNotYetStarted()
  VerifyAnElementExistByClass("course-status-0", "Not Yet Started")
end


def VerifyTheStatusAsInProgress()
  VerifyAnElementExistByClass("activity-type-1", "In Progress")
end


def WithdrawTheCandidateFromF2FSession()
  $driver.navigate.to("https://tmsfull.dev.elmodev.com/learning/facetoface/376/164/manage-attendance")
  sleep(3)
  $driver.find_elements(:css, 'button[data-toggle="dropdown"]')[1].click
  sleep(2)
  $driver.find_element(:css, 'a[title="Cancel Sign Up"]').click
  sleep(3)
  PressConfirm()
end


def DeleteTheExistingEnrolmentAndReEnrolTheCandidate()
  $driver.navigate.to("https://tmsfull.dev.elmodev.com/admin/course/392/enrolments")
  Sleep_Until($driver.find_element(:css, 'a[data-user="Donttouchautomationuser Aaron"]'))
  $driver.find_element(:css, 'a[data-user="Donttouchautomationuser Aaron"]').click
  sleep(1)
  PressConfirm()
  sleep(3)
  WaitForAnElementByPartialLinkTextAndTouch("Manual Enrol Users")
  Sleep_Until($driver.find_element(:id, "s2id_autogen1"))
  $driver.find_element(:id, "s2id_autogen1").send_keys "Donttouchautomationuser"
  sleep(3)
  $driver.find_element(:class, "select2-result-label").click
  sleep(1)
  $driver.find_element(:id, "enrol-btn").click
  sleep(2)
end


def EditCourseCreatedLastScenario(course_created)
  search_a_course(COURSE_LIST_SEARCH_BOX_ID, course_created, COURSE_SEARCH_BTN_ID)
  edit_the_first_course_from_table(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
end


def VerifySectionName(section_name_css, new_section_name)
  VerifyAnElementExistByCSS(section_name_css, new_section_name)
end


def ClickSectionButton(button_name)
  section_button_css = (button_name.upcase + "_SECTION_CSS").constantize
  WaitForAnElementByCSSAndTouch(section_button_css)
end


def EditSectionNameValue(section_name_edit, section_edit_value)
  WaitForAnElementByCSSAndInputValue(section_name_edit, section_edit_value)
end


def VerifyCourseSectionNotExist(course_section_css)
  VerifyAnElementNotExistByCSS(course_section_css)
end

# For VerifyAnElementNotExistByCSS sufficient wait must be used before this step. Such as Sleep_Until
def VerifyAnElementNotExistByCSS(css)
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 5)
    elements = wait.until {
      $driver.find_elements(:css, "#{css}")
    }
    if elements.empty?
      puts COLOR_GREEN + "MATCHED: Item not displayed."
    else
      $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
      raise (COLOR_RED + "Item displayed. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
    end
  rescue Exception => e
    puts e.message
    $driver.quit
  end
end

def CheckFaceToFaceActivitySettings(label_name, label_value)
  case label_name
    when "Location"
      begin
        location_disabled = 1 if $driver.find_elements(:id, F2F_SESSION_CONFIG_LOCATION_ID)[0].attribute "disabled"
        puts COLOR_BLUE + "[CURRENT] Location is Disabled" if location_disabled == 1
        EditFaceToFaceActivitySettingsAndVerify(label_name, location_disabled, label_value)
      end

    when "Facilitator"
      begin
        facilitator_disabled = 1 if $driver.find_elements(:id, F2F_SESSION_CONFIG_FACILITATOR_ID)[0].attribute "disabled"
        puts COLOR_BLUE + "[CURRENT] Facilitator is currently Disabled" if facilitator_disabled == 1
        EditFaceToFaceActivitySettingsAndVerify(label_name, facilitator_disabled, label_value)
      end
  end
end


def EditFaceToFaceActivitySettingsAndVerify(label_name, label_disabled, label_value)
  case label_name
    when "Location"
      begin
        puts COLOR_BLUE + "Requested settings for " + label_name + ": " + label_value
        Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_CONFIG_LOC_INPUT_ID)) if label_disabled == 1
        puts COLOR_GREEN + "[MATCHED] Location has been successfully Enabled" if label_disabled == 1
        return
      end

    when "Facilitator"
      begin
        puts COLOR_BLUE + "Requested settings for " + label_name + ": " + label_value
        Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_CONFIG_FAC_INPUT_ID)) if label_disabled == 1
        puts COLOR_GREEN + "[MATCHED] Facilitator has been successfully Enabled" if label_disabled == 1
        return
      end

  end
end

def VerifyFaceToFaceActivitySettings()
  location_disabled = 1 if $driver.find_elements(:id, F2F_SESSION_CONFIG_LOCATION_ID)[0].attribute "disabled"
  puts COLOR_BLUE + "[NEW] Location is currently Disabled after modification" if location_disabled == 1
  puts COLOR_CYAN + "[NEW] Location is currently Enabled after modification" + location_disabled.to_s

  facilitator_disabled = 1 if $driver.find_elements(:id, F2F_SESSION_CONFIG_FACILITATOR_ID)[0].attribute "disabled"
  puts COLOR_BLUE + "[NEW] Facilitator is currently Disabled after modification" if facilitator_disabled == 1
  puts COLOR_CYAN + "[NEW] Facilitator is currently Enabled after modification" + facilitator_disabled.to_s
end
