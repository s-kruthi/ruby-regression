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
  SelectFromDropDown(COURSE_AVAILABILITY_ID, 'Available to all users')
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


def EnterCourseRetrain(course_retrain_input_id, course_retrain_input_value)
  SelectFromDropDown(course_retrain_input_id, course_retrain_input_value)
end


def EnterCourseRetrainOpen(course_retrain_open_input_id, course_retrain_open_input_value)
  SelectFromDropDown(course_retrain_open_input_id, course_retrain_open_input_value)
end


def EnterCourseComplete(course_complete_input_id, course_complete_input_value)
  SelectFromDropDown(course_complete_input_id, course_complete_input_value)
end


def EnterCourseAvailability(course_availability_input_id, course_availability_input_value)
  SelectFromDropDown(course_availability_input_id, course_availability_input_value)
end


def EnterCourseCertificateTemplate(course_certificate_template_id, course_certificate_template_value)
  SelectFromDropDown(course_certificate_template_id, course_certificate_template_value)
end


def EnterCourseSelfEnrol(course_self_enroll_input_id, course_self_enroll_input_value)
  SelectFromDropDown(course_self_enroll_input_id, course_self_enroll_input_value)
end


def EnterCourseSectionDescription(course_show_sec_desc_input_id, course_show_sec_desc_input_value)
  SelectFromDropDown(course_show_sec_desc_input_id, course_show_sec_desc_input_value)
end


def ClickOnAButtonByXPath(form_template_save_btn)
  Sleep_Until(WaitForAnElementByXpathAndTouch(form_template_save_btn))
end


def SearchACourse(course_list_search_box_id, course_list_title_value, course_search_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(course_list_search_box_id, course_list_title_value))
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_search_btn_id))
end


def EditFirstCourseFromTable(xpath_name, partial_link_text)
  Sleep_Until($driver.find_elements(:xpath, xpath_name).last.click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
  #get url and check if it has edit
  $driver.current_url =~ /\/course\/edit/
end


#This selects the last course from the list and deletes it
def DeleteTheCourseFromTable(xpath_name, partial_link_text)
  Sleep_Until($driver.find_elements(:xpath, xpath_name).last.click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
end


def ClickMenuOfFirstItemFromTable(xpath_name, partial_link_text)
  Sleep_Until($driver.find_elements(:xpath, xpath_name).last.click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
  PressEnterConfirm()
  sleep (2)
end


def CourseActionConfirm(course_action_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_action_id))
  sleep (3)
end


def AddANewSection(course_add_a_section_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_add_a_section_btn_id))
  #Adding sleep intentionally,if course has too many activities, it takes time to scroll down the page
  sleep (2)
end


def SelectAnActivity(select_activity_name)
  # Sleep_Until(WaitForAnElementByIdAndTouch(COURSE_SECTION_DROPDOWN_ID))
  # This is a quick hack to ensure the last dropdown is selected since that is the one which gets created from AddANewSection() method
  Sleep_Until($driver.find_elements(:id, COURSE_SECTION_DROPDOWN_ID).last.click)
  Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_SEARCH_ID).last.send_keys(select_activity_name))
  puts "Adding activity: " + $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID).last.text
  Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID).last.click)
end


def CreateAnActivity(course_activity_name)
  Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
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
        Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_QUESTION_BTN_ID))
        #Adding question
        Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 2))
        Sleep_Until(WaitForAnElementByXpathAndTouch(QUESTION_SAVE_BTN_ID))

        Sleep_Until(WaitForAnElementByXpathAndInputValue(QUIZ_PASS_MARK_ID, QUIZ_PASS_MARK_VALUE))
        # TODO: Pending review and removal as it’s now redundant
        # $driver.find_elements(:xpath, QUIZ_SAVE_BTN_ID).last.click
        $driver.find_elements(:xpath, SAVE_BTN_ID).last.click
        Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, QUIZ_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    when "SCORM Package"
      begin
        Sleep_Until(WaitForAnElementByXpathAndInputValue(SCORM_TITLE_ID, SCORM_TITLE_VALUE))
        Sleep_Until(UseCkeditorToEnterText(SCORM_ACTIVITY_EDITOR_TXT, 0))
        Sleep_Until(WaitForAnElementByIdAndTouch(SCORM_FILE_ID))
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
        Sleep_Until(SelectSingleFromSelect2InputDropdown(SURVEY2_CONTENT_DROPDOWN_INPUT_ID, SURVEY2_CONTENT_DROPDOWN_INPUT_CLASS, SURVEY2_CONTACT_DROPDOWN_INPUT_VALUE, SURVEY2_CONTACT_DROPDOWN_SEARCH_CLASS))
        ClickOnSaveButton(SAVE_BTN_ID)
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
      end

    end
  end
end


def EditACourseActivity(course_activity_name)
  pending
  # begin
  #
  #   case course_activity_name
  #   when "Acknowledgement"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, ACK_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(ACK_ACTIVITY_EDITOR_TXT, 0))
  #       Sleep_Until(UseCkeditorToEnterText(ACK_ACTIVITY_EDITOR_TXT, 1))
  #       AddFile()
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "ELMO Module"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, ELMO_MODULE_ACTIVITY_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(ELMO_MODULE_ACTIVITY_EDITOR_TXT, 0))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ELMO_MODULE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "ELMO Survey"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, SURVEY_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(SURVEY_ACTIVITY_EDITOR_TXT, 0))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SURVEY_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "Face-to-Face"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, F2F_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(F2F_ACTIVITY_EDITOR_TXT, 0))
  #       Sleep_Until(UseCkeditorToEnterText(F2F_ACTIVITY_EDITOR_TXT, 1))
  #       AddFile()
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "Quiz"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, QUIZ_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 0))
  #       Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 1))
  #       Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_QUESTION_BTN_ID))
  #       #Adding question
  #       Sleep_Until(UseCkeditorToEnterText(QUIZ_ACTIVITY_EDITOR_TXT, 2))
  #       Sleep_Until(WaitForAnElementByXpathAndTouch(QUESTION_SAVE_BTN_ID))
  #
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(QUIZ_PASS_MARK_ID, QUIZ_PASS_MARK_VALUE))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, QUIZ_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "SCORM Package"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(SCORM_TITLE_ID, SCORM_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(SCORM_ACTIVITY_EDITOR_TXT, 0))
  #       Sleep_Until(WaitForAnElementByIdAndTouch(SCORM_FILE_ID))
  #       Sleep_Until(WaitForSelectFileButtonAndUpload_File(SCORM_FILE_NAME))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(COURSE_VERIFY_SAVE_SUCCESSFUL_ID, ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #       sleep(2)
  #     end
  #
  #   when "File"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, FILE_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(FILE_ACTIVITY_EDITOR_TXT, 0))
  #       AddFile()
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, FILE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "Label"
  #     begin
  #       Sleep_Until(UseCkeditorToEnterText(LABEL_ACTIVITY_EDITOR_TXT, 0))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LABEL_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "Page"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, PAGE_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(PAGE_ACTIVITY_EDITOR_TXT, 0))
  #       Sleep_Until(UseCkeditorToEnterText(PAGE_ACTIVITY_EDITOR_TXT, 1))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, PAGE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "Post"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, POST_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 0))
  #       Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 1))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, POST_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   when "ELMO Survey (new)"
  #     begin
  #       Sleep_Until(WaitForAnElementByXpathAndInputValue(COURSE_ACTIVITY_TITLE_ID, SURVEY2_TITLE_VALUE))
  #       Sleep_Until(UseCkeditorToEnterText(SURVEY2_ACTIVITY_EDITOR_TXT, 0))
  #       Sleep_Until(SelectSingleFromSelect2InputDropdown(SURVEY2_CONTENT_DROPDOWN_INPUT_ID, SURVEY2_CONTENT_DROPDOWN_INPUT_CLASS, SURVEY2_CONTACT_DROPDOWN_INPUT_VALUE, SURVEY2_CONTACT_DROPDOWN_SEARCH_CLASS))
  #       ClickOnSaveButton(SAVE_BTN_ID)
  #       Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, COURSE_ACTIVITY_SAVE_SUCCESSFUL_VALUE))
  #     end
  #
  #   end
  # end
end


def ClickOnSaveButton(btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(btn_id))
  sleep (1)
end


def DeleteASection(section_name)
  Sleep_Until($driver.find_elements(:class, section_name).last.click)
  Sleep_Until(PressEnterConfirm())
  sleep(3)
end


def CreateAllNotifications()
  begin
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
  puts "Number of Notification Templates added: \"#{limit + 1}\"\n"
end


def ClickAddNotificationButton()
  Sleep_Until($driver.find_elements(:xpath, ADD_NOTIFICATION_BUTTON_ID).first.click)
end


def AddNotificationTemplate()
  begin
    Sleep_Until($driver.find_element(:id, "s2id_templateNotification_template").click)
    puts "Added Template: " + $driver.find_elements(:class, "select2-result-selectable").last.text
    Sleep_Until($driver.find_elements(:class, "select2-result-selectable").last.click)
    Sleep_Until($driver.find_elements(:xpath, "//button[contains(@id,'next')]").first.click)
    sleep(2)
    CheckForTriggerDate()
    Sleep_Until(SaveNotificationTemplate())
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


def ModifyACourseActivity(activity_edit_link_name, action_type)
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


def DeleteTheExistingCourseEnrolment(course_id)
  $driver.navigate.to("https://tmsfull.dev.elmodev.com/admin/course/#{course_id}/enrolments")
  Sleep_Until($driver.find_element(:css, 'a[data-user="Donttouchautomationuser Aaron"]'))
  $driver.find_element(:css, 'a[data-user="Donttouchautomationuser Aaron"]').click
  sleep(1)
  PressConfirm()
  sleep(3)
end
def ReEnrolTheCandidateForCourse()
  WaitForAnElementByPartialLinkTextAndTouch("Manual Enrol Users")
  Sleep_Until($driver.find_element(:id, "s2id_autogen1"))
  $driver.find_element(:id, "s2id_autogen1").send_keys "Donttouchautomationuser"
  begin
    wait_valid = $driver.find_element(:class, "select2-results-1").text.include? "Donttouchautomationuser"
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
  EditFirstCourseFromTable(COURSE_LIST_DROPDOWN, COURSE_LIST_ACTION_ITEM_EDIT)
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
      raise(COLOR_RED + "Item displayed. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
    end
  rescue Exception => e
    puts e.message
    $driver.quit
  end
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
      location_disabled = $driver.execute_script("return $(#{F2F_SESSION_CONFIG_LOCATION_ID}).is(':checked')")
      puts COLOR_BLUE + "Location is Disabled" if location_disabled == false
      puts COLOR_BLUE + "Location is Enabled" if location_disabled == true
      EditActivitySettings(label_name, location_disabled, label_value)
    end

  when "Facilitator"
    begin
      facilitator_disabled = $driver.execute_script("return $(#{F2F_SESSION_CONFIG_FACILITATOR_ID}).is(':checked')")
      puts COLOR_BLUE + "Facilitator is currently Disabled" if facilitator_disabled == false
      puts COLOR_BLUE + "Facilitator is currently Enabled" if facilitator_disabled == true
      EditActivitySettings(label_name, facilitator_disabled, label_value)
    end

  when "Compulsory"
    begin
      compulsory_disabled = $driver.execute_script("return $(#{SURVEY_CONFIG_COMPULSORY_ID}).is(':checked')")
      byebug
      puts COLOR_BLUE + "Compulsory setting is currently Disabled" if compulsory_disabled == false
      puts COLOR_BLUE + "Compulsory setting is currently Enabled" if compulsory_disabled == true
      EditActivitySettings(label_name, compulsory_disabled, label_value)
    end
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


def AddSessionDetails()
  #get the face to face session id from the url
  f2f_id = $driver.current_url.split('/')[6]

  Sleep_Until(UseCkeditorToEnterText(POST_ACTIVITY_EDITOR_TXT, 1))

  AddSessionTimings()

  #Enter min capacity
  Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_MIN_CAPACITY_INPUT_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_MIN_CAPACITY_INPUT_ID, F2F_SESSION_MIN_CAPACITY_INPUT_VALUE))

  # enter max capacity
  Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_MAX_CAPACITY_INPUT_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_MAX_CAPACITY_INPUT_ID, F2F_SESSION_MAX_CAPACITY_INPUT_VALUE))

  #check for location and facilitator settings for the course
  course_f2f_settings = $daos.get_f2f_location_facilitator_settings(f2f_id)
  if course_f2f_settings[0][0].to_s == 'true'
    Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_LOCATION_INPUT_ID))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_LOCATION_INPUT_ID, F2F_SESSION_LOCATION_INPUT_VALUE))
  else
    puts COLOR_BLUE + "Location is disabled for the Face to Face Activity"
  end
  if course_f2f_settings[0][1].to_s == 'true'
    Sleep_Until(WaitForAnElementByXpathAndClearValue(F2F_SESSION_FACILITATOR_INPUT_ID))
    Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_FACILITATOR_INPUT_ID, F2F_SESSION_FACILITATOR_INPUT_VALUE))
  else
    puts COLOR_BLUE + "Facilitator is disabled for the Face to Face Activity"
  end

  # select availability
  SelectFromDropDown(F2F_SESSION_AVAILABILITY_INPUT_ID, F2F_SESSION_AVAILABILITY_INPUT_VALUE)
end


def AddFile()
  Sleep_Until(WaitForAnElementByXpathAndTouch(ADD_FILE_ID))
  Sleep_Until(select_a_file(BROWSE_FILE_ID, FILE_NAME))
end


def AddSessionTimings()
  Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_ADD_PART_CLASS_ID))
  #get time n date
  time = DateTime.now
  #start time is 7 days from now
  start_time = (time + 7)
  #finishing after 1hr
  end_time = start_time + (1 / 24.0)
  Sleep_Until($driver.find_elements(:xpath, F2F_SESSION_START_TIME).last.send_keys(start_time.strftime('%d/%m/%Y %H:%M')))
  Sleep_Until($driver.find_elements(:xpath, F2F_SESSION_FINISH_TIME).last.send_keys(end_time.strftime('%d/%m/%Y %H:%M')))
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
  SelectFromDropDown(F2F_SESSION_AVAILABILITY_INPUT_ID, F2F_SESSION_AVAILABILITY_EDIT_VALUE)
end