
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

def CreateAFormTemplateAndVerify(form_temp_btn, form_temp_title, form_temp_title_text, form_temp_category, form_temp_save)
  WaitForAnElementByXpathAndTouch(form_temp_btn)
  sleep(2)
  WaitForAnElementByXpathAndInputValue(form_temp_title, form_temp_title_text)
  sleep(1)
  WaitForAnElementByXpathAndTouch(form_temp_category)
  WaitForAnElementByXpathAndTouch(form_temp_save)
  sleep(4)
end


def SearchAFormTemplate()

end

def HideAFormTemplateAndVerify()

end