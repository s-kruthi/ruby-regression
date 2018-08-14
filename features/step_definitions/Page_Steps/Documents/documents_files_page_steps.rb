def goToAddFilePage(add_file_btn)
  WaitForAnElementByXpathAndTouch(add_file_btn)
end


def enterFileDetails(form_temp_title, form_temp_title_text)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
  sleep(1)
end

#Sleep_Until(enterFileCategory(FILE_CATEGORY_ID, FILE_CATEGORY_VALUE))

def enterFileCategory(dropdown_id, dropdown_value)
  SelectSingleFromSelect2InputDropdown(dropdown_id, SELECT2_DROPDOWN_ID, dropdown_value, SELECT2_DROPDOWN_RESULT_CLASS)
end


def selectALabel(file_id, label_id, label_index)
  Sleep_Until(WaitForAnElementByXpathAndTouch(file_id))
  Sleep_Until(WaitForDropdownByClassAndTouchTheIndex(label_id, label_index))
end


def select_a_file(browse_file_id, sample_filename)
  BrowseFileSelect(browse_file_id, sample_filename)
end


def selectFileAvailability(availability_id, availability_value)
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
