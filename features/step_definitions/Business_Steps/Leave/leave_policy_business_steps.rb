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
  CheckDefaultValueLSLAfterXyrs()
end

And(/^I Edit A Leave Policy/i) do
  Sleep_Until(ClickElement('class', ACTION_DROPDOWN_CLASS_NAME))
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch("Edit Leave Policy"))
end

And(/^I Click The Save Button To Save The Leave Policy/i) do
  Sleep_Until(ClickElement('id', LEAVE_POLICY_SAVE_ID))
end

Then(/^I Should See A LSL Time Validation Error Message/i) do
  sleep (2)
  #Error pop-up is displayed
  Sleep_Until(PressEnterOK())
  VerifyErrorAlertMessage(LEAVE_POLICY_ALERT_ID, LEAVE_POLICY_SHOWLSLXYRS_ALERT_MSG)
end

And(/^I Enter The Show LSL after x years To (\d+)/i) do | input_value |
  ClearField('id', LEAVE_POLICY_SHOWLSLXYRS_ID)
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEAVE_POLICY_SHOWLSLXYRS_ID, input_value))
end
