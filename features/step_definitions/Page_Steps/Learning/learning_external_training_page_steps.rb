#checks if fields are enabled or not
def CheckConfigFields(field_ability)
  # .enabled? to check whether they are locked or not
  if field_ability == 'Unlocked'
    LEARNING_EXTTRAINING_MAIN_CONFIG_ELEMENT_MAP.each do |key, value|
      expect($driver.find_element(:id, value).enabled?).to eq(true)
      puts COLOR_BLUE + key.to_s + " is unlocked and can be edited"
    end
  else
    LEARNING_EXTTRAINING_MAIN_CONFIG_ELEMENT_MAP.each do |key, value|
      expect($driver.find_element(:id, value).enabled?).to eq(false)
      puts COLOR_BLUE + key.to_s + " is locked and cant be edited"
    end
    LEARNING_EXTTRAINING_ADDN_CONFIG_ELEMENT_MAP.each do |key, value|
      expect($driver.find_element(:id, value).enabled?).to eq(false)
      puts COLOR_BLUE + key.to_s + " is locked and cant be edited"
    end
  end
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

def CheckAndEnable(field_name,setting)

  identifier = LEARNING_EXTTRAINING_MAIN_CONFIG_ELEMENT_MAP.fetch(field_name.to_sym, nil)

  if identifier == nil
    puts COLOR_BLUE + "Couldnt find the identifier for the element"
    skip_this_scenario
  end

  #if true then enabled else disabled
  check_toggle = $driver.find_element(:id, identifier).selected?
  if check_toggle == true
    puts COLOR_BLUE + field_name + " is currently Enabled"
    check_toggle = 'Enable'
  else
    puts COLOR_BLUE + field_name + " is currently Disabled"
    check_toggle = 'Disable'
  end

  if check_toggle != setting
    $driver.execute_script("$(#{identifier}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
    puts COLOR_GREEN + field_name + " has now been set to " + setting + "d"
  end
end

def CheckAndSet(field_name, field_need)

  field_name = field_name + ' Optional'

  identifier = LEARNING_EXTTRAINING_ADDN_CONFIG_ELEMENT_MAP.fetch(field_name.to_sym, nil)

  if identifier == nil
    puts COLOR_BLUE + "Couldnt find the identifier for the element"
    skip_this_scenario
  end

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

def SetTrainingSetting(action)
  toggle_setting = CheckExtTrainingSetting()

  if action != toggle_setting
    $driver.execute_script("$(#{LEARNING_EXTTRAINING_TOGGLE_ID}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
    puts COLOR_GREEN + " External Training has now been set to " + action +"d"
  else
    puts "External Training is already set to "+ action + "d"
  end
end

def CheckFieldDisplayed(field_name, ability)
  if field_name == 'Attachments'
    identifier = LEARNING_EXTTRAINING_COURSE_ATTACHMENTS_ID
  else
    identifier = LEARNING_EXTTRAINING_MAIN_CONFIG_ELEMENT_MAP.fetch(field_name.to_sym, nil)
  end

  if identifier == nil
    puts COLOR_BLUE + "Couldnt find the identifier for the element"
    skip_this_scenario
  end

  if ability == ' Not '
    Sleep_Until(VerifyAnElementNotExist('id',identifier))
  else
    Sleep_Until(VerifyAnElementExists('id',identifier))
  end
end

def AddCourseTemplateDetails()
  ClearField('id', LEARNING_EXTTRAINING_COURSE_TEMPLATE_NAME_ID)
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEARNING_EXTTRAINING_COURSE_TEMPLATE_NAME_ID, LEARNING_EXTTRAINING_COURSE_TEMP_NAME))
  Sleep_Until(UseCkeditorToEnterText(LEARNING_EXTTRAINING_COURSE_TEMP_DESC,0))
  ClearField('id', LEARNING_EXTTRAINING_COURSE_TEMPLATE_DUR_ID)
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEARNING_EXTTRAINING_COURSE_TEMPLATE_DUR_ID, LEARNING_EXTTRAINING_COURSE_TEMP_DUR))
  ClearField('id', LEARNING_EXTTRAINING_COURSE_TEMPLATE_CPD_ID)
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEARNING_EXTTRAINING_COURSE_TEMPLATE_CPD_ID, LEARNING_EXTTRAINING_COURSE_TEMP_CPD))
end

def SaveTemplate()
  Sleep_Until(WaitForAnElementByIdAndTouch(LEARNING_EXTTRAINING_COURSE_TEMPLATE_SAVE_ID))

  #Verifying addition
  if @action == 'Add'
    expect($driver.find_element(:xpath, LEARNING_EXTTRAINING_COURSE_TEMPLATE_NAME_BREADCRUMB).text).not_to eq('New Template')
    expect($driver.find_element(:xpath, LEARNING_EXTTRAINING_COURSE_TEMPLATE_NAME_BREADCRUMB).text).to eq('Automated Test External Tra...')
  end
end

#Clears input fields
def ClearField(type, identifier)
  $driver.find_element(:"#{type}", identifier).clear()
end
