# def GoToRecruitmentSetupPageAsAdmin(recruitment_tab,positions_link)
#   sleep(1)
#   WaitForAnElementByPartialLinkTextAndTouch(recruitment_tab)
# end
#
# class SortingException < Exception;
#
# end

def GoToRecruitmentRequisitionAddPage(new_requisition_btn)
  sleep(1)
  WaitForAnElementByXpathAndTouch(new_requisition_btn)
end


def EnterNewRecruitmentRequisitionDetails(pos_index_arrow,pos_index_arrow_id,pos_index_class,pos_index_class_id,loc_index_arrow,loc_index_arrow_id,loc_index_class,loc_index_class_id,num_of_position,num_position_input,calender_duedate,requisition_duedate,calender_done_btn)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(pos_index_arrow,pos_index_arrow_id)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(pos_index_class,pos_index_class_id)
  sleep(3)

  WaitForDropdownByClassAndTouchTheIndex(loc_index_arrow,loc_index_arrow_id)
  sleep(3)
  WaitForDropdownByClassAndTouchTheIndex(loc_index_class,loc_index_class_id)
  sleep(1)
  WaitForAnElementByXpathAndInputValue(num_of_position,num_position_input)
  sleep(1)

  WaitForAnElementByXpathAndInputValue(calender_duedate,requisition_duedate)
  sleep(1)
  WaitForAnElementByXpathAndTouch(calender_done_btn)
  sleep(1)
end


def CreateANewRecruitmentRequisition(save_btn)
  WaitForAnElementByXpathAndTouch(save_btn)
  sleep(3)
end


def GoToNewJobPostTabUnderARequisition(my_requisition,job_ad_link,new_job_post_link)
  WaitForAnElementByLinkTextAndTouch(my_requisition)
  sleep(2)
  WaitForAnElementByLinkTextAndTouch(job_ad_link)
  sleep(2)
  WaitForAnElementByLinkTextAndTouch(new_job_post_link)
  sleep(2)
end


def AddTheJobDetailsAndSubmitIt(salary_from,salary_from_value,salary_to,salary_to_value,jb_start_date_btn,jb_start_date,jb_end_date,jb_end_date_value,internal_carrer_btn,external_carrer_btn)
  $driver.find_element(:css, 'input[ng-model="jobAd.salaryFrom"]').clear
  WaitForAnElementByCSSAndInputValue(salary_from,salary_from_value)
  $driver.find_element(:css, 'input[ng-model="jobAd.salaryTo"]').clear
  WaitForAnElementByCSSAndInputValue(salary_to,salary_to_value)
  sleep(1)
  WaitForAnElementByCSSAndTouch(jb_start_date_btn)
  sleep(1)
  WaitForAnElementByCSSAndTouch(jb_start_date)
  sleep(1)
  WaitForAnElementByCSSAndInputValue(jb_end_date,jb_end_date_value)
  sleep(1)
  WaitForAnElementByIdAndTouch(internal_carrer_btn)
  sleep(1)
  WaitForAnElementByIdAndTouch(external_carrer_btn)
  sleep(1)
  $driver.find_element(:id, 's2id_autogen4').send_keys("External", :return)
  sleep(1)
end


def SaveTheJobAdAndGoToTheLandingPage(save_job)
  WaitForAnElementByCSSAndTouch(save_job)
end


def SignupAndApplyAsACandidate()
  sleep(1)
  test_site = 'https://staging5.dev.elmodev.com'
  jobADId = '54'
  $email = '${__V(shantomate${__RandomString(7,ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789,)}@gmail.com)}'

  test do
    cookies policy: 'compatibility', clear_each_iteration: true
    threads count: 1,loops: 1 do
      visit name: 'Home page', url: "#{test_site}/careers/portal/login/"


      visit name: 'signup a new user', url: "#{test_site}/careers/portal/register",
            method: 'POST',fill_in: {
              'candidateForm[email]' => "#{$email}",
              'candidateForm[firstName]' => '${__V(open${__RandomString(5,ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,)})}',
              'candidateForm[lastName]' => '${__V(source${__RandomString(4,ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,)})}',
              'candidateForm[password][first]' => 'Tester1!',
              'candidateForm[password][second]' => 'Tester1!'
          } do
      header name: 'X-Requested-With', value: 'XMLHttpRequest'
      end
      visit name: 'Visit profile page', url: "#{test_site}/careers/portal/view-profile" do
        extract regex: '<div class="wrap-long-text">(.*?)</div>', name: 'new_email_id' , match_number: 1
      end
            visit name: 'Go To Home page', url: "#{test_site}/careers/portal/job/view/#{jobADId}" do
              extract regex: 'redirectURL=(.*?)"', name: 'redirect_url' , match_number: 1
            end
            visit name: 'redirect to signin page', url: "#{test_site}/careers/portal/login",
                  method: 'GET',fill_in: {
                    'redirectURL' => '${redirect_url}'
                }

            visit name: 'login to apply', url: "#{test_site}/careers/portal/login_check",
                  method: 'POST',fill_in: {
                    _username:  '${new_email_id}',
                    _password: 'Tester1!',
                    _target_path:  "/careers/portal/job/apply/#{jobADId}#/step1?jobAdId=#{jobADId}&channel=external&source=2&referrerUrl="
                }
            visit name: 'submit the form', url: "#{test_site}/careers/job/apply/submit/#{jobADId}/0",
                  method: 'POST',fill_in: {
                    'jobApplication[resumeFile][name]' =>	"cookies.txt"	,
            'jobApplication[resumeFile][encodedName]'	 => "upload/c2/8b/c28b081857e90b6836f6a386a8b609e29431d43c.txt"	,
            'jobApplication[resumeFile][deleted]'  =>	"0",
            'jobApplication[resumeFile][error]'  =>	"",
            'jobApplication[resumeType]'  =>	"2"	,
            'jobApplication[coverLetterType]' =>	"2"	,
            'jobApplication[questions][1]'  =>	"yes"	,
            'jobApplication[questions][3]'  =>	"28"	,
            'jobApplication[questions][5]'  =>	"3"	,
            'jobApplication[contactDetails][candidateProfileForm][deleted]'  =>	"0"	,
            'jobApplication[contactDetails][candidateProfileForm][homePhone]'  =>	"04564556677"	,
            'jobApplication[contactDetails][candidateProfileForm][mobile]' =>	"04564556677"	,
            'jobApplication[contactDetails][candidateProfileForm][addressLine1]' =>	"george st"	,
            'jobApplication[contactDetails][candidateProfileForm][addressLine2]' =>	"cbd"	,
            'jobApplication[contactDetails][candidateProfileForm][suburb]' =>	"crown"	,
            'jobApplication[contactDetails][candidateProfileForm][state]' =>	"NSW"	,
            'jobApplication[contactDetails][candidateProfileForm][postcode]' =>	"2011"	,
            'jobApplication[contactDetails][candidateProfileForm][country]' =>	"Australia"	,
            'jobApplication[contactDetails][candidateProfileForm][step]' =>	"3"	,
            'jobApplication[contactDetails][applicantId]' =>	"0"	,
            'jobApplication[referrerUrl]' =>	"#{test_site}/careers/portal/jobs"	,
            'jobApplication[coverLetter]' =>	"cookie.txt"	,
            'jobApplication[displayAnswers][1]' =>	"yes"	,
            'jobApplication[displayAnswers][3]' =>	"28"	,
            'jobApplication[displayAnswers][5]' =>	"4"	,
            'applicantId' =>	"0"	,
            'portalUrl' =>	"portal"	,
            'source' =>	"2"
                }
      view_results_tree

    end
  end.run(
      path: './JMETER_AUTO/apache-jmeter-3.0/bin/',
      file: './JMETER_AUTO/Jmeter_tests/newUserSignupApply.jmx',
      properties: './JMETER_AUTO/apache-jmeter-3.0/bin/jmeter.properties')

end


def CheckTheCandidateAppearsUnderNewStatus(new_status)
  GoToThePage('https://staging5.dev.elmodev.com/controlpanel/recruitment/requisition/job-app/43')
  sleep(3)
  WaitForAnElementByCSSAndTouch(new_status)
  sleep(3)
  @new_candidate = $driver.find_elements(:class, "recruitment-candidate-name")[0].text
  $driver.find_elements(:class, "dropdown-toggle")[9].click

end


def MoveTheCandidateFromNewToNotSuitable(add_to_notsuitable)
  WaitForAnElementByCSSAndTouch(add_to_notsuitable)
  sleep(2)
  #binding.pry
  PressEnterConfirm()
  sleep(3)
  $driver.find_elements(:class, "dropdown-toggle")[5].click
  sleep(1)
  $driver.find_element(:css, 'li[ng-click="applyStatusFilter(data.status_not_suitable)"]').click
  sleep(5)

end


def VerifyThecandidateAppearsUnderNotSuitableCategory()
  if
  $driver.find_elements(:class, "recruitment-candidate-name")[0].text.include? "#{@new_candidate}"
    puts "new candidate is in not suitable category"
  else
    raise VerificationException.new("candidate is missing")
  end
end


def SearchARequisition(requisition_list_search_box_id, requisition_name, requisition_search_btn_id)
  Sleep_Until($driver.find_element(:xpath, requisition_list_search_box_id).send_keys(requisition_name))
  Sleep_Until($driver.find_element(:xpath, requisition_search_btn_id).click)
end


def SelectRequisitionStatus(requisition_status)
  #Since we dont have the Closed status in the dropdown and the select from select2 makes use of index
  case requisition_status
    when "Open"
      requisition_status = 1
    when "Pending"
      requisition_status = 0
    when 4, "Rejected"
      requisition_status = 3
    when 5, "Finalised"
      requisition_status = 4
    when 6,"Withdrawn"
      requisition_status = 5
    when 7, "Resubmitted"
      requisition_status = 6
  end
  SelectFromSelect2Input(REQUISITION_STATUS_INDEX_ID, 0, REQUISITION_STATUS_RESULT_ID, requisition_status)
end


def SelectActionToCandidate(action)
  @action = action
  Sleep_Until(ClickMenuOfFirstItemFromTable(CANDIDATE_ACTION_DROPDOWN_ID, action))
end


def SearchCandidate()
  @requisition_candidate = @requisition[:candidate_fn] + ' ' + @requisition[:candidate_ln]
  Sleep_Until(WaitForAnElementByIdAndInputValue(CANDIDATE_SEARCH_BOX_ID, @requisition_candidate))
  Sleep_Until(WaitForAnElementByXpathAndTouch(CANDIDATE_SEARCH_BUTTON_ID))
end


def CheckForVendorEmail()
  #concatenating the retrieved vendor's name and email
  vendor = @requisition[:vendor_fn] + ' ' + @requisition[:vendor_ln] + ' (' + @requisition[:vendor_mail] + ')'

  if @action == "Make an Offer"
    #go to email section of the offer
    Sleep_Until(WaitForAnElementByXpathAndTouch(OFFER_MESSAGE_BUTTON_ID))
  end

  #not using adding the identifier to page elements since passing vendor parameter
  Sleep_Until(VerifyAnElementExists('xpath', '//li[@class="select2-search-choice"]/div[contains(.,vendor)]'))
end


def ClickRequisition(requisition_search_result_title_id)
  req_title = @requisition[:requisition_title_display] + ' (' + (@requisition[:req_id].to_s) +')'

  num_requistion_results = $driver.find_elements(:xpath, requisition_search_result_title_id).size
  i=0

  #if the results are more than 1
  if num_requistion_results > 1
    while(i!= num_requistion_results)
      #check that the correct requsition is clicked
      check = $driver.find_elements(:xpath, requisition_search_result_title_id)[i].attribute('text').include? req_title
      if check == true
        element_index = i
      end
      i = i+1
    end
    Sleep_Until(ClickElementByIndex('xpath', requisition_search_result_title_id, element_index))
  else
    Sleep_Until(WaitForAnElementByXpathAndTouch(requisition_search_result_title_id))
  end
end


def EnterRequisitionNote()
  #clear the contents if any
  Sleep_Until($driver.find_element(:id, REQUISITION_NOTE_ID).clear)
  Sleep_Until(WaitForAnElementByIdAndInputValue(REQUISITION_NOTE_ID, REQUISITION_NOTE_VALUE))

  #check for character counter
  Sleep_Until(VerifyAnElementExists('id', REQUISITION_NOTE_CHARCOUNTER_ID))

  #checks max allowed no.of characters
  max_length = $driver.find_element(:id, REQUISITION_NOTE_ID).attribute('ng-maxlength').to_i
  max_length.eql? 250

  #save note
  Sleep_Until(WaitForAnElementByIdAndTouch(REQUISITION_NOTE_SAVE_BUTTON_ID))
  @time_req_note_added = (DateTime.now).strftime "%d/%m/%Y %H:%M"

  #See success message in modal
  Sleep_Until(VerifyAnElementExistByXPath(REQUISITION_MODAL_ID, REQUISITION_NOTE_SUCCESS_MSG))
  PressEnterOK()
end


def CheckNoteInRequisition()
  $driver.find_element(:xpath, REQUISITION_NOTE_ADDEDBY_ID).text.include? "Company Admin omar"
  $driver.find_element(:xpath, REQUISITION_NOTE_ADDEDBY_ID).text.include? @time_req_note_added
  puts COLOR_GREEN + "Note has been added to the Requisition"
end


def GoToRequisitionSection(section_name)
  case section_name
    when "Overview"
      identifier = REQUSITION_OVERVIEW_SECTION_ID
  end
  Sleep_Until(WaitForAnElementByXpathAndTouch(identifier))
end


def ConfirmDeletion()
  Sleep_Until(WaitForAnElementByIdAndTouch('deleteRequisitionNoteBtn'))
end


def VerifyDeletion()
  Sleep_Until(VerifyAnElementExistByXPath(REQUISITION_MODAL_ID, REQUISITION_NOTE_DEL_MSG))
  PressEnterOK()
  steps %{
    Then  I Should Not See The Edit Button For The Note
    And   I Should Not See The Delete Button For The Note
    And   I Should See The Add Note Button For The Note
        }
end


def VerifyButtons(presence, button_name)
  if button_name == "Edit"
    identifier = REQUISITION_NOTE_EDIT_BUTTON_ID
  elsif button_name == "Delete"
    identifier = REQUISITION_NOTE_DELETE_BUTTON_ID
  elsif button_name == "Add Note"
    identifier = REQUISITION_ADD_NOTE_BUTTON_ID
  end

  #check for the elements presence/absence
  if presence == "See"
    Sleep_Until(VerifyAnElementExists('xpath', identifier))
  elsif presence == "Not See"
    Sleep_Until(VerifyAnElementNotExist('xpath',identifier))
  end
end


def VerifyNoteDetails()
  req_updated_by = @requisition[:first_name] + ' '+ @requisition[:last_name]
  time_updated = Time.at(@requisition[:requisition_note_updated_at]).strftime("%d/%m/%Y %H:%M")

  $driver.find_element(:xpath , REQUISITION_NOTE_ADDEDBY_ID).text.eql? ("Last updated by "+ req_updated_by +" | "+time_updated)
end


def ViewRequisitionForApproval()
  req_title = @requisition[:requisition_title_display] + ' (' + (@requisition[:req_id].to_s) +')'

  #not defining identifier since its parameterised
  num_requistion_results = $driver.find_elements(:xpath,'//tr[contains(.,req_title)]//button[@ng-click="view(requisition)"]').size
  i=1

  #if the results are more than 1
  if num_requistion_results > 1
    while(i <= num_requistion_results)
      #check that the correct requsition is clicked
      check = $driver.find_elements(:xpath, '//tr[contains(.,req_title)]')[i].text.include? req_title
      if check == true
        element_index = i
      end
      i = i+1
    end

    #not defining identifier since its parameterised
    Sleep_Until(ClickElementByIndex('xpath', '//tr[contains(.,req_title)]//button[@ng-click="view(requisition)"]', element_index-1))
  else
    Sleep_Until(WaitForAnElementByXpathAndTouch('//tr[contains(.,req_title)]//button[@ng-click="view(requisition)"]'))
  end
end