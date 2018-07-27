#checks if fields are enabled or not
def CheckConfigFields(field_ability)
  # .enabled? to check whether they are locked or not
  # hash of all the fields
end


def CheckExtTrainingSetting()
  #if true then enabled else disabled
  check_toggle = $driver.find_element(:id, LEARNING_EXTTRAINING_TOGGLE_ID).selected?
  if check_toggle == true
    puts "External training is currently Enabled"
    return "Enable"
  else
    puts "External training is currently Disabled"
    return "Disable"
  end
end


def CheckAndEnable(identifier, field_name)
  #if true then enabled else disabled
  check_toggle = $driver.find_element(:id, identifier).selected?
  if check_toggle == true
    puts field_name + " is currently Enabled"
  else
    puts field_name + " is currently Disabled"
    $driver.execute_script("$(#{identifier}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
    puts COLOR_GREEN + field_name + " has now been set to Enabled"
  end
end


def CheckAndSet(identifier, field_name, field_need)
  #if true then required else optional
  check_toggle = $driver.find_element(:id, identifier).selected?
  if check_toggle == true
    puts field_name + " is currently set as Required"
    check_toggle = "Required"
  else
    puts field_name + " is currently set as Optional"
    check_toggle = "Optional"
  end

  if check_toggle != field_need
    $driver.execute_script("$(#{identifier}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
    puts COLOR_GREEN + field_name + " has now been set to "+ field_need
  end
end
