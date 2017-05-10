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