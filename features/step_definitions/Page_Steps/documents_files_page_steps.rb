
def goToAddFilePage(add_file_btn)
  WaitForAnElementByXpathAndTouch(add_file_btn)
end

def enterFileDetails(form_temp_title, form_temp_title_text, pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
  sleep(1)
  SelectFromSelect2Input(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
end

def selectALabel(file_id, label_id, label_index)
  WaitForAnElementByXpathAndTouch(file_id)
  WaitForDropdownByClassAndTouchTheIndex(label_id, label_index)
end

def select_a_file(browse_file_id, sample_filename)
  sleep(1)
  browse_file_select(browse_file_id, sample_filename)
end

def selectFileAvailability(availability_id, availability_value)
  sleep(1)
  SelectFromDropDown(availability_id, availability_value)
end

def createAFile(form_temp_save)
    WaitForAnElementByXpathAndTouch(form_temp_save)
    sleep(3)
end

def searchforAFile(search_box_id, form_temp_search_txt, search_btn_id)
  WaitForAnElementByXpathAndInputValue(search_box_id, form_temp_search_txt)
  WaitForAnElementByXpathAndTouch(search_btn_id)
  sleep(2)
end
