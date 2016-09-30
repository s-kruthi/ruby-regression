use pmsdev_tmsfull ; 
 select*from epms_user where email='REBECCA.AARON@elmodemo.com' and first_name='REBECCA' and is_notified='1' \G; 
 select*from epms_log_message where subject like 'Document Rejected' and recipient_ids like '/3472/' \G; 
 select*from epms_notifier_notification where trigger_id= 'Document.DocumentRejectedTrigger' and path_id='/89' \G;