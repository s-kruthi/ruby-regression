
def SearchTheTemplateToBeAssigned(search_field_id, value)
  WaitForAnElementByIdAndInputValue(search_field_id, value)
  sleep(1)
  WaitForAnElementByXpathAndTouch( "//button[@title='Search']")
end

def AssignTheTemplate(action_button_path,assign_button_path)
  WaitForAnElementByXpathAndTouch(action_button_path)
  sleep(1)
  WaitForAnElementByXpathAndTouch(assign_button_path)
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
  sleep(5)
end

def GrabThePathIDForAssignedUser(existing_assignment_path,view_button_path, view_btn_index)
  WaitForAnElementByXpathAndTouch(existing_assignment_path)
  sleep(3)
  WaitForAnElementByXpathAndTouchTheIndex(view_button_path, view_btn_index)
  sleep(2)
  path_url = $driver.current_url
  path_id = path_url.split('/')[-1]
  $current_path_id = "/#{path_id}"
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_assigned.sql', "use pmsdev_tmsfull ; \n select*from epms_user where email='REBECCA.AARON@elmodemo.com' and first_name='DontTouchAutomationUser' and is_notified='1' \\G; \n select*from epms_log_message where subject like 'Document Assigned' or subject like 'Document Due' \\G; \n select*from epms_notifier_notification where trigger_id= 'Document.DocumentAssignedTrigger' and trigger_id= 'Document.DocumentDueTrigger' or path_id='#{$current_path_id}' \\G;")
end

def DeleteTheExistingAssignedDocumentsForUser(dropdown,index_value)
 until  $driver.find_element(:class, "pagination-count").text == "No records found" do
  sleep(1)
  WaitForDropdownByClassAndTouchTheIndex(dropdown,index_value)
  sleep(1)
  WaitForAnElementByClassAndTouch("delete-action")
  sleep(1)
  PressEnterConfirm()
  sleep(4)
 end
end

class NotificationException < Exception;
end
class TunnelException < Exception;
end
def ConnectToDatabaseAndValidateTheDocumentAssignedNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/document_assigned.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("is_notified: 1") #true validate
    trs = result.include?  ("subject: Document Assigned") #true validate
    krs = result.include?  ("subject: Document Due") #true validate
    prs = result.include?  ("trigger_id: Document.DocumentAssignedTrigger") #true validate
    mrs = result.include?  ("trigger_id: Document.DocumentDueTrigger") #true validate
    if frs && trs && krs && prs && mrs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end

def GoToTheParticularAssignedDocument()
  sleep(1)
  WaitForAnElementByXpathAndTouch("//a[@href='/documents/view#{$current_path_id}']")
  sleep(2)
end

def FillAndSubmitTheAssignedTemplate(street_no_id,street_no_value,street_id,street_value,suburb_id,suburb_value,state_id,state_value,postcode_id,postcode_value,date_picker,today_date,submit_approval)
  WaitForAnElementByIdAndInputValue(street_no_id,street_no_value)
  WaitForAnElementByIdAndInputValue(street_id,street_value)
  WaitForAnElementByIdAndInputValue(suburb_id,suburb_value)
  WaitForAnElementByIdAndInputValue(state_id,state_value)
  WaitForAnElementByIdAndInputValue(postcode_id,postcode_value)
  WaitForAnElementByIdAndTouch(date_picker)
  WaitForDropdownByClassAndTouchTheIndex(today_date, 2)
  WaitForAnElementByXpathAndTouch(submit_approval)
end

def ConfirmAndCompleteDocument(enter_message_id, doc_comp_message, document_complete)
  sleep(1)
  WaitForAnElementByIdAndInputValue(enter_message_id, doc_comp_message)
  WaitForAnElementByXpathAndTouch(document_complete)
  sleep(1)
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_awaiting_approval.sql', "use pmsdev_tmsfull ; \n select*from epms_user where email='REBECCA.AARON@elmodemo.com' and first_name='DontTouchAutomationUser' and is_notified='1' \\G; \n select*from epms_log_message where subject like 'Document Awaiting Approval' and recipient_ids like '/3472/' \\G; \n select*from epms_notifier_notification where trigger_id= 'Document.DocumentSubmittedTrigger' and path_id='#{$current_path_id}' \\G;")
end

def ConnectToDatabaseAndValidateTheDocumentAwaitingNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/document_awaiting_approval.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("is_notified: 1") #true validate
    trs = result.include?  ("subject: Document Awaiting Approval") #true validate
    krs = result.include?  ("recipient_ids: /3472/") #true validate
    prs = result.include?  ("trigger_id: Document.DocumentSubmittedTrigger") #true validate
    if frs && trs && krs && prs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end

def GoToTheAwaitingApprovalSectionAndApproveTheDocument(doc_approval_path, doc_approve_button, enter_approval_message_id, approved_message, confirm_approval)
  sleep(1)
  WaitForAnElementByXpathAndTouch(doc_approval_path)
  sleep(4)
  WaitForAnElementByXpathAndTouch("//a[@href='/documents/view#{$current_path_id}']")
  sleep(3)
  WaitForAnElementByXpathAndTouch(doc_approve_button)
  sleep(1)
  WaitForAnElementByIdAndInputValue(enter_approval_message_id, approved_message)
  WaitForAnElementByXpathAndTouch(confirm_approval)
  sleep(3)
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_approved.sql', "use pmsdev_tmsfull ; \n select*from epms_user where email='REBECCA.AARON@elmodemo.com' and first_name='DontTouchAutomationUser' and is_notified='1' \\G; \n select*from epms_log_message where subject like 'Document Approved' and recipient_ids like '/3472/' \\G; \n select*from epms_notifier_notification where trigger_id= 'Document.DocumentApprovedTrigger' and path_id='#{$current_path_id}' \\G;")
end

def ConnectToDatabaseAndValidateTheDocumentApprovedNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/document_approved.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("is_notified: 1") #true validate
    trs = result.include?  ("subject: Document Approved") #true validate
    krs = result.include?  ("recipient_ids: /3472/") #true validate
    prs = result.include?  ("trigger_id: Document.DocumentApprovedTrigger") #true validate
    if frs && trs && krs && prs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end

def GoToTheAwaitingApprovalSectionAndRejectTheDocument(doc_approval_path, doc_reject_button, enter_rejection_message_id, approved_message, confirm_reject)
  sleep(1)
  WaitForAnElementByXpathAndTouch(doc_approval_path)
  sleep(4)
  WaitForAnElementByXpathAndTouch("//a[@href='/documents/view#{$current_path_id}']")
  sleep(3)
  WaitForAnElementByXpathAndTouch(doc_reject_button)
  sleep(1)
  WaitForAnElementByIdAndInputValue(enter_rejection_message_id, approved_message)
  WaitForAnElementByXpathAndTouch(confirm_reject)
  sleep(3)
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/document_rejected.sql', "use pmsdev_tmsfull ; \n select*from epms_user where email='REBECCA.AARON@elmodemo.com' and first_name='DontTouchAutomationUser' and is_notified='1' \\G; \n select*from epms_log_message where subject like 'Document Rejected' and recipient_ids like '/3472/' \\G; \n select*from epms_notifier_notification where trigger_id= 'Document.DocumentRejectedTrigger' and path_id='#{$current_path_id}' \\G;")
end

def ConnectToDatabaseAndValidateTheDocumentRejectedNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/document_rejected.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("is_notified: 1") #true validate
    trs = result.include?  ("subject: Document Rejected") #true validate
    krs = result.include?  ("recipient_ids: /3472/") #true validate
    prs = result.include?  ("trigger_id: Document.DocumentRejectedTrigger") #true validate
    if frs && trs && krs && prs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR pmsdev_tmsfull -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end