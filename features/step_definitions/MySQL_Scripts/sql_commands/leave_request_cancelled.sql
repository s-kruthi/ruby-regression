use pmsdev_staging4 ; 

  select*from epms_log_message where subject='Leave Request Cancelled by Requester' order by id desc LIMIT 1 \G; 

  select*from epms_notifier_notification where trigger_id='Leave.LeaveRequestRequesterCancellationTrigger' and user_id=177 order by id desc LIMIT 1 \G; 

  select*from epms_leave_request where user_id=177 and status=7 and id= order by id desc \G;