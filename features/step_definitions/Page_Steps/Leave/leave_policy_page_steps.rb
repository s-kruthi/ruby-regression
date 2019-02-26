def CheckToggleSetting(toggle_id, toggle_setting)
  toggle_value = $driver.find_element(:id, 'leave-policy-form-showLongServiceLeaveBalance').selected?
  if toggle_setting == 'Disabled'
    expect(toggle_value).to eq(false)
  else
    expect(toggle_value).to eq(true)
  end
end