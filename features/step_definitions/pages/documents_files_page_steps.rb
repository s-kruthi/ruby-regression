
def goToAddFilePage(add_file_btn)
  WaitForAnElementByXpathAndTouch(form_temp_btn)
end

def enterFileDetails(form_temp_title, form_temp_title_text, pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
  sleep(1)
  useSelect2InPutField(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
end

def createAFileAndVerify(form_temp_save)
  WaitForAnElementByXpathAndTouch(form_temp_save)
  sleep(3)
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
