$VERBOSE = nil

def SearchTheTemplateToBeAssigned(search_field_id, value)
  WaitForAnElementByIdAndInputValue(search_field_id, value)
  sleep(1)
  WaitForAnElementByXpathAndTouch( "//button[@title='Search']")
  sleep(2)
end

def AssignTheTemplate(action_button_css,assign_button_path)
  WaitForAnElementByCSSAndTouch(action_button_css)
  sleep(2)
  Sleep_Until(WaitForAnElementByPartialLinkTextAndTouch(assign_button_path))
end

def AssignTemplateToAUser(search_field_id, value, checkbox_id,assign_to_slctd_usr)
  sleep(2)
  WaitForAnElementByIdAndInputValue(search_field_id, value)
  sleep(2)
  WaitForAnElementByXpathAndTouch( "//button[@title='Search']")
  sleep(2)
  WaitForAnElementByIdAndTouch(checkbox_id)
  sleep(1)
  WaitForAnElementByXpathAndTouch(assign_to_slctd_usr)
  sleep(2)
  WaitForAnElementByCSSAndTouch('button[data-action="run"]')
  sleep(7)
end

def GrabThePathIDForAssignedUser(existing_assignment_path,view_button_path, view_btn_index)
  WaitForAnElementByXpathAndTouch(existing_assignment_path)
  sleep(2)
  WaitForAnElementByXpathAndTouchTheIndex(view_button_path, view_btn_index)
  sleep(2)
  path_url = $driver.current_url
  path_id = path_url.split('/')[-1]
  $current_doc_path_id = "/#{path_id}"
  puts $current_doc_path_id
end

def DeleteTheExistingAssignedDocumentsForUser(dropdown,index_value)
 until  $driver.find_element(:class, "pagination-count").text == "No records found" do
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown,index_value)
  sleep(1)
  WaitForAnElementByCSSAndTouch('a[title="Delete Form"]')
  sleep(1)
  PressEnterConfirm()
  sleep(4)
 end
end

def ConnectToDatabaseAndValidateTheDocumentAssignedNotifications()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  #put the current_path_id at the end in the SQL query under document_assigned.sql file by following below method
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_assigned.sql', "use #{XERXES_DATABASE} ; \n
  select*from epms_log_message where subject like '%Document Assigned%' and recipient_ids ='/98/' ORDER BY id desc LIMIT 1\\G; \n
  select*from epms_log_message where subject like '%Document Due%' and recipient_ids ='/98/' ORDER BY id desc LIMIT 1\\G; \n
  select*from epms_notifier_notification where trigger_id= 'Document.DocumentAssignedTrigger' and path_id='#{$current_doc_path_id}' ORDER BY id desc LIMIT 1\\G; \n
  select*from epms_notifier_notification where trigger_id= 'Document.DocumentDueTrigger' and path_id='#{$current_doc_path_id}' ORDER BY id desc LIMIT 1\\G;")
  ConnectToEnvironment(XERXES_DATABASE,'document_assigned.sql','myscript.txt')
  begin
    a = @db_result.include?  ("subject: Document Assigned") #true validate
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?   ("subject: Document Due") #true validate
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("trigger_id: Document.DocumentAssignedTrigger") #true validate
    if c == false  then print "c is not matching \n".colorize(:red) end
    d = @db_result.include?   ("trigger_id: Document.DocumentDueTrigger") #true validate
    if d == false  then print "d is not matching \n".colorize(:red) end

    if a & b & c & d
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(XERXES_DATABASE)
  end
end

def GoToTheParticularAssignedDocument()
  sleep(2)
  WaitForAnElementByXpathAndTouch("//a[@href='/documents/view#{$current_doc_path_id}']")
  sleep(2)
end

def FillAndSubmitTheAssignedTemplate(firstname_id,firstname_value,lastname_id,lastname_value,date_picker,street_no_id,street_no_value,street_id,street_value,suburb_id,suburb_value,state_id,state_value,postcode_id,postcode_value,submit_approval)
  WaitForAnElementByIdAndInputValue(firstname_id,firstname_value)
  WaitForAnElementByIdAndInputValue(lastname_id,lastname_value)
  WaitForAnElementByIdAndInputValue(date_picker, '24/10/1989')
  WaitForAnElementByIdAndInputValue(street_no_id,street_no_value)
  WaitForAnElementByIdAndInputValue(street_id,street_value)
  WaitForAnElementByIdAndInputValue(suburb_id,suburb_value)
  WaitForAnElementByIdAndInputValue(state_id,state_value)
  WaitForAnElementByIdAndInputValue(postcode_id,postcode_value)
  WaitForAnElementByXpathAndTouch(submit_approval)
end

def ConfirmAndCompleteDocument(enter_message_id, doc_comp_message, document_complete)
  sleep(1)
  WaitForAnElementByIdAndInputValue(enter_message_id, doc_comp_message)
  WaitForAnElementByXpathAndTouch(document_complete)
  sleep(1)
end

def ConnectToDatabaseAndValidateTheDocumentAwaitingNotifications()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_awaiting_approval.sql', "use #{XERXES_DATABASE} ; \n
  select*from epms_log_message where subject like 'Document Awaiting Approval' and recipient_ids like '/131/' ORDER BY id desc LIMIT 1\\G; \n
  select*from epms_notifier_notification where trigger_id= 'Document.DocumentSubmittedTrigger' and path_id='#{$current_doc_path_id}' ORDER BY id desc LIMIT 1\\G;")
  ConnectToEnvironment(XERXES_DATABASE,'document_awaiting_approval.sql','myscript.txt')
  begin
    a = @db_result.include?  ("subject: Document Awaiting Approval") #true validate
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?   ("recipient_ids: /131/") #true validate
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("trigger_id: Document.DocumentSubmittedTrigger") #true validate
    if c == false  then print "c is not matching \n".colorize(:red) end

    if a & b & c
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(XERXES_DATABASE)
  end
end

def VerifyTheSubmittedFormIsInLockedState()
  sleep(3)
  street_no = $driver.find_element(:id, "#{STREET_NUM_ID}").attribute('disabled')
  street = $driver.find_element(:id, "#{STREET_ID}").attribute('disabled')
  suburb = $driver.find_element(:id, "#{SUBURB_ID}").attribute('disabled')
  state = $driver.find_element(:id, "#{STATE_ID}").attribute('disabled')
  postcode = $driver.find_element(:id, "#{POSTCODE_ID}").attribute('disabled')
  datepicker = $driver.find_element(:id, "#{DATE_PICKER_ID}").attribute('disabled')

  if street_no && street && suburb && state && postcode && datepicker == "true"
    puts "form template is locked"
  else
    raise NotificationException.new("ERROR...Unlocked form templates !!!!!! ")
  end
end
def GoToTheAwaitingApprovalSection(doc_approval_path)
  sleep(1)
  WaitForAnElementByXpathAndTouch(doc_approval_path)
  sleep(4)
  WaitForAnElementByXpathAndTouch("//a[@href='/documents/view#{$current_doc_path_id}']")
  # WaitForAnElementByXpathAndTouch("//a[@href='/documents/view/221']")
  sleep(1)
end
def GoToTheAwaitingApprovalSectionAndApproveTheDocument(doc_approve_button, enter_approval_message_id, approved_message, confirm_approval)
  sleep(3)
  WaitForAnElementByXpathAndTouch(doc_approve_button)
  sleep(1)
  WaitForAnElementByIdAndInputValue(enter_approval_message_id, approved_message)
  WaitForAnElementByXpathAndTouch(confirm_approval)
  sleep(3)
end

def ConnectToDatabaseAndValidateTheDocumentApprovedNotifications()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_approved.sql', "use #{XERXES_DATABASE} ; \n
  select*from epms_log_message where subject like 'Document Approved' and recipient_ids like '/98/' ORDER BY id desc LIMIT 1\\G; \n
  select*from epms_notifier_notification where trigger_id= 'Document.DocumentApprovedTrigger' and path_id='#{$current_doc_path_id}' ORDER BY id desc LIMIT 1\\G;")
  ConnectToEnvironment(XERXES_DATABASE,'document_approved.sql','myscript.txt')
  begin
    a = @db_result.include?  ("subject: Document Approved") #true validate
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?   ("recipient_ids: /98/") #true validate
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("trigger_id: Document.DocumentApprovedTrigger") #true validate
    if c == false  then print "c is not matching \n".colorize(:red) end

    if a & b & c
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(XERXES_DATABASE)
  end
end

def GoToTheAwaitingApprovalSectionAndRejectTheDocument(doc_approval_path, doc_reject_button, enter_rejection_message_id, approved_message, confirm_reject)
  sleep(1)
  WaitForAnElementByXpathAndTouch(doc_approval_path)
  sleep(4)
  WaitForAnElementByXpathAndTouch("//a[@href='/documents/view#{$current_doc_path_id}']")
  sleep(3)
  WaitForAnElementByXpathAndTouch(doc_reject_button)
  sleep(1)
  WaitForAnElementByIdAndInputValue(enter_rejection_message_id, approved_message)
  WaitForAnElementByXpathAndTouch(confirm_reject)
  sleep(3)
end

def ConnectToDatabaseAndValidateTheDocumentRejectedNotifications()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_rejected.sql', "use #{XERXES_DATABASE} ; \n
  select*from epms_log_message where subject like 'Document Rejected' and recipient_ids like '/98/' ORDER BY id desc LIMIT 1\\G; \n
  select*from epms_notifier_notification where trigger_id= 'Document.DocumentRejectedTrigger' and path_id='#{$current_doc_path_id}' ORDER BY id desc LIMIT 1\\G;")
  ConnectToEnvironment(XERXES_DATABASE,'document_rejected.sql','myscript.txt')
  begin
    a = @db_result.include?  ("subject: Document Rejected") #true validate
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?   ("recipient_ids: /98/") #true validate
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("trigger_id: Document.DocumentRejectedTrigger") #true validate
    if c == false  then print "c is not matching \n".colorize(:red) end

    if a & b & c
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(XERXES_DATABASE)
  end
end