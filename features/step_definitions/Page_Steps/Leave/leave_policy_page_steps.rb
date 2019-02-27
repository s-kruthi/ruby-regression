def CheckToggleSetting(toggle_id, toggle_setting)
  toggle_value = $driver.find_element(:id, 'leave-policy-form-showLongServiceLeaveBalance').selected?
  if toggle_setting == 'Disabled'
    expect(toggle_value).to eq(false)
  else
    expect(toggle_value).to eq(true)
  end
end


def CheckAndSetToggle(toggle_id, toggle_setting)
  case toggle_setting
  when 'Enabled'
    toggle_setting = true
  when 'Disabled'
    toggle_setting = false
  end

  toggle_value = $driver.find_element(:id, 'leave-policy-form-showLongServiceLeaveBalance').selected?

  if (toggle_value == toggle_setting)
    puts "toggle is already set with desired setting"
  else
    JavascriptClick(toggle_id)
  end
end