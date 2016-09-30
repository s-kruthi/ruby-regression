
use pmsdev_tmsfull ;

delete from epms_log_message where subject like '%Password Change%' or subject like '%Forgot Username or Password%' or subject like '%Document Assigned%'
or subject like '%Document Due%' or subject like '%Document Awaiting Approval%' or subject like '%Document Approved%' or subject like '%Document Rejected%';