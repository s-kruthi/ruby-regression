def GoToRecruitmentSetupPageAsAdmin(recruitment_tab,positions_link)
  sleep(1)
  WaitForAnElementByPartialLinkTextAndTouch(recruitment_tab)
end

class SortingException < Exception;

end

def GoToRecruitmentRequisitionAddPage(new_requisition_btn)
  sleep(1)
  WaitForAnElementByXpathAndTouch(new_requisition_btn)
end


def EnterNewRecruitmentRequisitionDetails(index_arrow,index_arrow_id,index_class,index_class_id,num_of_positions, requisition_duedate,calender_done_btn,requisition_message)
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown_index_arrow, index_arrow_id)
  Wait_For(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown_index_class, index_class_id)
  Wait_For(1)

  WaitForAnElementByXpathAndInputValue(num_of_position)
  Wait_For(1)

  WaitForAnElementByXpathAndInputValue(requisition_duedate)
  Wait_For(1)
  WaitForAnElementByXpathAndTouch(calender_done_btn)
end

def CreateANewRecruitmentRequisition(save_btn)
  WaitForAnElementByXpathAndTouch(save_btn)
end
