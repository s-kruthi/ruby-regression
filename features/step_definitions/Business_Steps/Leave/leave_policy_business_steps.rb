When(/^I Click On New Leave Policy Button$/i) do
  Sleep_Until(ClickElement('xpath', ADD_LEAVE_POLICY_ID))
end


Then(/^I Should See The ([\w\s]+) toggle set to ([\w]+)/i) do | toggle_name, toggle_setting |
  case toggle_name
    when 'Set as default policy'
      toggle_id = LEAVE_POLICY_DEFAULTPOLICY_TOGGLE_ID
    when 'Show Long Service Leave Balance to employees'
      toggle_id = LEAVE_POLICY_SHOWLSL_TOGGLE_ID
    when 'Show Personal Leave Balance to employees'
      toggle_id = LEAVE_POLICY_SHOWPERSONALLEAVE_TOGGLE_ID
    when 'Show Personal Leave Validation'
      toggle_id = LEAVE_POLICY_SHOWPERSONAL_TOGGLE_ID
  end

  CheckToggleSetting(toggle_id, toggle_setting)
  puts COLOR_GREEN + (toggle_name + " is set to " + toggle_setting).upcase
end


And(/^I Set The ([\w\s]+) toggle to ([\w]+)/i) do | toggle_name, toggle_setting |
  case toggle_name
  when 'Set as default policy'
    toggle_id = LEAVE_POLICY_DEFAULTPOLICY_TOGGLE_ID
  when 'Show Long Service Leave Balance to employees'
    toggle_id = LEAVE_POLICY_SHOWLSL_TOGGLE_ID
  when 'Show Personal Leave Balance to employees'
    toggle_id = LEAVE_POLICY_SHOWPERSONALLEAVE_TOGGLE_ID
  when 'Show Personal Leave Validation'
    toggle_id = LEAVE_POLICY_SHOWPERSONALVALIDATION_TOGGLE_ID
  end
  CheckAndSetToggle(toggle_id, toggle_setting)
end


Then(/^I Should See That The Show LSL after x years Default Value is 1/i) do
  expect($driver.find_element(:id, "leave-policy-form-showLongServiceLeaveAfterYears").attribute('value')).to eq("1")
  puts COLOR_GREEN + "show long service leave after x years is set to default 1".upcase
end


And(/^I Edit A Leave Policy/i) do
  Sleep_Until($driver.find_element(:class, ACTION_DROPDOWN_CLASS_NAME).click)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch("Edit Leave Policy"))
end


And(/^I Click The Save Button To Save The Leave Policy/i) do
  $driver.find_element(:id, "leave-policy-form-save").click
end


Then(/^I Should See A LSL Time Validation Error Message/i) do
  sleep (2)
  Sleep_Until(PressEnterOK())
  VerifyErrorAlertMessage('//div[contains(@class,"alert-danger")]', "Show Long Service Leave after x years\nThis value should between 1 to 35.")
end


And(/^I Enter The Show LSL after x years To 36/i) do
  $driver.find_element(:id, "leave-policy-form-showLongServiceLeaveAfterYears").clear
  Sleep_Until(WaitForAnElementByIdAndInputValue("leave-policy-form-showLongServiceLeaveAfterYears", 36))
end





