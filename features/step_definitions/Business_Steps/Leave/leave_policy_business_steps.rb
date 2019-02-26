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
  JavascriptClick(toggle_id)
end


Then(/^I Should See That The Show LSL after x years Default Value is 1/i) do
  expect($driver.find_element(:id, "leave-policy-form-showLongServiceLeaveAfterYears").attribute('value')).to eq("1")
  puts COLOR_GREEN + "show long service leave after x years is set to default 1".upcase
end

