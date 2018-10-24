use pmsdev_xerxes ; 

  select*from epms_log_message where subject like 'Document Approved' and recipient_ids like '/98/' ORDER BY id desc LIMIT 1\G; 

  select*from epms_notifier_notification where trigger_id= 'Document.DocumentApprovedTrigger' and path_id='/36' ORDER BY id desc LIMIT 1\G;