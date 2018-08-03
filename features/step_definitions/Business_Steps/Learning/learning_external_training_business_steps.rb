And(/^I (Enable|Disable) The External Training For Users$/i) do |action|
  SetTrainingSetting(action)

  if action == "Enable"
    steps %{ Then I Should See That The Configuration Fields Gets Unlocked }
  elsif action == "Disable"
    steps %{ Then I Should See That The Configuration Fields Gets Locked }
  end
end


Then(/^I Should See That The Configuration Fields Gets (Unlocked|Locked)$/i) do |field_ability|
  CheckConfigFields(field_ability)
end


And(/^I (Enable|Disable) The ([\w\s]+) Field$/i) do |setting, field_name|
  #check enabled/disabled then click
  CheckAndEnable(field_name,setting)
end


And(/^I Set The ([\w\s]+) Field As (Optional|Required)$/i) do |field_name, field_need|
  #check enabled/disabled then click
  CheckAndSet(field_name, field_need)
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
         Then  I Have Logged Out
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

  #switching back to main window
  $driver.switch_to.window(@old_win)
end


Then(/^I Should See That I Can Successfully Submit My Course Request$/i) do
  Sleep_Until(WaitForAnElementByIdAndTouch(LEARNING_EXTTRAINING_COURSE_SUBMIT_ID))
  PressEnterConfirm()
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LEARNING_EXTTRAINING_ADD_SUCCESSFUL_VALUE))
end


Given(/^That ([\w\s]+) Is (Disabled|Enabled) For External Training$/i) do |field_name, setting|
  if setting == 'Enabled'
    action = 'Enable'
  else
    action = 'Disable'
  end
  steps %{
    Given I Have Logged In as a Learning Admin
    And   I go to Admin Settings
    When  I Go To External Training under Learning section
    And   I Enable The External Training For Users
    And   I #{action} The #{field_name} Field
    And   I Should Be Able To Save The Configuration Successfully
    Then  I Have Logged Out
  }
end



And(/^I Can Add My Own External Training Course Name$/i) do
  Sleep_Until(WaitForAnElementByXpathAndTouch(LEARNING_EXTTRAINING_ADD_BUTTON_ID))
  expect($driver.find_element(:id, LEARNING_EXTTRAINING_COURSE_NAME_ID).enabled?).to eq(true)
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEARNING_EXTTRAINING_COURSE_NAME_ID, LEARNING_EXTTRAINING_COURSE_NAME))
end


Then(/^I Should See That The ([\w\s]+) Field Is(\s+?|\sNot\s)Displayed$/i) do |field_name, ability|
  CheckFieldDisplayed(field_name,ability)
end













