use pmsdev_tmsfull ; 

      select first_name from epms_user where username='X1242341' ORDER BY id desc LIMIT 1 \G; 

    select id as course_id from mdl_course where fullname='AssignmentRule_course_automation' ORDER BY id desc\G; 
