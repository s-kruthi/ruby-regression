use pmsdev_xerxes ; 

  select*from epms_log_message where subject like 'Document Awaiting Approval' and recipient_ids like '/131/' ORDER BY id desc LIMIT 1\G; 

  select*from epms_notifier_notification where trigger_id= 'Document.DocumentSubmittedTrigger' and path_id='/37' ORDER BY id desc LIMIT 1\G;