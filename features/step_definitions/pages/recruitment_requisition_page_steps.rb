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
  test_site = 'https://tmsfull.dev.elmodev.com'
  jobADId = '46'
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

#  def ApplyForTheJobAsAcandidate()
#   sleep(1)
#   test_site = 'https://staging5.dev.elmodev.com'
#   jobADId = '50'
#
#   test do
#     cookies policy: 'compatibility', clear_each_iteration: true
#     threads count: 1,loops: 1 do
#       visit name: 'Go To Home page', url: "#{test_site}/careers/portal/job/view/#{jobADId}" do
#         extract regex: 'redirectURL=(.*?)"', name: 'redirect_url' , match_number: 1
#       end
#       visit name: 'redirect to signin page', url: "#{test_site}/careers/portal/login",
#             method: 'GET',fill_in: {
#               'redirectURL' => '${redirect_url}'
#           }
#
#       visit name: 'login to apply', url: "#{test_site}/careers/portal/login_check",
#             method: 'POST',fill_in: {
#               _username:  '${new_email_id}',
#               _password: 'Tester1!',
#               _target_path:  "/careers/portal/job/apply/#{jobADId}#/step1?jobAdId=#{jobADId}&channel=external&source=2&referrerUrl="
#           }
#       visit name: 'submit the form', url: "#{test_site}/careers/job/apply/submit/#{jobADId}/0",
#             method: 'POST',fill_in: {
#               'jobApplication[resumeFile][name]' =>	"cookies.txt"	,
#       'jobApplication[resumeFile][encodedName]'	 => "upload/c2/8b/c28b081857e90b6836f6a386a8b609e29431d43c.txt"	,
#       'jobApplication[resumeFile][deleted]'  =>	"0",
#       'jobApplication[resumeFile][error]'  =>	"",
#       'jobApplication[resumeType]'  =>	"2"	,
#       'jobApplication[coverLetterType]' =>	"2"	,
#       'jobApplication[questions][1]'  =>	"yes"	,
#       'jobApplication[questions][3]'  =>	"28"	,
#       'jobApplication[questions][5]'  =>	"3"	,
#       'jobApplication[contactDetails][candidateProfileForm][deleted]'  =>	"0"	,
#       'jobApplication[contactDetails][candidateProfileForm][homePhone]'  =>	"04564556677"	,
#       'jobApplication[contactDetails][candidateProfileForm][mobile]' =>	"04564556677"	,
#       'jobApplication[contactDetails][candidateProfileForm][addressLine1]' =>	"george st"	,
#       'jobApplication[contactDetails][candidateProfileForm][addressLine2]' =>	"cbd"	,
#       'jobApplication[contactDetails][candidateProfileForm][suburb]' =>	"crown"	,
#       'jobApplication[contactDetails][candidateProfileForm][state]' =>	"NSW"	,
#       'jobApplication[contactDetails][candidateProfileForm][postcode]' =>	"2011"	,
#       'jobApplication[contactDetails][candidateProfileForm][country]' =>	"Australia"	,
#       'jobApplication[contactDetails][candidateProfileForm][step]' =>	"3"	,
#       'jobApplication[contactDetails][applicantId]' =>	"0"	,
#       'jobApplication[referrerUrl]' =>	"#{test_site}/careers/portal/jobs"	,
#       'jobApplication[coverLetter]' =>	"cookie.txt"	,
#       'jobApplication[displayAnswers][1]' =>	"yes"	,
#       'jobApplication[displayAnswers][3]' =>	"28"	,
#       'jobApplication[displayAnswers][5]' =>	"4"	,
#       'applicantId' =>	"0"	,
#       'portalUrl' =>	"portal"	,
#       'source' =>	"2"
#           }
#
#       view_results_tree
#
#     end
#   end.run(
#       path: './JMETER_AUTO/apache-jmeter-3.0/bin/',
#       file: './JMETER_AUTO/Jmeter_tests/newApplyUser.jmx',
#       properties: './JMETER_AUTO/apache-jmeter-3.0/bin/jmeter.properties')
# end