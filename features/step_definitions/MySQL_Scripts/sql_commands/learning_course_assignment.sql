use pmsdev_tmsfull ; 

     Select recipients,recipient_ids from epms_log_message where subject = 'New Enrolment' order by id DESC LIMIT 10\G; 
