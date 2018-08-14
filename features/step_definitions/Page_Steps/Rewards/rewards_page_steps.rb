def EnterBadgeTitle(badge_id, badge_value)
  $driver.find_element(:xpath, badge_id).clear()
  WaitForAnElementByXpathAndInputValue(badge_id, badge_value)
end

def ClickUploadImage(badge_uploadimg_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(badge_uploadimg_btn_id))
end

def SelectAnImage(browse_image_id, sample_filename)
  sleep(1)
  BrowseFileSelect(browse_image_id, sample_filename)
end

def ClickDoneBtn(image_submit_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(image_submit_btn_id))
end

def SelectBadgeAvailability(select_availability_id, select_availability_value)
  Sleep_Until(SelectFromDropDown(select_availability_id, select_availability_value))
end

def ClickSaveBadge(badge_create_save_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(badge_create_save_btn_id))
end