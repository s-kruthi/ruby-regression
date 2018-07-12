use pmsdev_tmsfull ; 

      select id,manager_id,identifier from epms_user where username='X1242341' ORDER BY id desc LIMIT 1\G; 
