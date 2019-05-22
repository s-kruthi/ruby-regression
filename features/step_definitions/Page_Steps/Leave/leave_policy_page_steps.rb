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

def CheckDefaultValueLSLAfterXyrs()
  expect($driver.find_element(:id, LEAVE_POLICY_SHOWLSLXYRS_ID).attribute('value')).to eq("1")
  puts COLOR_GREEN + "show long service leave after x years is set to default 1".upcase
end