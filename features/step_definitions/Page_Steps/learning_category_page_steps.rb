def ClickTabNameCategories(category_btn)
  WaitForAnElementByXpathAndTouch(category_btn)
end

def AddCourseCategory(new_course_category)
  WaitForAnElementByXpathAndTouch(new_course_category)
end

def AddCategoryName(category_name)
  WaitForAnElementByIdAndInputValue(CATEGORY_NAME_ID, category_name)
end

def AddCategoryDescription(category_description)
  WaitForAnElementByCSSAndInputValue(CATEGORY_FRAME_CSS, category_description)
end

def SaveCourseCategory(category_save_id)
  WaitForAnElementByIdAndTouch(category_save_id)
end

def VerifySuccessAlert(success_xpath)
  VerifyAnElementExistByXPath(success_xpath,"Category has been saved!")
end

def EditCategory(category_edit_xpath)
  WaitForAnElementByXpathAndTouch(category_edit_xpath)
end

def ClickCategoryVisibleButton(category_visible_xpath)
  WaitForAnElementByXpathAndTouch(category_visible_xpath)
end

def ConfirmCategoryVisibilityWithAlertChangeOnClick(visibility_before_click)
  case visibility_before_click
    when "Visible"
      WaitForAlertWindowAndTouchAcceptOrDismiss("accept")
      WaitForToggleButtonStateChangedByXpath(CATEGORY_VISIBLE_XPATH, "Hidden")
      VerifyAnElementExistByXPath(CATEGORY_VISIBLE_XPATH,"Hidden")
    else "Hidden"
      WaitForToggleButtonStateChangedByXpath(CATEGORY_VISIBLE_XPATH, "Visible")
      VerifyAnElementExistByXPath(CATEGORY_VISIBLE_XPATH,"Visible")
  end
end

def ConfirmCategoryVisibilityNoAlertChangeOnClick(visibility_before_click)
  case visibility_before_click
    when "Visible"
      VerifyAnElementExistByXPath(CATEGORY_VISIBLE_XPATH,"Hidden")
    else "Hidden"
      VerifyAnElementExistByXPath(CATEGORY_VISIBLE_XPATH,"Visible")
  end
end

def AdminCreateItemTroughNewLink(link_text)
  WaitForAnElementByLinkAndTouch(link_text)
end

def CompleteFieldWithRuntimeName(field_id, name)
  WaitForAnElementByIdAndInputValue(field_id, name)
end

def ClickButtonWithName(button_text)
  button_css = %Q[button[name*= "#{button_text.downcase}"]]
  Sleep_Until(WaitForAnElementByCSSAndTouch(button_css))
end

def ClickLinkButtonWithName(link_button_text)
  link_button_css = %Q[a[title*="#{link_button_text}"]]
  WaitForAnElementByCSSAndTouch(link_button_css)
end

def TableItemExistingOnPage(category_section_class)
  VerifyAnElementExistByClass(category_section_class, "")
end

def EditTextInCKEContent(content, index_id = 0)
  UseCkeditorToEnterText(content, index_id)
end