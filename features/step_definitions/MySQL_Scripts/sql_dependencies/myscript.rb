  def StartTheTunnel()
    %x(chmod 755 features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.sh) #change modify user permission to execute bash script
    puts "modified permissions"
    tunnel = %x(./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.sh) #starts ssh tunneling
    if tunnel.include? "Address already in use"
      raise TunnelException.new("SSH Tunneling Failure, Port already in use\n please execute this TC again")
    else
      puts "SSH Tunneling Established for local Run"
    end
    sleep(1)
  end

  def StartTunnelIfRequired()
    if ENV['MYMAC']
      StartTheTunnel()
    else
      puts "Remote run ! Tunneling Not required"
    end
  end

  def SecurePasswordConnectToDatabase()
    #grabs password and store it in file and delete's upon completion of test
    $DB_PWD_new =   %x(echo $DB_PWD).gsub(/[$]/,'/$/').gsub(/[>]/,'/>/').gsub(/\//, '\\').strip
    File.write('./features/step_definitions/Test_Data/stored_ids.rb', "$DB_PWD = '#{$DB_PWD_new}'")
    load('./features/step_definitions/Test_Data/stored_ids.rb')
  end

  def ConnectToEnvironment()
    #toggles between local and remote AWS based on ENV variable, and connects to DB
      if ENV['MYMAC']
        @db_result = %x(mysql -utester -p#{$DB_PWD} #{TMSFULL_DATABASE} -h127.0.0.1 --port 33060 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
      else
        puts "connecting DB on remote machine"
        @db_result = %x(mysql -utester -p#{$DB_PWD} #{TMSFULL_DATABASE} -hbasic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com --port 3306 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
      end
  end
  def ResetTheEnvironment()
    #toggles between local and remote AWS based on ENV variable, and resets certain DB tables
  if ENV['MYMAC']
    %x(mysql -utester -p#{$DB_PWD} #{TMSFULL_DATABASE} -h127.0.0.1 --port 33060 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
  else
    %x(mysql -utester -p#{$DB_PWD} #{TMSFULL_DATABASE} -hbasic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com --port 3306 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    File.write('./features/step_definitions/Test_Data/stored_ids.rb', '')
  end
  if  %x(lsof -t -i :33060).length > 0
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`)
  else
    puts ""
  end
  end