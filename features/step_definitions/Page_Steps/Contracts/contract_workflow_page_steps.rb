def ClickAssignContract(assign_contract_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(assign_contract_btn_id))
end

def SearchUser(user_type)
  if user_type == "existing"
    $user = $daos.get_existing_user_detail_with_no_contract
  else
    $user = $daos.get_onboarding_user_detail_with_no_contract
  end
    username = $user[:first_name]+" "+$user[:last_name]
    $driver.find_elements(:xpath, SEARCH_DROPDOWN_ID).last.click
    Sleep_Until($driver.find_elements(:class, SEARCH_BOX_CLASS).last.send_keys(username))
end

def IdentifyUser(user_type)
  username = $user[:first_name]+" "+$user[:last_name]
  if user_type == "existing"
    Sleep_Until($driver.find_elements(:xpath,"//span[text()='#{username}']"))
    Sleep_Until($driver.find_elements(:xpath,"//div[text()=' (#{$user[:email]})']"))
  else
    Sleep_Until($driver.find_elements(:xpath,"//span[text()='#{username}']"))
    Sleep_Until($driver.find_elements(:xpath,"//div[text()=' (#{$user[:email]}) (Onboarding)']"))
  end
end

def ChooseUserForContract(confirm_assign_contract_btn_id)
  Sleep_Until($driver.find_elements(:class, SEARCH_RESULTS_CLASS).first.click)
  Sleep_Until(WaitForAnElementByXpathAndTouch(confirm_assign_contract_btn_id))
end

def ConfirmUserPendingContractWorkflow()
  workflow_status = 1 #pending status
  user_id = $user[:id]
  username = $user[:first_name]+" "+$user[:last_name]

  #verify in the DB
  contract_workflow_id = $daos.get_user_contract_workflow_id(user_id,workflow_status)

  if contract_workflow_id!= nil
    #search by username
    Sleep_Until(WaitForAnElementByIdAndInputValue(CONTRACT_WORKFLOW_SEARCH_BOX_ID, username))
    Sleep_Until(WaitForAnElementByXpathAndTouch(SEARCH_BUTTON_ID))
    employee_name = $driver.find_element(:class, 'pull-left').text()
    employee_name.eql?username
  end
end

def VerifyAssignSuccessMessage(assign_confirmation_msg_class, assign_confirmation_msg_text)
  Sleep_Until(VerifyAnElementExistByClass(assign_confirmation_msg_class, assign_confirmation_msg_text))
  Sleep_Until(WaitForAnElementByXpathAndTouch(CLOSE_CONFIRMATION_MODAL_BTN_ID))
end