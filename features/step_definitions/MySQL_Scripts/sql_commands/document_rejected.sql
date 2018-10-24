use pmsdev_xerxes ; 

  select*from epms_log_message where subject like 'Document Rejected' and recipient_ids like '/98/' ORDER BY id desc LIMIT 1\G; 

  select*from epms_notifier_notification where trigger_id= 'Document.DocumentRejectedTrigger' and path_id='/42' ORDER BY id desc LIMIT 1\G;