
def goToTheDocumentsAsCompanyAdmin(admin_cog,documents_expand,documents_list_path)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  sleep(2)
  goToDocumentsSection(documents_expand)
  sleep(2)
  goToItemLandingPage(documents_list_path)

end

def goToDocumentsSection(documents_expand)
  WaitForAnElementByXpathAndTouch(documents_expand)
end

def goToItemLandingPage(documents_list_path)
  WaitForAnElementByXpathAndTouch(documents_list_path)
  sleep(2)
end

def goToNewFormTemplateAddPage(form_temp_btn)
  WaitForAnElementByXpathAndTouch(form_temp_btn)
end

def enterFormTemplateDetails(form_temp_title, form_temp_title_text, pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
  sleep(1)
  select_from_select2_input(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
end

def enterDescription(form_temp_desc_txt)
  use_ckeditor_to_enter_description(form_temp_desc_txt)
end

def createAFormTemplateAndVerify(form_temp_save)
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
