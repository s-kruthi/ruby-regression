--  "\G" helps in outputting the sql query in vertical formal when its dumped into the text file

use pmsdev_staging1 ;

select*from epms_user where email='sunburn@corp.com.au' and first_name='sun' and is_notified="1" \G;

select*from epms_notifier_notification where trigger_id='User.ForgotUsernamePasswordTrigger' And path_id='/20519' \G;

select*from epms_log_message WHERE subject="Forgot Password" \G;