use pmsdev_tmsfull ; 

    select*from epms_log_message where subject like 'Course Enrol Request Approved' and recipient_ids like '/3472/' ORDER BY id desc LIMIT 1\G; 

    select * from epms_course_enrol_request where course_id='787' ORDER BY id desc LIMIT 1 \G; 

    select * from epms_notifier_notification where trigger_id like 'Learning.CourseEnrolRequestApprovedTrigger' ORDER BY id desc LIMIT 1 \G;