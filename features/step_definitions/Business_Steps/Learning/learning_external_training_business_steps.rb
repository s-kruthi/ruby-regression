And(/^I (Enable|Disable) The External Training For Users$/i) do |action|
  toggle_setting = CheckExtTrainingSetting()

  if action != toggle_setting
    $driver.execute_script("$(#{LEARNING_EXTTRAINING_TOGGLE_ID}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
    puts COLOR_GREEN + " External Training has now been set to " + action +"d"
  else
    puts "External Training is already set to "+ action + "d"
  end
  #library disabled -> $driver.find_element(:id, 'elmo_learningbundle_external_training_libraryOnly').selected? == false

  # if action == "Enable"
  #  steps %{ Then I Should See That The Configuration Fields Gets Unlocked }
  # elsif action == "Disable"
  #   steps %{ Then I Should See That The Configuration Fields Gets Locked }
  # end
end


Then(/^I Should See That The Configuration Fields Gets (Unlocked|Locked)$/i) do |field_ability|
  CheckConfigFields(field_ability)
end


And(/^I Enable The ([\w\s]+) Field$/i) do |field_name|
  case field_name
    when 'Description'
      identifier = LEARNING_EXTTRAINING_DESC_ID
    when 'Training Duration'
      identifier = LEARNING_EXTTRAINING_DURATION_ID
  end
  #check enabled/disabled then click
  CheckAndEnable(identifier,field_name)
end


And(/^I Set The ([\w\s]+) Field As (Optional|Required)$/i) do |field_name, field_need|
  case field_name
    when 'Description'
      identifier = LEARNING_EXTTRAINING_DESC_OPTIONAL_ID
    when 'Training Duration'
      identifier = LEARNING_EXTTRAINING_DURATION_ID
  end
  #check enabled/disabled then click
  CheckAndSet(identifier,field_name, field_need)
end


Then(/^I Should Be Able To Save The Configuration Successfully$/i) do
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEARNING_EXTTRAINING_SETUP_SAVE_ID))
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LEARNING_EXTTRAINING_CONFIG_SAVE_SUCCESSFUL_VALUE))
end


And(/^I Should See That I (Can|Cannot) Add External Training$/i) do |ability|
  if ability == "Can"
    VerifyAnElementExistByXPath(LEARNING_EXTTRAINING_ADD_BUTTON_ID,'External Training')
  else
    VerifyAnElementNotExist("xpath", LEARNING_EXTTRAINING_ADD_BUTTON_ID)
  end
end


Given(/^That External Training Is Enabled For Users$/i) do
  steps %{
         Given I Have Logged In as a Learning Admin
         And   I go to Admin Settings
         When  I Go To External Training under Learning section
         And   I Enable The External Training For Users
         And   I Should Be Able To Save The Configuration Successfully
  }
end


And(/^I Add An External Training$/i) do
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEARNING_EXTTRAINING_ADD_BUTTON_ID))
  Sleep_Until(WaitForAnElementByIdAndTouch(LEARNING_EXTTRAINING_SEARCH_BUTTON_ID))

  #saving window handle
  @old_win = $driver.window_handle

  #switching to external training frame
  $driver.switch_to.frame $driver.find_element(:xpath, LEARNING_EXTTRAINING_MODAL_ID)
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEARNING_EXTTRAINING_COURSE_SELECT_ID))
end


Then(/^I Should See That I Can Successfully Submit My Course Request$/i) do
  #switching back to main window
  $driver.switch_to.window(@old_win)

  Sleep_Until(WaitForAnElementByIdAndTouch(LEARNING_EXTTRAINING_COURSE_SUBMIT_ID))
  PressEnterConfirm()
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LEARNING_EXTTRAINING_ADD_SUCCESSFUL_VALUE))
end







