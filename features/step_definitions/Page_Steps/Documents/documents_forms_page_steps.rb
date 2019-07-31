def goToDocumentsSection(documents_expand)
  WaitForAnElementByXpathAndTouch(documents_expand)
end

def GoToItemLandingPage(documents_list_path)
  WaitForAnElementByXpathAndTouch(documents_list_path)
  sleep(2)
end

def goToNewFormTemplateAddPage(form_temp_btn)
  WaitForAnElementByXpathAndTouch(form_temp_btn)
end

def enterFormTemplateDetails(form_temp_title, form_temp_title_text)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
end

def EnterDescription(form_temp_desc_txt, index_id)
  UseCkeditorToEnterText(form_temp_desc_txt, index_id)
end

def FindIdOfDocumentInstance()
  sleep(1)
  path_url = $driver.current_url
  path_id = path_url.split('/')[-2]
  $document_path_id = "/#{path_id}"
  puts "Document Path ID: #{$document_path_id}"
  sleep(1)
end

# This method finds the ID of the Form created
def FindIdOfFormInstance()
  sleep(1)
  path_url = $driver.current_url
  path_id_initial = path_url.split('/').last
  path_id = path_id_initial.split('#')[0]
  $document_path_id = "/#{path_id}"
  puts "Document Path ID: #{$document_path_id}"
  sleep(1)
end

def searchforAForFormTemplate(search_box_id, form_temp_search_txt, search_btn_id)
  WaitForAnElementByXpathAndInputValue(search_box_id, form_temp_search_txt)
  WaitForAnElementByXpathAndTouch(search_btn_id)
  sleep(2)
end

def hideTheFirstFormTemplatePlanFromTheTable(class_name, index_value, partial_link_text)
  WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
  sleep (1)
  PressEnterConfirm()
  sleep(1)
end

def goToNewDocumentCategoryPage(document_category_btn)
  WaitForAnElementByXpathAndTouch(document_category_btn)
end

def enterDocumentCategoryDetails(document_cat_title_id, document_cat_title_txt)
  WaitForAnElementByXpathAndInputValue(document_cat_title_id, document_cat_title_txt)
  sleep(1)
end

def createADocumentCategory(form_temp_save)
  WaitForAnElementByXpathAndTouch(form_temp_save)
  sleep(1)
end

def hideTheFirstDocumentCategoryFromTheTable(class_name, index_value, partial_link_text)
  WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
  sleep (1)
  PressEnterConfirm()
  sleep(1)
end

def searchForAFileAndVerify(search_box_id, form_temp_search_txt, search_btn_id, search_result)
  WaitForAnElementByXpathAndInputValue(search_box_id, form_temp_search_txt)
  WaitForAnElementByXpathAndTouch(search_btn_id)
  sleep (1)
  VerifyAnElementExistByXPath(search_result, form_temp_search_txt)
end

def deleteTheFirstFileFromTheTable(class_name, index_value, partial_link_text)
  WaitForDropdownByClassAndTouchTheIndex(class_name, index_value)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
  sleep (1)
  PressEnterConfirm()
  sleep(1)
end

def ValidateDocumentSectionisPresentUnderAdmin(document_path, doc_text, forms_path, form_text)
  VerifyAnElementExistByXPath(document_path, doc_text)
  WaitForAnElementByXpathAndTouch(document_path)
  sleep(1)
  VerifyAnElementExistByXPath(forms_path, form_text)
end

def GoToReportsTab()
  sleep(1)
  $driver.find_elements(:xpath, "//a[contains(.,'Reports')]")[1].click
  sleep(2)
  $driver.find_element(:xpath, "//a[@href='/report/view/30']").click
  sleep(3)
  new_win_id = $driver.window_handles[1]
  $driver.switch_to.window("#{new_win_id}")
  $driver.find_element(:class, 'select2-input').send_keys("shan-automation-secPP", :return)
  sleep(5)
  $driver.find_element(:class, 'select2-input').send_keys(:return)
end

def VerifyThePendingFormTemplates()
  sleep(2)
  $driver.find_element(:class, 'document-approval-status-2').displayed? == true
end

def RevokeDocumentViewAccessByUsingJmeterRubyService()
  sleep(1)
  test_site = 'https://tmsfull.dev.elmodev.com'
  test do
    cookies policy: 'compatibility', clear_each_iteration: true
    threads count: 1, loops: 1 do
      visit name: 'landing page', url: "#{test_site}"
      visit name: 'login', url: "#{test_site}/login_check",
            method: 'POST', fill_in: {
              _username: 'admin',
              _password: 'admin1234567'

          }
      visit name: 'visit admin page', url: "#{test_site}/admin/users"
      visit name: 'Goto edit a role type', url: "#{test_site}/admin/roletype-edit/45" do
        extract regex: 'class="form-control" value="(.+?)" >', name: 'role-type-token', match_number: 2
      end
      visit name: 'Save edited role type', url: "#{test_site}/admin/roletype-edit/45",
            method: 'POST', fill_in: {
              'roleType[title]' => 'shanku-automation-role-type',
              'roleType[description]' => 'abcd',
              'roleType[capabilities][admin][273]' => '273',
              'roleType[capabilities][admin][274]' => '274',
              'roleType[capabilities][admin][34]' => '34',
              'roleType[capabilities][admin][143]' => '143',
              'roleType[capabilities][admin][144]' => '144',
              'roleType[capabilities][admin][145]' => '145',
              'roleType[capabilities][admin][146]' => '146',
              'roleType[capabilities][admin][147]' => '147',
              'roleType[capabilities][admin][148]' => '148',
              'roleType[capabilities][admin][149]' => '149',
              'roleType[capabilities][admin][150]' => '150',
              'roleType[capabilities][admin][151]' => '151',
              'roleType[save]' => '',
              'roleType[_token]' => '${role-type-token}'

          }
      view_results_tree
    end
  end.run(
      path: './JMETER_AUTO/apache-jmeter-3.0/bin/',
      file: './JMETER_AUTO/Jmeter_tests/ChangeRoleType.jmx',
      properties: './JMETER_AUTO/apache-jmeter-3.0/bin/jmeter.properties')
  sleep(3)
end

def CheckReportsTabisUnavailable()
  sleep(3)
  begin
    sleep(1)
    #binding.pry
    expected_tab_present = $driver.find_elements(:xpath, "//a[contains(.,'Reports')]")[1].present?
    if expected_tab_present == false
      puts "Working : Reports tab disappeared"
    else
      raise VerificationException.new("ERROR: Reports tab is still present")
    end
  rescue Exception => e
    puts e.message
    $driver.quit
  end
end

def GrantBackDocumentViewAccessByUsingJmeterRubyService()
  sleep(1)
  test_site = 'https://tmsfull.dev.elmodev.com'
  test do
    cookies policy: 'compatibility', clear_each_iteration: true
    threads count: 1, loops: 1 do
      visit name: 'landing page', url: "#{test_site}"
      visit name: 'login', url: "#{test_site}/login_check",
            method: 'POST', fill_in: {
              _username: 'admin',
              _password: 'admin1234567'

          }
      visit name: 'visit admin page', url: "#{test_site}/admin/users"
      visit name: 'Goto edit a role type', url: "#{test_site}/admin/roletype-edit/45" do
        extract regex: 'class="form-control" value="(.+?)" >', name: 'role-type-token', match_number: 2
      end
      visit name: 'Save edited role type', url: "#{test_site}/admin/roletype-edit/45",
            method: 'POST', fill_in: {
              'roleType[title]' => 'shanku-automation-role-type',
              'roleType[description]' => 'abcd',
              'roleType[capabilities][admin][273]' => '273',
              'roleType[capabilities][admin][274]' => '274',
              'roleType[capabilities][admin][34]' => '34',
              'roleType[capabilities][admin][143]' => '143',
              'roleType[capabilities][admin][144]' => '144',
              'roleType[capabilities][admin][145]' => '145',
              'roleType[capabilities][admin][146]' => '146',
              'roleType[capabilities][admin][147]' => '147',
              'roleType[capabilities][admin][148]' => '148',
              'roleType[capabilities][admin][149]' => '149',
              'roleType[capabilities][admin][150]' => '150',
              'roleType[capabilities][admin][151]' => '151',
              'roleType[capabilities][report][223]' => '223',
              'roleType[save]' => '',
              'roleType[_token]' => '${role-type-token}'

          }
      view_results_tree
    end
  end.run(
      path: './JMETER_AUTO/apache-jmeter-3.0/bin/',
      file: './JMETER_AUTO/Jmeter_tests/ChangeRoleType.jmx',
      properties: './JMETER_AUTO/apache-jmeter-3.0/bin/jmeter.properties')
end

def EnterFormDetails(form_title, form_title_text)
  WaitForAnElementByXpathAndInputValue(form_title, form_title_text)
end