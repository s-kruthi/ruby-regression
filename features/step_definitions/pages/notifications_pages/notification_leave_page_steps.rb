def ClickNewRequestButtonAndGoToLeaveApplyPage()
  WaitForAnElementByXpathAndTouch("//a[@href='/dashboard/leave/leave-request']")
  sleep(3)
end

def SelectLeaveType(leave_type_dropdown,leave_type_class,leave_type_value)
  WaitForAnElementByClassAndTouch(leave_type_dropdown)
  WaitForDropdownByClassAndTouchTheIndex(leave_type_class,leave_type_value)
  sleep(2)
end
def SelectStartDate(start_date)
  $driver.find_element(:css, 'input[ng-model="data.leaveRequest.startDate"]').clear
  $driver.find_element(:css, 'input[ng-model="data.leaveRequest.startDate"]').send_keys "#{start_date}"
  sleep(1)
end
def SelectEndDate(end_date)
  $driver.find_element(:css, 'input[ng-model="data.leaveRequest.endDate"]').clear
  $driver.find_element(:css, 'input[ng-model="data.leaveRequest.endDate"]').send_keys "#{end_date}"
  sleep(2)
end
def ModifyLeaveHours(modify_hrs)
  $driver.find_element(:css, 'input[ng-model="data.leaveRequest.totalHours"]').clear
  $driver.find_element(:css, 'input[ng-model="data.leaveRequest.totalHours"]').send_keys "#{modify_hrs}"
  sleep(1)
end
def AddComment(add_comment)
  $driver.find_element(:css, 'textarea[ng-model="data.leaveRequest.comment"]').send_keys "#{add_comment}"
  sleep(1)
end
def SubmitLeaveRequest()
  $driver.find_element(:css, 'button[ng-click="postLeaveRequest()"]').click
  sleep(3)
  path_url = $driver.current_url
  path_id = path_url.split('/')[-1]
  $current_path_id = "#{path_id}"
  puts $current_path_id
  #put the current_path_id at the end in the SQL query under document_assigned.sql file by following below method
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/leave_request_submitted.sql', "use #{STAGING_DATABASE} ; \n
select*from epms_user where email='dtrump@us-president.com' and first_name='Donald' and is_notified='1' \\G; \n
select*from epms_leave_request where user_id ='709' and id = #{$current_path_id} order by id desc \\G; \n
select*from epms_log_message where subject like 'New Leave Request Submission' or subject like 'Leave Request Approval Action Reminder' order by id desc LIMIT 2 \\G; \n
select*from epms_notifier_notification where trigger_id= 'Leave.LeaveRequestSubmissionTrigger' or trigger_id='Leave.LeaveRequestApprovalReminderTrigger' order by id desc LIMIT 2 \\G;")
end

def ConnectToDatabaseAndValidateTheLeaveRequestNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR #{STAGING_DATABASE} -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/leave_request_submitted.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("recipient_ids: /709/659/") #true validate that mail goes to both employee and manager
    trs = result.include?  ("subject: New Leave Request Submission") #true validate
    krs = result.include?  ("subject: Leave Request Approval Action Reminder") #true validate
    mrs = result.include?  ("trigger_id: Leave.LeaveRequestApprovalReminderTrigger") #true validate
    prs = result.include?  ("trigger_id: Leave.LeaveRequestSubmissionTrigger") #true validate
    qrs = result.include?  ("id: #{$current_path_id}")
    if frs && trs && krs && mrs && prs && qrs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR #{STAGING_DATABASE} -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end

def CancelTheLeaveRequestPendingForApproval(dropdown_toggle, position,cancellation_reason)
  WaitForDropdownByClassAndTouchTheIndex(dropdown_toggle,position)
  EnterCommentAndCancelTheRequest(cancellation_reason)
end
def EnterCommentAndCancelTheRequest(cancellation_reason)
  $driver.find_element(:css, 'a[ng-click="lr.openLeaveRequestCancellation(request)"]').click
  sleep(2)
  $driver.find_element(:css, 'textarea[ng-model="data.cancellation.comment"]').send_keys "#{cancellation_reason}"
  $driver.find_element(:css, 'button[ng-click="postLeaveRequestCancellation()"]').click
  sleep(1)
  #dump the constructed SQL query into leave_request_submitted.sql file
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/leave_request_cancelled.sql', "use #{STAGING_DATABASE} ; \n
  select*from epms_log_message where subject='Leave Request Cancelled by Requester' order by id desc LIMIT 1 \\G; \n
  select*from epms_notifier_notification where trigger_id='Leave.LeaveRequestRequesterCancellationTrigger' and user_id=709 order by id desc LIMIT 1 \\G; \n
  select*from epms_leave_request where user_id=709 and status=7 and id=#{$current_path_id} order by id desc \\G;")
end

def ConnectToDatabaseAndValidateTheLeaveRequestCancelledNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR #{STAGING_DATABASE} -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/leave_request_cancelled.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("status: 7") #true validate for cancelled status
    krs = result.include?  ("user_id: 709") #true validate for employee cancelled the leave
    trs = result.include?  ("subject: Leave Request Cancelled by Requester") #true validate
    mrs = result.include?  ("trigger_id: Leave.LeaveRequestRequesterCancellationTrigger") #true validate
    qrs = result.include?  ("id: #{$current_path_id}")
    if frs && krs && trs  && mrs && qrs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR #{STAGING_DATABASE} -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end

def GoToApprovalRequestPage()
  $driver.find_element(:css, 'li[ng-show="lr.data.leaveManagementInfo.totalApprovalRequests > 0"]').click
  sleep(3)
  $driver.find_element(:css, 'input[ng-model="lr.data.criteria.searchText"]').send_keys "Donald Trump"
  sleep(1)
  $driver.find_element(:css, 'button[ng-click="lr.getLeaveRequests()"]').click
end

def ConnectToDatabaseAndValidateTheLeaveRequestCancelledByApproverNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR #{STAGING_DATABASE} -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/leave_request_cancelled_by_approver.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("status: 7") #true validate for cancelled status
    krs = result.include?  ("user_id: 659") #true validate for manager cancelled the request
    trs = result.include?  ("subject: Leave Request Cancelled by Approver") #true validate
    mrs = result.include?  ("trigger_id: Leave.LeaveRequestApproverCancellationTrigger") #true validate
    qrs = result.include?  ("recipient_ids: /709/659/") #true validate that mail goes to both employee and manager
    if frs && krs && trs && mrs && qrs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR #{STAGING_DATABASE} -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end

def ViewTheLeaveRequestAndRejectIt(dropdown_toggle,position,add_comment)
  WaitForDropdownByClassAndTouchTheIndex(dropdown_toggle,position)
  $driver.find_element(:css, 'button[ng-click="viewRequest({id: 1})"]').click
  sleep(4)
 # $driver.find_element(:css, 'textarea[ng-model="data.leaveRequest.comment"]').send_keys "#{add_comment}"
  $driver.find_element(:css, 'button[ng-click="rejectLeaveRequest()"]').click
end