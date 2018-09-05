def AddACoursesAndGoToCourseSection(course_btn_path)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_btn_path))
end


def FillTheCourseFormAndSaveIt(course_name_id, course_name_val, course_code_id, course_code_val, save_course_id)
  Sleep_Until(WaitForAnElementByIdAndInputValue(course_name_id, course_name_val))
  Sleep_Until(WaitForAnElementByIdAndInputValue(course_code_id, course_code_val))
  MakeItVisibleToAllUsers()
  Sleep_Until(WaitForAnElementByIdAndTouch(save_course_id))
end


def MakeItVisibleToAllUsers()
  SelectFromDropdown(COURSE_AVAILABILITY_ID, 'Available to all users')
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
  GoToItemLandingPage(documents_list_path)
end


def EnterCourseTitle(new_course_title_id, new_course_title_value)
  WaitForAnElementByXpathAndInputValue(new_course_title_id, new_course_title_value)
end


def EnterCourseCode(new_course_code_id, new_course_code_value)
  WaitForAnElementByXpathAndInputValue(new_course_code_id, new_course_code_value)
end


def EnterCourseDescription(form_temp_desc_txt, index_id)
  UseCkeditorToEnterText(form_temp_desc_txt, index_id)
end


# TODO: Redundant code after PMS-14710 has been released
def EnterCourseRetrain(course_retrain_input_id, course_retrain_input_value)
  SelectFromDropdown(course_retrain_input_id, course_retrain_input_value)
end


def EnterCourseRetrainOpen(course_retrain_open_input_id, course_retrain_open_input_value)
  SelectFromDropdown(course_retrain_open_input_id, course_retrain_open_input_value)
end


def EnterCourseComplete(course_complete_input_id, course_complete_input_value)
  SelectFromDropdown(course_complete_input_id, course_complete_input_value)
end


def EnterCourseAvailability(course_availability_input_id, course_availability_input_value)
  SelectFromDropdown(course_availability_input_id, course_availability_input_value)
end


def EnterCourseCertificateTemplate(course_certificate_template_id, course_certificate_template_value)
  SelectFromDropdown(course_certificate_template_id, course_certificate_template_value)
end


def EnterCourseSelfEnrol(course_self_enroll_input_id, course_self_enroll_input_value)
  SelectFromDropdown(course_self_enroll_input_id, course_self_enroll_input_value)
end


def EnterCourseSectionDescription(course_show_sec_desc_input_id, course_show_sec_desc_input_value)
  SelectFromDropdown(course_show_sec_desc_input_id, course_show_sec_desc_input_value)
end


# TODO: PMS-14710 - Using case select for Learning Logic Gap project. This will be implemented once changes are deployed in production/tmsfull
# def EnterCourseSectionDescription(course_show_sec_desc_input_id, select2_input_id, course_show_sec_desc_input_value, select2_dropdown_class)
#   SingleSelectFromSelect2Dropdown(course_show_sec_desc_input_id, select2_input_id, course_show_sec_desc_input_value, select2_dropdown_class)
# end
#
#
# def EnterCourseCompleteUnit(course_complete_input_unit_id, select2_dropdown_id, course_complete_input_unit_value, select2_dropdown_class)
#     SingleSelectFromSelect2Dropdown(course_complete_input_unit_id, select2_dropdown_id, course_complete_input_unit_value, select2_dropdown_class)
# end
#
#
# def EnterCourseCompleteValue(course_complete_input_id, course_complete_input_value)
#   WaitForAnElementByXpathAndInputValue(course_complete_input_id, course_complete_input_value)
# end
#
#
# def EnterCourseRetrainUnit(course_retrain_input_unit_id, select2_dropdown_id, course_retrain_input_unit_value, select2_dropdown_class)
#     SingleSelectFromSelect2Dropdown(course_retrain_input_unit_id, select2_dropdown_id, course_retrain_input_unit_value, select2_dropdown_class)
# end
#
#
# def EnterCourseRetrainValue(course_retrain_input_id, course_retrain_input_value)
#   $driver.find_element(:xpath, course_retrain_input_id).clear
#   WaitForAnElementByXpathAndInputValue(course_retrain_input_id,course_retrain_input_value)
# end
#
#
# def EnterCourseRetrainOpenUnit(course_retrain_open_input_unit_id, select2_input_id, course_retrain_open_input_unit_value, select2_dropdown_class)
#     SingleSelectFromSelect2Dropdown(course_retrain_open_input_unit_id, select2_input_id, course_retrain_open_input_unit_value, select2_dropdown_class)
# end
#
#
# def EnterCourseRetrainOpenValue(course_retrain_open_input_id, course_retrain_open_input_value)
#   $driver.find_element(:xpath, course_retrain_open_input_id).clear
#   WaitForAnElementByXpathAndInputValue(course_retrain_open_input_id, course_retrain_open_input_value)
# end
#
#
# def EnterCourseAvailability(course_availability_input_id, select2_input_id, course_availability_input_value, select2_dropdown_class)
#     SingleSelectFromSelect2Dropdown(course_availability_input_id, select2_input_id, course_availability_input_value, select2_dropdown_class)
# end
#
#
# def EnterCourseCertificateTemplate(course_certificate_template_id, select2_input_id, course_certificate_template_value, select2_dropdown_class)
#     SingleSelectFromSelect2Dropdown(course_certificate_template_id, select2_input_id, course_certificate_template_value, select2_dropdown_class)
# end
#
#
# def EnterCourseSelfEnrol(course_self_enroll_input_id, select2_input_id, course_self_enroll_input_value, select2_dropdown_class)
#     SingleSelectFromSelect2Dropdown(course_self_enroll_input_id, select2_input_id, course_self_enroll_input_value, select2_dropdown_class)
# end


def ClickOnAButtonByXPath(form_template_save_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(form_template_save_btn))
end


def SearchACourse(course_list_search_box_id, course_list_title_value, course_search_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(course_list_search_box_id, course_list_title_value))
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_search_btn_id))
end


def ClickMenuOfFirstItemFromTable(xpath_name, partial_link_text)
  Sleep_Until($driver.find_elements(:xpath, xpath_name).last.click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
end


def CourseActionConfirm(course_action_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_action_id))
  sleep (3)
end


def AddANewSection(course_add_a_section_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_add_a_section_btn_id))
  #Adding sleep intentionally,if course has too many activities, it takes time to scroll down the page
  sleep (1)
end


def SelectAnActivity(select_activity_name)
  # Sleep_Until(WaitForAnElementByIdAndTouch(COURSE_SECTION_DROPDOWN_ID))
  # This is a quick hack to ensure the last dropdown is selected since that is the one which gets created from AddANewSection() method
  Sleep_Until($driver.find_elements(:id, COURSE_SECTION_DROPDOWN_ID).last.click)
  Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_SEARCH_ID).last.send_keys(select_activity_name))
  puts COLOR_BLUE + "Adding activity: " + $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID).last.text
  Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID).last.click)
end


def CreateAnActivity(course_activity_name)
  Sleep_Until($driver.find_elements(:xpath, COURSE_ADD_ACTIVITY_BTN_ID).last.click)

  begin

    case course_activity_name
    when "Acknowledgement"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, ACK_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(ACK_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(ACK_ACTIVITY_EDITOR_TXT, 1))
        AddFile()
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "ELMO Module"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, ELMO_MODULE_ACTIVITY_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(ELMO_MODULE_ACTIVITY_EDITOR_TXT, 0))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ELMO_MODULE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "ELMO Survey"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, SURVEY_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(SURVEY_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(SURVEY_ACTIVITY_EDITOR_TXT, 0))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SURVEY_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Face-to-Face"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, F2F_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(F2F_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(F2F_ACTIVITY_EDITOR_TXT, 1))
        AddFile()
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Quiz"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, QUIZ_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 1))

        #Adding question
        Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_QUESTION_BTN_ID))
        Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 2))
        Sleep_Until(WaitForAnElementByXpathAndTouch(QUESTION_SAVE_BTN_ID))

        Sleep_Until(WaitForAnElementByXpathAndInputValue(QUIZ_PASS_MARK_ID, QUIZ_PASS_MARK_VALUE))
        $driver.find_elements(:xpath, SAVE_BTN_ID).last.click
        Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, QUIZ_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "SCORM Package"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(SCORM_TITLE_ID, SCORM_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(SCORM_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(WaitForAnElementByIdAndTouch(SELECT_FILE_ID))
        Sleep_Until(WaitForSelectFileButtonAndUploadFile(SCORM_FILE_NAME))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        sleep(2)
      end

    when "File"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, FILE_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(FILE_ACTIVITY_EDITOR_TXT, 0))
        AddFile()
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, FILE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Label"
      begin
        Sleep_Until(UseCkeditorToEnterText(LABEL_ACTIVITY_EDITOR_TXT, 0))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LABEL_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Page"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, PAGE_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(PAGE_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(PAGE_ACTIVITY_EDITOR_TXT, 1))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, PAGE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Post"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, POST_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 1))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, POST_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "ELMO Survey (new)"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, SURVEY2_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(SURVEY2_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(SingleSelectFromSelect2Dropdown(SURVEY2_CONTENT_DROPDOWN_INPUT_ID, SURVEY2_CONTENT_DROPDOWN_INPUT_CLASS, SURVEY2_CONTACT_DROPDOWN_INPUT_VALUE, SURVEY2_CONTACT_DROPDOWN_SEARCH_CLASS))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    end
  end
end


def EditACourseActivity(course_activity_type)
  begin

    case course_activity_type
    when "Acknowledgement"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, ACK_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(ACK_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(ACK_ACTIVITY_EDITOR_TXT, 1))
        AddFile()
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "ELMO Module"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, ELMO_MODULE_ACTIVITY_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(ELMO_MODULE_ACTIVITY_EDITOR_TXT, 0))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ELMO_MODULE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "ELMO Survey"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, SURVEY_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(SURVEY_ACTIVITY_EDITOR_TXT, 0))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SURVEY_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Face-to-Face"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID + " edit"))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, F2F_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(F2F_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(F2F_ACTIVITY_EDITOR_TXT, 1))
        AddFile()
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Quiz"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, QUIZ_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 1))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, QUIZ_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "SCORM Package"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(SCORM_TITLE_ID, SCORM_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(SCORM_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(WaitForAnElementByIdAndTouch(SELECT_FILE_ID))
        Sleep_Until(WaitForSelectFileButtonAndUploadFile(SCORM_FILE_NAME))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ACTIVITY_SAVE_SUCCESSFUL_VALUE))
        sleep(2)
      end

    when "File"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, FILE_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(FILE_ACTIVITY_EDITOR_TXT, 0))
        AddFile()
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, FILE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Label"
      begin
        Sleep_Until(UseCkeditorToEnterText(LABEL_ACTIVITY_EDITOR_TXT, 0))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LABEL_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Page"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, PAGE_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(PAGE_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(PAGE_ACTIVITY_EDITOR_TXT, 1))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, PAGE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "Post"
      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, POST_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 1))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, POST_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end


      begin
        Sleep_Until(WaitForAnElementByXpathAndClearValue(COURSE_ACTIVITY_TITLE_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, SURVEY2_TITLE_VALUE + " edit"))
        Sleep_Until(UseCkeditorToEnterText(SURVEY2_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(SingleSelectFromSelect2Dropdown(SURVEY2_CONTENT_DROPDOWN_INPUT_ID, SURVEY2_CONTENT_DROPDOWN_INPUT_CLASS, SURVEY2_CONTACT_DROPDOWN_INPUT_VALUE, SURVEY2_CONTACT_DROPDOWN_SEARCH_CLASS))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    end
  end
end


def ClickOnSaveButton(btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(btn_id))
  sleep (1)
end


def ClickOnFilterSaveButton(btn_id,filter_name_id,filter_name_value)
  Sleep_Until(WaitForAnElementByIdAndTouch(btn_id))
  Sleep_Until(WaitForAnElementByIdAndInputValue(filter_name_id,filter_name_value))
  sleep (1)
end

def DeleteASection(section_name)
  Sleep_Until($driver.find_elements(:class, section_name).last.click)
  Sleep_Until(PressEnterConfirm())
  sleep(3)
end


def CreateAllNotifications()
  begin
    #This line is a workaround used to store the elmo-table contents which will be used to check whether a template has already been added or not
    $template_list = $driver.find_element(:id, "elmo-table").text.split("\nEdit\nToggle dropdown to edit appraisal") if $driver.find_elements(:id, "elmo-table").empty? == false
    ClickAddNotificationButton()
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_trigger").click)
    limit = $driver.find_elements(:class, "select2-result-selectable").count - 1
    puts "Number of Notification Triggers Found: \"#{limit + 1}\"\n"
    Sleep_Until($driver.find_elements(:class, "select2-drop").last.click)
    Sleep_Until($driver.find_element(:xpath, "//button[contains(.,'×')]").click)
    AddNotificationTrigger(limit)
  end
end


def AddNotificationTrigger(limit)
  i = 0
  for loop in i..limit do
    ClickAddNotificationButton()
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_trigger").click)
    Sleep_Until($driver.find_elements(:class, "select2-result-selectable")[loop].click)
    AddNotificationTemplate()
    loop += 1
  end
end


def ClickAddNotificationButton()
  Sleep_Until($driver.find_elements(:xpath, ADD_NOTIFICATION_BUTTON_ID).first.click)
end


def AddNotificationTemplate()
  #Check for existing notification templates
  Sleep_Until($driver.find_element(:id, "s2id_templateNotification_template").click)
  $current_template = $driver.find_elements(:class, "select2-result-selectable").last.text

  if !($template_list.to_s.include? $current_template.to_s)
    begin
      puts "Added Template: " + $driver.find_elements(:class, "select2-result-selectable").last.text
      Sleep_Until($driver.find_elements(:class, "select2-result-selectable").last.click)
      Sleep_Until($driver.find_elements(:xpath, "//button[contains(@id,'next')]").first.click)
      sleep(2)
      CheckForTriggerDate()
      Sleep_Until(SaveNotificationTemplate())
    end

  else
    puts COLOR_BLUE + "Notification already exists: " + $driver.find_elements(:class, "select2-result-selectable").last.text
    Sleep_Until($driver.find_elements(:class, "select2-drop-mask").last.click)
    Sleep_Until($driver.find_element(:xpath, "//button[contains(.,'×')]").click)
    return
  end
end


#This checks if there's an id, "s2id_templateNotification_dueDatePosition" with any value or not. If there's no value then it selects the 1st available option
def CheckForTriggerDate()
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


def SaveNotificationTemplate()
  begin
    Sleep_Until($driver.find_elements(:xpath, ADD_NOTIFICATION_TEMP_SAVE_BUTTON_ID).last.click)
    sleep (1)
  end
end


def AddAdminNotificationTemplates()
  begin
    ClickAddNotificationButton()
    Sleep_Until($driver.find_elements(:class, "select2-choice").first.click)
    limit = $driver.find_elements(:class, "select2-result-selectable").count - 1
    puts "Number of Notification Triggers Found: \"#{limit + 1}\"\n"
    Sleep_Until($driver.find_elements(:class, "select2-drop").last.click)
  end
end


def ClickOnFirstActivity(f2f_link_text)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(f2f_link_text))
end


def ModifyACourseActivity(action_type, activity_edit_link_name)
  Sleep_Until($driver.find_elements(:xpath, "//a[contains(@title,'#{action_type} #{activity_edit_link_name}')]").last.click)
  if action_type == 'Delete'
    Sleep_Until(PressEnterConfirm())
  end
end


def click_add_f2f_session_btn(f2f_session_add_session_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(f2f_session_add_session_btn))
end


def add_f2f_session()
  Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_FILE_ID))
  Sleep_Until(select_a_file(BROWSE_FILE_ID, FILE_NAME))
end


def VerifyFilterResult(verify_result_table_id, input_value)
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
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, course_name, COURSE_SEARCH_BTN_ID)
end


def GoToCourseCatalogueSection(course_catalogue_LText)
  ClickOnATab(course_catalogue_LText)
end


def GoToCourseRequestSection(course_request_LText)
  WaitForAnElementByPartialLinkTextAndTouch(course_request_LText)
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
  Sleep_Until(UseCkeditorToEnterText(quiz_answer, 0))
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


def GoToSpecificCourseEnrolmentSection(course_id)
  $driver.navigate.to($site_url)
  enrol_user_url = $driver.current_url.chomp('/dashboard')
  puts "#{enrol_user_url}/admin/course/#{course_id}/enrolments"
  $driver.navigate.to("#{enrol_user_url}/admin/course/#{course_id}/enrolments")
end

def DeleteTheExistingCourseEnrolment()
  Sleep_Until($driver.find_element(:css, 'a[data-user="Donttouchautomationuser Aaron"]'))
  $driver.find_element(:css, 'a[data-user="Donttouchautomationuser Aaron"]').click
  sleep(1)
  PressConfirm()
  sleep(3)
end


def ReEnrolTheCandidateForCourse(candidate_name)
  WaitForAnElementByPartialLinkTextAndTouch("Manual Enrol Users")
  Sleep_Until($driver.find_element(:id, "s2id_autogen1"))
  $driver.find_element(:id, "s2id_autogen1").send_keys "#{candidate_name}"
  begin
    wait_valid = $driver.find_element(:class, "select2-results-1").text.include? "#{candidate_name}"
    Sleep_Until(wait_valid)
  rescue
    sleep(9)
  end
  $driver.find_element(:id, "select2-results-1").click
  sleep(1)
  $driver.find_element(:id, "enrol-btn").click
  sleep(2)
end


def EditCourseCreatedLastScenario(course_created)
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, course_created, COURSE_SEARCH_BTN_ID)
  ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
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
  VerifyAnElementNotExist("css", course_section_css)
end


def ConditionAnElementNotExistByCSS(css)
  wait = Selenium::WebDriver::Wait.new(:timeout => 5)
  elements = wait.until {
    $driver.find_elements(:css, "#{css}")
  }
  elements.empty?
end


def CheckActivitySettings(label_name, label_value)
  case label_name
  when "Location"
    begin
      label_disabled = $driver.execute_script("return $(#{F2F_SESSION_CONFIG_LOCATION_ID}).is(':checked')")
      puts COLOR_BLUE + "Location is Disabled" if label_disabled == false
      puts COLOR_BLUE + "Location is Enabled" if label_disabled == true
      #EditActivitySettings(label_name, label_disabled, label_value)
    end

  when "Facilitator"
    begin
      label_disabled = $driver.execute_script("return $(#{F2F_SESSION_CONFIG_FACILITATOR_ID}).is(':checked')")
      puts COLOR_BLUE + "Facilitator is currently Disabled" if label_disabled == false
      puts COLOR_BLUE + "Facilitator is currently Enabled" if label_disabled == true
      #EditActivitySettings(label_name, label_disabled, label_value)
    end

  when "Compulsory"
    begin
      label_disabled = $driver.execute_script("return $(#{SURVEY_CONFIG_COMPULSORY_ID}).is(':checked')")
      puts COLOR_BLUE + "Compulsory setting is currently Disabled" if label_disabled == false
      puts COLOR_BLUE + "Compulsory setting is currently Enabled" if label_disabled == true
      #EditActivitySettings(label_name, label_disabled, label_value)
    end
  end

  #edit only if requested settings is different from actual
  if label_disabled != label_value
    EditActivitySettings(label_name, label_disabled, label_value)
  end
end


def EditActivitySettings(label_name, label_disabled, label_value)
  case label_name
  when "Location"
    begin
      puts COLOR_BLUE + "Requested settings for " + label_name + ": " + label_value
      $driver.execute_script("$(#{F2F_SESSION_CONFIG_LOCATION_ID}).each(function() { var $this=$(this)\; if ($this.is(':checked') == false) { $this.parent().trigger('click') } })") if label_disabled == false
      # $driver.execute_script("$(#{F2F_SESSION_CONFIG_LOCATION_ID}).each(function() { var $this=$(this)\; if ($this.is(':checked') == true) { $this.parent().trigger('click') } })") if label_disabled == true
      return
    end

  when "Facilitator"
    begin
      puts COLOR_BLUE + "Requested settings for " + label_name + ": " + label_value
      $driver.execute_script("$(#{F2F_SESSION_CONFIG_FACILITATOR_ID}).each(function() { var $this=$(this)\; if ($this.is(':checked') == false) { $this.parent().trigger('click') } })") if label_disabled == false
      # $driver.execute_script("$(#{F2F_SESSION_CONFIG_FACILITATOR_ID}).each(function() { var $this=$(this)\; if ($this.is(':checked') == true) { $this.parent().trigger('click') } })") if label_disabled == true
      return
    end

  when "Compulsory"
    begin
      puts COLOR_BLUE + "Requested settings for " + label_name + ": " + label_value
      $driver.execute_script("$(#{SURVEY_CONFIG_COMPULSORY_ID}).each(function() { var $this=$(this)\; if ($this.is(':checked') == false) { $this.parent().trigger('click') } })") if label_disabled == false
      # $driver.execute_script("$(#{F2F_SESSION_CONFIG_FACILITATOR_ID}).each(function() { var $this=$(this)\; if ($this.is(':checked') == true) { $this.parent().trigger('click') } })") if label_disabled == true
      return
    end

  end
end


def VerifyFaceToFaceActivitySettings()
  location_disabled = $driver.execute_script("return $(#{F2F_SESSION_CONFIG_LOCATION_ID}).is(':checked')")
  puts COLOR_BLUE + "Location is now Disabled after value change" if location_disabled == false
  puts COLOR_BLUE + "Location is now Enabled after value change" if location_disabled == true

  facilitator_disabled = $driver.execute_script("return $(#{F2F_SESSION_CONFIG_FACILITATOR_ID}).is(':checked')")
  puts COLOR_BLUE + "Facilitator is now Disabled after value change" if facilitator_disabled == false
  puts COLOR_BLUE + "Facilitator is now Enabled after value change" if facilitator_disabled == true
end


def AddSessionDetails(session_status = '')
  #get the face to face session id from the url
  f2f_id = $driver.current_url.split('/')[6]

  Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 1))

  AddSessionTimings(session_status)

  #Enter min capacity
  Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_MIN_CAPACITY_INPUT_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_MIN_CAPACITY_INPUT_ID, F2F_SESSION_MIN_CAPACITY_INPUT_VALUE))

  # enter max capacity
  Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_MAX_CAPACITY_INPUT_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_MAX_CAPACITY_INPUT_ID, F2F_SESSION_MAX_CAPACITY_INPUT_VALUE))

  #check for location and facilitator settings for the course
  course_f2f_settings = $daos.get_f2f_location_facilitator_settings(f2f_id)

  if course_f2f_settings[:location] == 1
    Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_LOCATION_INPUT_ID))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_LOCATION_INPUT_ID, F2F_SESSION_LOCATION_INPUT_VALUE))
  else
    puts COLOR_BLUE + "Location is disabled for the Face to Face Activity"
  end
  if course_f2f_settings[:facilitator] == 1
    Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_FACILITATOR_INPUT_ID))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_FACILITATOR_INPUT_ID, F2F_SESSION_FACILITATOR_INPUT_VALUE))
  else
    puts COLOR_BLUE + "Facilitator is disabled for the Face to Face Activity"
  end

  # select availability
  SelectFromDropdown(F2F_SESSION_AVAILABILITY_INPUT_ID, F2F_SESSION_AVAILABILITY_INPUT_VALUE)
end


def AddFile()
  Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_FILE_ID))
  Sleep_Until(select_a_file(BROWSE_FILE_ID, FILE_NAME))
end


def AddSessionTimings(session_status = '')
  session_status_downcase = session_status.downcase
  #get time n date
  Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_ADD_PART_CLASS_ID))
  time = DateTime.now
  if session_status_downcase.include?('over')
    #start time is 7 days before now
    start_time = (time - 7)
    #finishing after 1hr
    end_time = start_time + (1 / 24.0)
  elsif session_status_downcase.include?('progress')
    #start time is 1 day before now
    start_time = (time - 1)
    #finishing is 1 day after now
    end_time = start_time + 1
  elsif session_status_downcase.include?('upcoming') || session_status_downcase.empty?
    #start time is 7 days from now
    start_time = (time + 7)
    #finishing after 1hr
    end_time = start_time + (1 / 24.0)
  end
  Sleep_Until($driver.find_elements(:xpath, F2F_SESSION_START_TIME).last.send_keys(start_time.strftime('%d/%m/%Y %H:%M')))
  Sleep_Until($driver.find_elements(:xpath, F2F_SESSION_FINISH_TIME).last.send_keys(end_time.strftime('%d/%m/%Y %H:%M')))
  FACE_TO_FACE_SESSION_VALUES['Start Time'.downcase] = start_time.strftime('%d %B %Y %I:%M %p')
  FACE_TO_FACE_SESSION_VALUES['Finish Time'.downcase] = end_time.strftime('%d %B %Y %I:%M %p')
end


def FillTitleAndDescriptionFieldAndSave(partial_id)
  WaitForAnElementByCSSAndTouch(EDIT_ACTIVITY_BUTTON_CSS)
  title_id = "input[id*=#{partial_id.to_s}][name*=name]"
  WaitForAnElementByCSSAndInputValue(title_id, EDITED_VALUE)
  UseCkeditorToEnterText(EDITED_VALUE, 0)
  ClickOnSaveButton(SAVE_BTN_ID)
  Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ACTIVITY_SAVE_SUCCESSFUL_VALUE))
end


def HandleEnrolmentOfCourse(role_type, enrolled)
  WaitForAnElementByCSSAndTouch("a[title='Edit Course'] + .btn")
  WaitForAnElementByCSSAndTouch("[title='Enrolled Users']")
  case enrolled
  when "Enrolled"
    UnenrolAllOnCourseEnrolmentPage() unless ConditionAnElementNotExistByCSS("tr[data-id]")
    EnrolUserWithRoleTypeOnCourseEnrolmentPage(role_type)
  when "NonEnrolled"
    UnenrolAllOnCourseEnrolmentPage() unless ConditionAnElementNotExistByCSS("tr[data-id]")
  end
end


def UnenrolAllOnCourseEnrolmentPage
  WaitForAnElementByIdAndTouch("select-all")
  Sleep_Until(WaitForAnElementByIdAndTouch("multiple_unenrolled"))
  Sleep_Until(PressConfirm())
end


def EnrolUserWithRoleTypeOnCourseEnrolmentPage(user)
  WaitForAnElementByCSSAndTouch("[title='Bulk Enrol Users']")
  user_name = USER_IN_ROLE.each do |key, value|
    break value if key.to_s.eql? "Employee"
  end
  WaitForAnElementByXpathAndTouch(%Q{//span[contains(text(), "#{user_name}")]/../preceding-sibling::*[1]})
  WaitForAnElementByIdAndTouch("enrol-btn")
  Sleep_Until(WaitForAnElementByCSSAndTouch(".process-action[data-action=run]"))
  sleep(5)
end


# Section for quiz Martinma123
def ModifyQuizTitleDescription
  WaitForAnElementByCSSAndTouch(EDIT_ACTIVITY_BUTTON_CSS)
  title_id = 'input[name*=name]'
  WaitForAnElementByCSSAndInputValue(title_id, EDITED_VALUE)
  UseCkeditorToEnterText(EDITED_VALUE, 0)
  ClickQuizSaveButton()
  Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ACTIVITY_SAVE_SUCCESSFUL_VALUE))
end


def ClickQuizSaveButton
  WaitForAnElementByIdAndTouch(QUIZ_SAVE_ID)
end


def ChooseFromSelect2DropdownByIndex(container_id, item_div_class, index)
  begin
    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
    select_item = wait.until {
      select2_arrow = $driver.find_element(:css, "div[id=#{container_id}] > *:first-child *:last-child")
      select2_arrow.click
      element = $driver.find_elements(:class, item_div_class.to_s)[index]
      element if element.present?
    }
    select_item.click
  rescue Selenium::WebDriver::Error::TimeOutError => e
    puts e.message
    $driver.quit
  end
end


def VerifySettingsOfQuizActivity()
  VerifyAnElementExistById(COMPLETION_ID, COMPLETION_VALUE)
  VerifyAnElementExistById(FEEDBACK_ID, FEEDBACK_VALUE)
  VerifyAnElementExistById(MARKER_ID, MARKER_VALUE)
end


def ChangeQuizSettings()
  ChooseFromSelect2DropdownByIndex(COMPLETION_ID, QUIZ_SETTING_CLASS, 1)
  ChooseFromSelect2DropdownByIndex(FEEDBACK_ID, QUIZ_SETTING_CLASS, 0)
  ChooseFromSelect2DropdownByIndex(MARKER_ID, QUIZ_SETTING_CLASS, 1)
  ClickQuizSaveButton()
end


def CheckAbilityToModifyQuizSettings(setting_ability)
  VerifyElementAbilityByCSS(PASS_MARK_CSS, setting_ability)
  VerifySelect2Ability(COMPLETION_TERMINOLOGY_CSS, setting_ability)
  VerifySelect2Ability(SHOW_FEEDBACK_CSS, setting_ability)
  VerifySelect2Ability(MARKER_CSS, setting_ability)
  VerifyElementAbilityByCSS(COMPLETION_NOTIFICATION_CSS, setting_ability)
end


def ConfirmChanges(f2f_session_save_changes_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(f2f_session_save_changes_id))
end


def EditSessionDetails()
  #get the face to face session id from the url
  f2f_id = $driver.current_url.split('/')[6]

  Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 1))

  AddSessionTimings()

  #Enter min capacity
  Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_MIN_CAPACITY_INPUT_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_MIN_CAPACITY_INPUT_ID, F2F_SESSION_MIN_CAPACITY_EDIT_VALUE))

  # enter max capacity
  Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_MAX_CAPACITY_INPUT_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_MAX_CAPACITY_INPUT_ID, F2F_SESSION_MAX_CAPACITY_EDIT_VALUE))

  #check for location and facilitator settings for the course
  course_f2f_settings = $daos.get_f2f_location_facilitator_settings(f2f_id)

  if course_f2f_settings[:location].to_s == 'true'
    Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_LOCATION_INPUT_ID))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_LOCATION_INPUT_ID, F2F_SESSION_LOCATION_EDIT_VALUE))
  else
    puts COLOR_BLUE + "Location is disabled for the Face to Face Activity"
  end
  if course_f2f_settings[:facilitator].to_s == 'true'
    Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_FACILITATOR_INPUT_ID))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_FACILITATOR_INPUT_ID, F2F_SESSION_FACILITATOR_EDIT_VALUE))
  else
    puts COLOR_BLUE + "Facilitator is disabled for the Face to Face Activity"
  end

  # select availability
  SelectFromDropdown(F2F_SESSION_AVAILABILITY_INPUT_ID, F2F_SESSION_AVAILABILITY_EDIT_VALUE)
end

def EditF2FNotificationTitleDescription
  WaitForAnElementByIdAndInputValue(F2F_SESSION_NOTIFICATION_TITLE_ID, "Edit Notification")
  WaitForAnElementByIdAndInputValue(F2F_SESSION_NOTIFICATION_DESCRIPTION_ID, "Edit Notification")
end


def VerifyF2FNotificationTitleDescription()
  WaitForAnElementByCSSAndTouch(NOTIFICATION_ID)
  VerifyAnElementExistByXPath(NOTIFICATION_PREVIEW_TITLE_XPATH, 'Edit Notification')
  VerifyAnElementExistByXPath(NOTIFICATION_PREVIEW_DESCRIPTION_XPATH, 'Edit Notification')
end


def CheckRetrainSetting()
  $retrain_setting = $driver.find_elements(:xpath, RETRAIN_TOGGLE_ID)[0].attribute("value")
end


def ModifyRetrainSetting(retrain_action)
  if retrain_action == "Disable"
    if $retrain_setting == "0"
      puts COLOR_BLUE + "Retrain setting is currently Disabled"
      $retrain_setting = 0
    else
      $driver.find_elements(:xpath, RETRAIN_DISABLE_TOGGLE_ID)[0].click
      puts COLOR_BLUE + "Retrain setting has been Disabled"
      sleep (1)
    end
  else
    if $retrain_setting == "1"
      puts COLOR_BLUE + "Retrain setting is currently Enabled"
      $retrain_setting = 0
    else
      $driver.find_elements(:xpath, RETRAIN_ENABLE_TOGGLE_ID)[0].click
      puts COLOR_BLUE + "Retrain setting has been Enabled"
      sleep (1)
    end
  end
end


def CheckEnrolmentTooltip(date_value)
  #checks that the tooltip for first enrolment has the enrolment completion date as today
  $driver.find_elements(:xpath, ENROLMENT_TOOLTIP_ID).last.attribute("data-original-title").include? date_value
end


def EnterScore(score_value)
  WaitForAnElementByIdAndInputValue(COURSE_SCORE_ID, score_value)
end


def CheckEnrolmentDueDate(ability_value)
  if ability_value == "disabled"
    #Checks if enrolment due date checkbox is unchecked and if unchecked then its disabled
    $driver.find_element(:id, ENROLMENT_DUE_DATE_ID).attribute("checked") == nil
    $driver.find_element(:id, ENROLMENT_DUE_DATE_ID).attribute("disabled") == "true"
  elsif ability_value == "enabled"
    $driver.find_element(:id, ENROLMENT_DUE_DATE_ID).attribute("checked") == "true"
  end
end


def FilterEnrolments(filter_by, filter_value)
  if filter_by == "Enrolment Method"
    Sleep_Until(SelectFromDropdown(ENROLMENT_METHOD_FILTER_ID, "#{filter_value}"))
    #TODO Query needs to be corrected
    # case filter_value
    #   when "Manual"
    #     filter_value = 0
    #   when "Self"
    #     filter_value = 1
    #   when "Rule"
    #     filter_value = 2
    #   when "Development Activity"
    #     filter_value = 3
    # end
    # count = $daos.get_count_course_enrolments_by_enrolmethod(filter_value)
    # results_count = $driver.find_element(:xpath, PAGINATION_ID).text.split(" ")[4].to_i
    # if results_count.eql?count then puts COLOR_BLUE + "Results match" end
  elsif filter_by == "Status"
    Sleep_Until(SelectFromDropdown(ENROLMENT_STATUS_FILTER_ID, "#{filter_value}"))
    #TODO Query needs to be corrected
    # case filter_value
    #   when "Not Yet Started"
    #     filter_value = 0
    #   when "In Progress"
    #     filter_value = 1
    #   when "Completed"
    #     filter_value = 2
    #   when "Exempted"
    #     filter_value = 3
    #   when "Recompletion Required"
    #     filter_value = 4
    # end
    # count = $daos.get_count_course_enrolments_by_status(filter_value)
    # sleep (2)
    # results_count = $driver.find_element(:xpath, PAGINATION_ID).text.split(" ")[4].to_i
    # if results_count.eql?count then puts COLOR_BLUE + "Results match" end
  end
end

def CreateACourseThroughServices(creator_username, creator_password, enrolled_user_id)
  if ENV['url'] == nil
    ENV['url'] = 'tmsfull'
  else
    puts "server provided = " + ENV["url"]
  end
  puts @create_against =  "#{ENV['url']}.elmodev.com"
  puts "Data Creation in process...".colorize(:light_yellow)
  if ENV['MYMAC']
    %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Learning/LearningCourseAdd.jmx -Jserver=#{@create_against} -Jusername=#{creator_username} -Jpassword=#{creator_password} -Jenrolled_user_id=#{enrolled_user_id})
  else
    %x(/var/lib/apache-jmeter/bin/./jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Learning/LearningCourseAdd.jmx -Jserver=#{@create_against} -Jusername=#{creator_username} -Jpassword=#{creator_password} -Jenrolled_user_id=#{enrolled_user_id})
  end
  csv = CSV.read('JMETER_AUTO/Jmeter_tests/Learning/learning_course_add.csv', :headers=>false)
  puts "course_name:" + csv[0][0]
  puts "course_id:" + csv[0][1]
  $randomly_created_course = csv[0][0]
  $random_course_id = csv[0][1]
end


def CreateACourseWithActivityThroughServices(creator_username, creator_password, enrolled_user_id, activity_name)
  if ENV['url'] == nil
    ENV['url'] = 'tmsfull'
  else
    puts "server provided = " + ENV["url"]
  end
  puts @create_against =  "#{ENV['url']}.elmodev.com"
  puts "Data Creation in process...".colorize(:light_yellow)
  if ENV['MYMAC']
    %x(jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Learning/LearningCourseActivityAdd.jmx -Jserver=#{@create_against} -Jusername=#{creator_username} -Jpassword=#{creator_password} -Jenrolled_user_id=#{enrolled_user_id} -Jactivity_name=#{activity_name})
  else
    %x(/var/lib/apache-jmeter/bin/./jmeter -n -t ./JMETER_AUTO/Jmeter_tests/Learning/LearningCourseActivityAdd.jmx -Jserver=#{@create_against} -Jusername=#{creator_username} -Jpassword=#{creator_password} -Jenrolled_user_id=#{enrolled_user_id} -Jactivity_name=#{activity_name})
  end
  csv = CSV.read('JMETER_AUTO/Jmeter_tests/Learning/learning_course_add.csv', :headers=>false)
  puts "course_name:" + csv[0][0]
  puts "course_id:" + csv[0][1]
  $randomly_created_course = csv[0][0]
  $random_course_id = csv[0][1]
end

def ManualSignupFaceToFaceSession(name, index)
  WaitForAnElementByPartialLinkTextAndTouch("Manual Sign Up")
  SelectIndexFromSelect2SearchResult(name, 0)
  Sleep_Until(WaitForAnElementByIdAndTouch(SIGN_UP_SELECTED_USERS_ID))
  PressConfirm()
end


def SelectIndexFromSelect2SearchResult(search_value, index)
  # Sleep_Until($driver.find_element(:id, "s2id_autogen1"))
  Sleep_Until($driver.find_element(:id, "s2id_autogen1").send_keys(search_value))
  VerifyAnElementExistById('select2-results-1', search_value)
  $driver.find_elements(:class, "select2-result")[index].click
end


def MarkFaceToFaceSessionAttendance(attendance, grade, toggle_yes_no)
  WaitForToggleDropDownItemAndTouch(ACTION_TOGGLE_XPATH, MARK_ATTENDANCE_BUTTON_XPATH)
  SelectFromDropdown(ATTENDANCE_DROPDOWN_XPATH, attendance)
  WaitForAnElementByXpathAndClearValue(GRADE_FIELD_XPATH)
  WaitForAnElementByXpathAndInputValue(GRADE_FIELD_XPATH, grade)
  ToggleTo(toggle_yes_no)
  Sleep_Until(WaitForAnElementByIdAndTouch(MARK_ATTENDANCE_CONFIRM_BUTTON_ID))
  VerifyTableByRowColumnCSS(1, (attendance.gsub(' ', '_').upcase+'_COLUMN_VALUE').constantize)
end


def MarkFaceToFaceSessionAttendanceNoShow(no_show, grade)
  WaitForToggleDropDownItemAndTouch(ACTION_TOGGLE_XPATH, MARK_ATTENDANCE_BUTTON_XPATH)
  SelectFromDropdown(ATTENDANCE_DROPDOWN_XPATH, no_show)
  WaitForAnElementByXpathAndClearValue(GRADE_FIELD_XPATH)
  WaitForAnElementByXpathAndInputValue(GRADE_FIELD_XPATH, grade)
  VerifyElementDisableCSS(TOGGLE_BUTTON_CSS)
  Sleep_Until(WaitForAnElementByIdAndTouch(MARK_ATTENDANCE_CONFIRM_BUTTON_ID))
  VerifyTableByRowColumnCSS(1, NO_SHOW_COLUMN_VALUE)
end


def ToggleTo(yes_no)
  if yes_no.downcase.eql?('yes')
    unless CheckboxCheckedCSS?(MARK_COMPLETE_CHECKBOX_CSS)
      WaitForAnElementByCSSAndTouch(TOGGLE_BUTTON_CSS)
    end
  elsif yes_no.downcase.eql?('no')
    if CheckboxCheckedCSS?(MARK_COMPLETE_CHECKBOX_CSS)
      WaitForAnElementByCSSAndTouch(TOGGLE_BUTTON_CSS)
    end
  end
end


def BulkMarkFaceToFaceSessionAttendance(attendance, grade, toggle_yes_no)
  SelectUsersPage(5)
  WaitForToggleDropDownItemAndTouch(BULK_ACTIONS_TOGGLE_XPATH, BULK_MARK_ATTENDANCE_BUTTON_XPATH)
  SelectFromDropdown(ATTENDANCE_DROPDOWN_XPATH, attendance)
  WaitForAnElementByXpathAndClearValue(GRADE_FIELD_XPATH)
  WaitForAnElementByXpathAndInputValue(GRADE_FIELD_XPATH, grade)
  ToggleTo(toggle_yes_no)
  Sleep_Until(WaitForAnElementByIdAndTouch(MARK_ATTENDANCE_CONFIRM_BUTTON_ID))
  # Wait for bulk mark attenace which triggered AJAX
  sleep(5)
  VerifyTableByRowColumnCSS(1, (attendance.gsub(' ', '_').upcase+'_COLUMN_VALUE').constantize)
end


def GetNumberFromPagination
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  pag_text = wait.until {pag_text = $driver.find_element(:css, PAGINATION_CSS).text}
  pattern = /^.* of (\d+) .*$/
  pag_text[pattern, 1]
end


def SelectUsersPage(amount)
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  check_boxes = wait.until {$driver.find_elements(:css, '.add-user')}
  for i in 1..amount do
    element_index = i - 1
    check_boxes[element_index].click
  end
end