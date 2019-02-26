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
  byebug
  $driver.execute_script("$(#{LEARNING_EXTTRAINING_TOGGLE_ID}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")

  $driver.execute_script("$(#{toggle_id}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
  byebug
end
