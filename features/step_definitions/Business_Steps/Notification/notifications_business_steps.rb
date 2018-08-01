class RuntimeErrorException < Exception;
end


Then(/^I Should Receive A Notification With Trigger Named (.*) For Recipient (.*)$/i) do |notification_trigger_id, recipient_id|
  @notification_list = $daos.get_notification_by_trigger_id_and_recipient_name(notification_trigger_id, recipient_id)
   if !@notification_list.nil?
      puts COLOR_BLUE + "Notification found in the database"
      puts COLOR_BLUE + "LOG ID: " + @notification_list[:id].to_s
      puts COLOR_BLUE + "Trigger name: " + @notification_list[:trigger_id].to_s
      puts COLOR_BLUE + "Recipient list: " + @notification_list[:recipients].to_s
      puts COLOR_BLUE + "EPMS table Log Status: " + @notification_list[:EPMS_LOG_STATUS].to_s
      puts COLOR_BLUE + "Notification Schedule table Log Status: " + @notification_list[:SCHEDULE_STATUS].to_s
      puts COLOR_BLUE + "Created on: " + @notification_list[:CREATED].to_s
      puts COLOR_BLUE + "Sent on: " + @notification_list[:FIRED].to_s
      puts COLOR_BLUE + "Subject: " + @notification_list[:SUBJECT].to_s
      puts COLOR_BLUE + "Body:\n"
      puts @notification_list[:body].to_s
   
    else
      puts COLOR_YELLOW + "Notification not found. Please check the database manually".upcase
      skip_this_scenario
    end
end


