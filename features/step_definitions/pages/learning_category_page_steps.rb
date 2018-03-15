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

def ConfirmCategoryVisibilityChangeOnClick(visibility_before_click)
  case visibility_before_click
    when "Visible"
      begin
        $driver.switch_to.alert.accept
        rescue Selenium::WebDriver::Error::NoAlertOpenError => e
        puts e.message
      end
      $driver.find_element(:xpath, CATEGORY_VISIBLE_XPATH).attribute('title') === 'Hidden'
    when "Hidden"
      $driver.find_element(:xpath, CATEGORY_VISIBLE_XPATH).attribute('title') === 'Visible'
  end
end