def EnterContractPlaceholderTitle(contract_placeholder_id, contract_placeholder_value)
  $driver.find_element(:xpath, contract_placeholder_id).clear()
  WaitForAnElementByXpathAndInputValue(contract_placeholder_id, contract_placeholder_value)
end

def SelectContractPlaceholderType(select_contract_placeholder_type_id, placeholder_type_value)
  Sleep_Until(SelectFromDropDown(select_contract_placeholder_type_id, placeholder_type_value))
end

def EnterContractPlaceholderText(contract_placeholder_text_id, contract_placeholder_text)
  $driver.find_element(:xpath, contract_placeholder_text_id).clear()
  WaitForAnElementByXpathAndInputValue(contract_placeholder_text_id, contract_placeholder_text)
end

def ClickSaveContractPlaceholder(contract_placeholder_create_save_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(contract_placeholder_create_save_btn_id))
end

def VerifyContractPlaceholderCreationSuccessMessage(contract_placeholder_save_success_id, contract_placeholder_save_success_value)
  Sleep_Until(VerifyAnElementExistByXPath(contract_placeholder_save_success_id, contract_placeholder_save_success_value))
end

def VerifyMaxLength(contract_placeholder_textarea_default_value_id, max_value)
  max_length = $driver.find_element(:xpath, contract_placeholder_textarea_default_value_id).attribute('maxlength').to_i
  max_length.eql?max_value
end

def SearchContractPlaceholder(contract_placeholder_search_box_id, search_contract_placeholder_value, contract_placeholder_search_btn_id)
  Sleep_Until(WaitForAnElementByIdAndInputValue(contract_placeholder_search_box_id, search_contract_placeholder_value))
  Sleep_Until(WaitForAnElementByIdAndTouch(contract_placeholder_search_btn_id))
end

def VerifyContractPlaceholderSearch(contract_placeholder_search_results_id, contract_placeholder_name)
  query_count = $daos.get_contract_placeholders_containing_string(contract_placeholder_name)

  if query_count == 0
    Sleep_Until(VerifyAnElementExistByXPath(contract_placeholder_search_results_id, CONTRACT_PLACEHOLDER_NORECORDS_MSG))
  else
    results_count = $driver.find_element(:xpath, contract_placeholder_search_results_id).text.split(" ")[4].to_i
    results_count.eql?query_count
  end
end