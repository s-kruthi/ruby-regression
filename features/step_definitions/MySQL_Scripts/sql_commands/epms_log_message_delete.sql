
use pmsdev_staging4 ;

delete from epms_log_message where subject like '%Password Change%' or subject like '%Forgot Username or Password%' or subject like '%Document Assigned%'
or subject like '%Document Due%' or subject like '%Document Awaiting Approval%' or subject like '%Document Approved%' or subject like '%Document Rejected%'
or subject like '%New Leave Request Submission%' or subject like '%Leave Request Approval Action Reminder%' or subject like '%Leave Request Cancelled by Requester%'
or subject like '%Leave Request Cancelled by Approver%' or subject like '%Leave Rejection Notification%' or subject like '%Leave Request Re-Submission%';