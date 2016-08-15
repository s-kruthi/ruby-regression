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
  sleep(1)

  WaitForDropdownByClassAndTouchTheIndex(loc_index_arrow,loc_index_arrow_id)
  sleep(1)
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
