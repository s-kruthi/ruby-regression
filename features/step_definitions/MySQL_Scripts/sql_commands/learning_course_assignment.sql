use pmsdev_tmsfull ; 

    select*from epms_log_message where subject like 'New Enrolment' and recipient_ids like '/3472/3456/' ORDER BY id desc LIMIT 1\G; 

    select * from epms_lms_course_enrolment where course_id='982' and user_id='3472' ORDER BY id desc LIMIT 1 \G; 

    select * from epms_notifier_notification where trigger_id like 'Learning.CourseNewEnrolmentTrigger'and user_id='3472' ORDER BY id desc LIMIT 1 \G;