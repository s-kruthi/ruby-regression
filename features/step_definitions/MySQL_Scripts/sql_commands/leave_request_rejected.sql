use pmsdev_staging4 ; 

 select*from epms_log_message where subject='Leave Rejection Notification' order by id desc LIMIT 1 \G; 

 select*from epms_notifier_notification where trigger_id='Leave.LeaveRequestRejectTrigger' and user_id=709 order by id desc LIMIT 1 \G; 

 select*from epms_leave_request_workflow where user_id='659' and status='3' and request_id='198' order by id desc \G;