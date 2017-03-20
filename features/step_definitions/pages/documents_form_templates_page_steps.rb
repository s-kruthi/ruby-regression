
def GoToTheDocumentsFormTemplatePageAsCompanyAdmin(admin_cog,documents_expand,documents_list_path)
  WaitForAnElementByClass(admin_cog)
  TouchAdminMenu(admin_cog)
  sleep(2)
  GoToDocumentsSection(documents_expand)
  sleep(2)
  GoToFormTemplateLandingPage(documents_list_path)

end

def GoToDocumentsSection(documents_expand)
  WaitForAnElementByXpathAndTouch(documents_expand)
end


def GoToFormTemplateLandingPage(documents_list_path)
  WaitForAnElementByXpathAndTouch(documents_list_path)
  sleep(2)
end

def GoToNewFormTemplateAddPage(form_temp_btn)
  WaitForAnElementByXpathAndTouch(form_temp_btn)
end

def EnterFormTemplateDetails(form_temp_title, form_temp_title_text, pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
  sleep(1)
  useSelect2InPutField(pos_index_arrow, pos_index_arrow_id, pos_index_class, pos_index_class_id)
end

def EnterDescription(form_temp_desc_txt)
  useCKEditorToEnterDescription(form_temp_desc_txt)
end

def CreateAFormTemplateAndVerify(form_temp_save)
  WaitForAnElementByXpathAndTouch(form_temp_save)
  sleep(4)
end


def SearchAFormTemplate()

end

def HideAFormTemplateAndVerify()

end