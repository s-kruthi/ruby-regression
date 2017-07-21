
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

# def findIdOfDocumentInstance()
#   sleep(1)
#   path_url = $driver.current_url
#   path_id = path_url.split('/')[-2]
#   $document_path_id = "/#{path_id}"
#   puts "Document Path ID: #{$document_path_id}"
#   sleep(1)
# end

def search_a_course(course_list_search_box_id, course_list_title_value, course_search_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(course_list_search_box_id, course_list_title_value))
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_search_btn_id))
end

def edit_the_first_course_from_table(class_name, index_value, partial_link_text)
  Sleep_Until(WaitForDropdownByClassAndTouchTheIndex(class_name, index_value))
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
end

def delete_the_first_course_from_table(class_name,index_value, partial_link_text)
  Sleep_Until(WaitForDropdownByClassAndTouchTheIndex(class_name, index_value))
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
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
      $driver.quit
    end
end





def click_on_a_sub_tab(sub_tab_name_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(sub_tab_name_id))
end

def add_a_new_section(course_add_a_section_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_add_a_section_btn_id))
end


def select_an_activity(select_activity_name)
  begin

    case select_activity_name

      when "Acknowledgement"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[0].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "ELMO Module"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[1].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "ELMO Survey"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[2].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "Face-to-Face"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[4].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "Quiz"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[5].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "File"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[7].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "Label"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[8].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "Page"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[9].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

      when "Post"
        begin
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click)
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[10].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
        end

    end

  end
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
end

def delete_a_section(section_name)
  Sleep_Until($driver.find_elements(:class, section_name).last.click)
  Sleep_Until(PressEnterConfirm())
  sleep (3)
end


def create_all_notifications()
  begin
    click_add_notification_button()
    # Sleep_Until($driver.find_elements(:class, "select2-choice").first.click)
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_trigger").click)
    limit = $driver.find_elements(:class, "select2-result-selectable").count-1
    puts "Number of Notification Triggers Found: \"#{limit+1}\"\n"
    Sleep_Until($driver.find_elements(:class, "select2-drop").last.click)
    Sleep_Until($driver.find_element(:xpath, "//button[contains(.,'×')]").click)
    add_notification_trigger (limit)
  end
end

def click_add_notification_button()
  Sleep_Until($driver.find_elements(:xpath, ADD_NOTIFICATION_BUTTON_ID).first.click)
end

def add_notification_trigger(limit)
  i = 0
  for loop in i..limit do
    click_add_notification_button()
    # Sleep_Until($driver.find_elements(:class, "select2-choice").first.click)
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_trigger").click)
    Sleep_Until($driver.find_elements(:class, "select2-result-selectable")[loop].click)
    add_notification_template()
    loop += 1
  end
  puts "Number of Notification Templates added: \"#{limit+1}\"\n"
end

def add_notification_template()
  begin
    # Sleep_Until($driver.find_elements(:class, "select2-choice").last.click)
    $driver.find_element(:id, "s2id_templateNotification_template").click
    Sleep_Until($driver.find_elements(:class, "select2-result-selectable").last.click)
    Sleep_Until($driver.find_elements(:xpath, "//button[contains(@id,'next')]").first.click)
    save_notification_template()
  end
end

def save_notification_template()
  begin
    Sleep_Until($driver.find_elements(:xpath, ADD_NOTIFICATION_TEMP_SAVE_BUTTON_ID).last.click)
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