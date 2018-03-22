def ClickAssignContract(assign_contract_btn_id)
  Sleep_Until(WaitForAnElementByXpathAndTouch(assign_contract_btn_id))
end

def search_user(user_type)
  if user_type == "existing"
    $user = $daos.get_existing_user_detail
  else
    $user = $daos.get_onboarding_user_detail
  end
    username = $user[:first_name]+" "+$user[:last_name]
    $driver.find_elements(:xpath,"//div[contains(@class,'bootbox-input')]").last.click
    Sleep_Until($driver.find_elements(:class, "bootbox-input").last.send_keys(username))
end

def IdentifyUser(user_type)
  username = $user[:first_name]+" "+$user[:last_name]
  if user_type == "existing"
    Sleep_Until($driver.find_elements(:xpath,"//li[text()='#{username} (#{$user[:email]})']"))
  else
    Sleep_Until($driver.find_elements(:xpath,"//li[text()='#{username} (#{$user[:email]}) (Onboarding)']"))
  end
end