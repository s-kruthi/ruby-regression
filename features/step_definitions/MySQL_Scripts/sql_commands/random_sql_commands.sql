use pmsdev_tmsfull ; 

      select COUNT(*) from epms_lms_course_enrolment where course_id ='123' order by id DESC LIMIT 10\G; 
