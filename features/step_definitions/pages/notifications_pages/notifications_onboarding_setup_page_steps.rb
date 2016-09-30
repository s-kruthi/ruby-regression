
def SelectNotifyUserOptionAndChangeThePassword(notify_id,change_password)
  WaitForAnElementByIdAndTouch(notify_id)
  WaitForAnElementByIdAndTouch(change_password)
  sleep(3)
end

class NotificationException < Exception;
end
class TunnelException < Exception;
end

def ConnectToDatabaseAndValidateTheChangePasswordTriggeredNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR pmsdev_staging1 -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/password_change.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("is_notified: 1") #true validate
    trs = result.include?  ("subject: Password Change") #true validate
    prs = result.include?  ("trigger_id: User.PasswordChangedTrigger") #true validate
    if frs && trs && prs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR pmsdev_staging1 -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end

def SelectResetPasswordButton(reset_button_path)
  WaitForAnElementByXpathAndTouch(reset_button_path)
end
def SelectForgotPasswordLink(forgot_password_path)
  WaitForAnElementByXpathAndTouch(forgot_password_path)
  sleep(1)
end

def ConnectToDatabaseAndValidateTheForgotPasswordTriggeredNotifications()
  StartTheTunnel()
  begin
    result = %x(mysql -utester -pMuraf3cAR pmsdev_staging1 -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/password_forgot.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("is_notified: 1") #true validate
    trs = result.include?  ("subject: Forgot Username or Password") #true validate
    prs = result.include?  ("trigger_id: User.ForgotUsernamePasswordTrigger") #true validate
    if frs && trs && prs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  rescue
    puts "not valid"

  ensure
   %x(mysql -utester -pMuraf3cAR pmsdev_staging1 -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    $driver.quit
  end
end