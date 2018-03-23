def EnterPlaceholderTitle(placeholder_id, placeholder_value)
  $driver.find_element(:xpath, placeholder_id).clear()
  WaitForAnElementByXpathAndInputValue(placeholder_id, placeholder_value)
end

def SelectPlaceholderType(select_type_id, placeholder_type_value)
  Sleep_Until(select_from_drop_down(select_type_id, placeholder_type_value))
end

def EnterPlaceholderText(placeholder_text_id, placeholder_text)
  $driver.find_element(:xpath, placeholder_text_id).clear()
  WaitForAnElementByXpathAndInputValue(placeholder_text_id, placeholder_text)
end

def ClickSavePlaceholder(placeholder_create_save_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(placeholder_create_save_btn_id))
end

def VerifyCreationSuccessMessage(placeholder_save_success_id,placeholder_save_success_value)
  Sleep_Until(VerifyAnElementExistByXPath(placeholder_save_success_id,placeholder_save_success_value))
end

def VerifyMaxLength(textarea_default_value_id,max_value)
  max_length = $driver.find_element(:xpath, textarea_default_value_id).attribute('maxlength')
  max_length.eql?max_value
end