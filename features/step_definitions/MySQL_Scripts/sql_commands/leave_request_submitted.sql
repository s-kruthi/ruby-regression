use pmsdev_staging4 ; 

select*from epms_user where email='dtrump@us-president.com' and first_name='Donald' and is_notified='1' \G; 

select*from epms_leave_request where user_id ='709' and id = 163 order by id desc \G; 

select*from epms_log_message where subject like 'New Leave Request Submission' or subject like 'Leave Request Approval Action Reminder' order by id desc LIMIT 2 \G; 

select*from epms_notifier_notification where trigger_id= 'Leave.LeaveRequestSubmissionTrigger' or trigger_id='Leave.LeaveRequestApprovalReminderTrigger' order by id desc LIMIT 2 \G;