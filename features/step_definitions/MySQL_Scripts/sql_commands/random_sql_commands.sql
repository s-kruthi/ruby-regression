use pmsdev_tmsfull ; 

      select first_name from epms_user where username='admin.shanku' ORDER BY id desc LIMIT 1 \G; 

    select id as course_id from mdl_course where fullname='course_section_automation_QuizActivity_shanku' ORDER BY id desc\G; 
