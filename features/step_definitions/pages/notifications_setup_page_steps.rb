
def SelectNotifyUserOptionAndChangeThePassword(notify_id,change_password)
  WaitForAnElementByIdAndTouch(notify_id)
  WaitForAnElementByIdAndTouch(change_password)
  sleep(3)
end

class NotificationException < Exception;
end
class TunnelException < Exception;
end

def ConnectToDatabaseAndValidateTheTriggeredNotifications()
  begin
    %x(chmod 755 features/step_definitions/MySQL_Scripts/myscript.sh) #change modify permission to execute
    puts "modified permissions"
   tunnel = %x(./features/step_definitions/MySQL_Scripts/myscript.sh) #starts ssh tunneling
    if tunnel.include? "Address already in use"
      raise TunnelException.new("SSH Tunneling Failure, Port already in use")
    else
      puts "SSH Tunneling Established"
    end

    sleep(1)
    result = %x(mysql -utester -pMuraf3cAR pmsdev_staging1 -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/myscript.sql | tee ./features/step_definitions/MySQL_Scripts/myscript.txt) # connect to DB -> run SQL -> save it in text file
    frs = result.include?  ("is_notified: 1") #true validate
    trs = result.include?  ("subject: Reset Password") #true validate
    prs = result.include?  ("trigger_id: User.PasswordChangedTrigger") #true validate
    if frs && trs && prs
      puts "Yay! Notification has been triggered"
    else
      raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
    end

  # rescue Exception => e
  #   puts e.message
  #   puts "not valid"
  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -pMuraf3cAR pmsdev_staging1 -h127.0.0.1 --port 33060 < ./features/step_definitions/MySQL_Scripts/myscript_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
  end
end