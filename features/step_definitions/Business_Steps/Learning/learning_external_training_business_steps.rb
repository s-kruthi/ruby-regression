And(/^I (Enable|Disable) The External Training For Users$/i) do |action|
   #if true then enabled else disabled $driver.find_element(:id, "elmo_learningbundle_external_training_enabled").selected?
  check_toggle = $driver.find_element(:id, "elmo_learningbundle_external_training_enabled").selected?
  if check_toggle == true
    puts "enabled"
    check_toggle = "Enable"
  else
    puts "disabled"
    check_toggle = "Disable"
  end

  element_id = 'elmo_learningbundle_external_training_enabled'

  if action != check_toggle
    $driver.execute_script("$(#{element_id}).each(function() { var $this=$(this)\;{ $this.parent().trigger('click') } })")
    puts "here"
  end
  #library disabled -> $driver.find_element(:id, 'elmo_learningbundle_external_training_libraryOnly').selected? == false

   # ext training enabled my learning has add ext training button else not there
   # $driver.find_element(:xpath,
  if action == "Enable"
   steps %{ Then I Should See That The Configuration Fields Gets Unlocked }
  elsif action == "Disable"
    steps %{ Then I Should See That The Configuration Fields Gets Locked }
  end
end


Then(/^I Should See That The Configuration Fields Gets (Unlocked|Locked)$/i) do |field_ability|
  CheckFields(field_ability)
end


And(/^I Enable The ([\w\s]+) Field$/i) do |field_name|

end


And(/^I Set The ([\w\s]+) Field As (Optional|Required)$/i) do |field_name, field_need|

end


Then(/^I Should Be Able To Save The Configuration Successfully$/i) do
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, EXTERNAL_TRAINING_CONFIG_SAVE_SUCCESSFUL_VALUE))
end



