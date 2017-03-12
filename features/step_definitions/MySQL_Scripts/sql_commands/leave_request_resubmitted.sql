use pmsdev_staging4 ;

select*from epms_log_message where subject = "Leave Request Re-Submission" order by id desc LIMIT 1 \G;

select*from epms_notifier_notification where trigger_id='Leave.LeaveRequestReSubmissionTrigger' and user_id=709 order by id desc LIMIT 1 \G;

select*from epms_leave_request where user_id="709" and status="1" order by id desc LIMIT 1 \G;
