
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

def findIdOfDocumentInstance()
  sleep(1)
  path_url = $driver.current_url
  path_id = path_url.split('/')[-2]
  $document_path_id = "/#{path_id}"
  puts "Document Path ID: #{$document_path_id}"
  sleep(1)
end

def search_a_course(course_list_search_box_id, course_list_title_value, course_search_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndInputValue(course_list_search_box_id, course_list_title_value))
  Sleep_Until(WaitForAnElementByXpathAndTouch(course_search_btn_id))
end

def edit_the_first_course_from_table(class_name, index_value, partial_link_text)
  Sleep_Until(WaitForDropdownByClassAndTouchTheIndex(class_name, index_value))
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(partial_link_text))
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
          create_an_activity(select_activity_name)
        end

      when "ELMO Module"
        begin
          $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click
          $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[1].click
          $driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click
          create_an_activity(select_activity_name)
        end

      when "ELMO Survey"
        begin
          $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[2].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
          create_an_activity(select_activity_name)
        end

      when "Face-to-Face"
        begin
          $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[4].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
          create_an_activity(select_activity_name)
        end

      when "Quiz"
        begin
          $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[5].click)
          $driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click
          create_an_activity(select_activity_name)
        end

      when "File"
        begin
          $driver.find_elements(:class, COURSE_SECTION_DROPDOWN_ID).last.click
          Sleep_Until($driver.find_elements(:class, COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID)[7].click)
          Sleep_Until($driver.find_elements(:name, COURSE_ADD_ACTIVITY_BTN_ID).last.click)
          create_an_activity(select_activity_name)
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
        end

      when "Page"
        begin
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
  sleep (1)
end


# def goToNewDocumentCategoryPage(document_category_btn)
#   WaitForAnElementByXpathAndTouch(document_category_btn)
# end
#
# def enterDocumentCategoryDetails(document_cat_title_id, document_cat_title_txt)
#   WaitForAnElementByXpathAndInputValue(document_cat_title_id, document_cat_title_txt)
#   sleep(1)
# end
#
# def createADocumentCategory(form_temp_save)
#   WaitForAnElementByXpathAndTouch(form_temp_save)
#   sleep(1)
# end
#
# def hideTheFirstDocumentCategoryFromTheTable(class_name, index_value, partial_link_text)
#   WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
#   sleep(1)
#   WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
#   sleep (1)
#   PressEnterConfirm()
#   sleep(1)
# end
#
# def searchForAFileAndVerify(search_box_id, form_temp_search_txt, search_btn_id, search_result)
#   WaitForAnElementByXpathAndInputValue(search_box_id, form_temp_search_txt)
#   WaitForAnElementByXpathAndTouch(search_btn_id)
#   sleep (1)
#   VerifyAnElementExistByXPath(search_result, form_temp_search_txt)
# end
#
# def deleteTheFirstFileFromTheTable(class_name, index_value, partial_link_text)
#   WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
#   sleep(1)
#   WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
#   sleep (1)
#   PressEnterConfirm()
#   sleep(1)
# end
#
# def ValidateDocumentSectionisPresentUnderAdmin(document_path,doc_text,forms_path,form_text)
#   VerifyAnElementExistByXPath(document_path,doc_text)
#   WaitForAnElementByXpathAndTouch(document_path)
#   sleep(1)
#   VerifyAnElementExistByXPath(forms_path,form_text)
# end
# def GoToReportsTab()
#   sleep(1)
#   $driver.find_elements(:xpath, "//a[contains(.,'Reports')]")[1].click
#   sleep(2)
#   $driver.find_element(:xpath, "//a[@href='/report/view/30']").click
#   sleep(3)
#   new_win_id = $driver.window_handles[1]
#   $driver.switch_to.window("#{new_win_id}")
#   $driver.find_element(:class, 'select2-input').send_keys("shan-automation-secPP", :return)
#   sleep(5)
#   $driver.find_element(:class, 'select2-input').send_keys( :return)
# end
#
# def VerifyThePendingFormTemplates()
#   sleep(2)
#   $driver.find_element(:class, 'document-approval-status-2').displayed? == true
# end
# def RevokeDocumentViewAccessByUsingJmeterRubyService()
#   sleep(1)
#   test_site = 'https://tmsfull.dev.elmodev.com'
#   test do
#     cookies policy: 'compatibility', clear_each_iteration: true
#     threads count: 1,loops: 1 do
#       visit name: 'landing page', url: "#{test_site}"
#       visit name: 'login', url: "#{test_site}/login_check",
#             method: 'POST',fill_in: {
#               _username: 'admin',
#               _password: 'admin1234567'
#
#           }
#       visit name: 'visit admin page', url: "#{test_site}/admin/users"
#       visit name: 'Goto edit a role type', url: "#{test_site}/admin/roletype-edit/45" do
#         extract regex: 'class="form-control" value="(.+?)" >', name: 'role-type-token' , match_number: 2
#       end
#       visit name: 'Save edited role type', url: "#{test_site}/admin/roletype-edit/45",
#             method: 'POST',fill_in: {
#               'roleType[title]' => 'shanku-automation-role-type',
#               'roleType[description]' => 'abcd',
#               'roleType[capabilities][admin][273]'=>'273',
#               'roleType[capabilities][admin][274]'=>'274',
#               'roleType[capabilities][admin][34]'=>'34',
#               'roleType[capabilities][admin][143]'=>'143',
#               'roleType[capabilities][admin][144]'=>'144',
#               'roleType[capabilities][admin][145]'=>'145',
#               'roleType[capabilities][admin][146]'=>'146',
#               'roleType[capabilities][admin][147]'=>'147',
#               'roleType[capabilities][admin][148]'=>'148',
#               'roleType[capabilities][admin][149]'=>'149',
#               'roleType[capabilities][admin][150]'=>'150',
#               'roleType[capabilities][admin][151]'=>'151',
#               'roleType[save]'=> '',
#               'roleType[_token]'=> '${role-type-token}'
#
#           }
#       view_results_tree
#     end
#   end.run(
#       path: './JMETER_AUTO/apache-jmeter-3.0/bin/',
#       file: './JMETER_AUTO/Jmeter_tests/ChangeRoleType.jmx',
#       properties: './JMETER_AUTO/apache-jmeter-3.0/bin/jmeter.properties')
#   sleep(3)
# end
#
# def CheckReportsTabisUnavailable()
#   sleep(3)
#   begin
#     sleep(1)
#     #binding.pry
#     expected_tab_present = $driver.find_elements(:xpath, "//a[contains(.,'Reports')]")[1].present?
#     if expected_tab_present == false
#       puts "Working : Reports tab disappeared"
#     else
#       raise VerificationException.new("ERROR: Reports tab is still present")
#     end
#   rescue Exception => e
#     puts e.message
#     $driver.quit
#   end
# end
#
# def GrantBackDocumentViewAccessByUsingJmeterRubyService()
#   sleep(1)
#   test_site = 'https://tmsfull.dev.elmodev.com'
#   test do
#     cookies policy: 'compatibility', clear_each_iteration: true
#     threads count: 1,loops: 1 do
#       visit name: 'landing page', url: "#{test_site}"
#       visit name: 'login', url: "#{test_site}/login_check",
#             method: 'POST',fill_in: {
#               _username: 'admin',
#               _password: 'admin1234567'
#
#           }
#       visit name: 'visit admin page', url: "#{test_site}/admin/users"
#       visit name: 'Goto edit a role type', url: "#{test_site}/admin/roletype-edit/45" do
#         extract regex: 'class="form-control" value="(.+?)" >', name: 'role-type-token' , match_number: 2
#       end
#       visit name: 'Save edited role type', url: "#{test_site}/admin/roletype-edit/45",
#             method: 'POST',fill_in: {
#               'roleType[title]' => 'shanku-automation-role-type',
#               'roleType[description]' => 'abcd',
#               'roleType[capabilities][admin][273]'=>'273',
#               'roleType[capabilities][admin][274]'=>'274',
#               'roleType[capabilities][admin][34]'=>'34',
#               'roleType[capabilities][admin][143]'=>'143',
#               'roleType[capabilities][admin][144]'=>'144',
#               'roleType[capabilities][admin][145]'=>'145',
#               'roleType[capabilities][admin][146]'=>'146',
#               'roleType[capabilities][admin][147]'=>'147',
#               'roleType[capabilities][admin][148]'=>'148',
#               'roleType[capabilities][admin][149]'=>'149',
#               'roleType[capabilities][admin][150]'=>'150',
#               'roleType[capabilities][admin][151]'=>'151',
#               'roleType[capabilities][report][223]'=>'223',
#               'roleType[save]'=> '',
#               'roleType[_token]'=> '${role-type-token}'
#
#           }
#       view_results_tree
#     end
#   end.run(
#       path: './JMETER_AUTO/apache-jmeter-3.0/bin/',
#       file: './JMETER_AUTO/Jmeter_tests/ChangeRoleType.jmx',
#       properties: './JMETER_AUTO/apache-jmeter-3.0/bin/jmeter.properties')
# end