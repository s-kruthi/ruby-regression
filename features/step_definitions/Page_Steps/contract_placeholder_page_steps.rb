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

def VerifyMaxLength(textarea_default_value_id, max_value)
  max_length = $driver.find_element(:xpath, textarea_default_value_id).attribute('maxlength').to_i
  max_length.eql?max_value
end

def SearchContractPlaceholder(placeholder_search_box_id, search_placeholder_value, placeholder_search_btn_id)
  Sleep_Until(WaitForAnElementByIdAndInputValue(placeholder_search_box_id, search_placeholder_value))
  Sleep_Until(WaitForAnElementByIdAndTouch(placeholder_search_btn_id))
end

def VerifySearch(search_results_id, placeholder_name)
  results_count = $driver.find_element(:xpath, search_results_id).text.split(" ")[4].to_i
  query_count = $daos.get_placeholders_containing_string(placeholder_name)
  results_count.eql?query_count
end