use pmsdev_staging4 ;

select*from epms_log_message where subject='leave approved' order by id desc LIMIT 1 \G;

select*from epms_notifier_notification where trigger_id='Leave.LeaveRequestApprovalTrigger' and user_id=709 order by id desc LIMIT 1 \G;

select*from epms_leave_request where user_id=709 and status=4 order by id desc LIMIT 1 \G;