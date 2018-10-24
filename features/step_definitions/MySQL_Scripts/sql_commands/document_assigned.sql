use pmsdev_xerxes ; 

  select*from epms_log_message where subject like '%Document Assigned%' and recipient_ids ='/98/' ORDER BY id desc LIMIT 1\G; 

  select*from epms_log_message where subject like '%Document Due%' and recipient_ids ='/98/' ORDER BY id desc LIMIT 1\G; 

  select*from epms_notifier_notification where trigger_id= 'Document.DocumentAssignedTrigger' and path_id='/31' ORDER BY id desc LIMIT 1\G; 

  select*from epms_notifier_notification where trigger_id= 'Document.DocumentDueTrigger' and path_id='/31' ORDER BY id desc LIMIT 1\G;