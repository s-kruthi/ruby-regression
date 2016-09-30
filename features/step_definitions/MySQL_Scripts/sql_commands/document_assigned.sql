use pmsdev_tmsfull ; 
 select*from epms_user where email='REBECCA.AARON@elmodemo.com' and first_name='REBECCA' and is_notified='1' \G; 
 select*from epms_log_message where subject like 'Document Assigned' or subject like 'Document Due' \G; 
 select*from epms_notifier_notification where trigger_id= 'Document.DocumentAssignedTrigger' and trigger_id= 'Document.DocumentDueTrigger' or path_id='/95' \G;