--  "\G" helps in outputting the sql query in vertical formal when its dumped into the text file

use pmsdev_tmsfull ;

select*from epms_user where email='REBECCA.AARON@elmodemo.com' and first_name='REBECCA' and is_notified="1" \G;

select*from epms_notifier_notification where trigger_id='User.PasswordChangedTrigger' And path_id='/3472' \G;

select*from epms_log_message WHERE subject="Password Change" \G;
