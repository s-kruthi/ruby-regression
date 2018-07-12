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

  def ConnectToEnvironment(server_db, sql_file,stored_file)
    #toggles between local and remote AWS based on ENV variable, and connects to DB
      if ENV['MYMAC']
        @db_result = %x(mysql -utester -p#{$DB_PWD} #{server_db} -h127.0.0.1 --port 33060 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/#{sql_file} | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/#{stored_file}) # connect to DB -> run SQL -> save & store it in text file
      else
        puts "connecting DB on remote machine"
        @db_result = %x(mysql -utester -p#{$DB_PWD} #{server_db} -hbasic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com --port 3306 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/#{sql_file} | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/#{stored_file}) # connect to DB -> run SQL -> save & store it in text file
      end
  end
  def ResetTheEnvironment(server_db)
    #toggles between local and remote AWS based on ENV variable, and resets certain DB tables
  if ENV['MYMAC']
    %x(mysql -utester -p#{$DB_PWD} #{server_db} -h127.0.0.1 --port 33060 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
  else
    %x(mysql -utester -p#{$DB_PWD} #{server_db} -hbasic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com --port 3306 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    File.write('./features/step_definitions/Test_Data/stored_ids.rb', '')
  end
  if  %x(lsof -t -i :33060).length > 0
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`)
  else
    puts ""
  end
  end

  def ConnectToExecuteMultipleQueries(server_db, sql_file,stored_file)
    #toggles between local and remote AWS based on ENV variable, and connects to DB
    if ENV['MYMAC']
      @db_result = %x(mysql -utester -p#{$DB_PWD} #{server_db} -h127.0.0.1 --port 33060 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/#{sql_file} | tee -a ./features/step_definitions/MySQL_Scripts/sql_dependencies/#{stored_file}) # connect to DB -> run SQL -> save & store it in text file
    else
      puts "connecting DB on remote machine"
      @db_result = %x(mysql -utester -p#{$DB_PWD} #{server_db} -hbasic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com --port 3306 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/#{sql_file} | tee -a ./features/step_definitions/MySQL_Scripts/sql_dependencies/#{stored_file}) # connect to DB -> run SQL -> save & store it in text file
    end
  end

  def SearchDatabaseForASpecificData(database, sql_query,random_file_name)
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/random_sql_commands.sql', "use #{database} ; \n
      #{sql_query}\\G; \n")
    begin
      ConnectToExecuteMultipleQueries(database,'random_sql_commands.sql','random_sql_script.txt')
      $user_data = Hash.new
      File.readlines("features/step_definitions/MySQL_Scripts/sql_dependencies/random_sql_script.txt").each do |line|
        var,val = line.chomp.split(" ")
        $user_data[var] = val
      end
      $user_data

      content = ["\n", $user_data].join("\n").gsub(/=>/, ":")
      File.new("./features/step_definitions/MySQL_Scripts/sql_dependencies/json_data_storage/#{random_file_name}.json", "w")
      File.write("./features/step_definitions/MySQL_Scripts/sql_dependencies/json_data_storage/#{random_file_name}.json", content, mode: 'a')
      load("./features/step_definitions/MySQL_Scripts/sql_dependencies/json_data_storage/#{random_file_name}.json")

      require 'json'
      file = File.read("./features/step_definitions/MySQL_Scripts/sql_dependencies/json_data_storage/#{random_file_name}.json")
      $data_hash = JSON.parse(file)
      $data_hash.keys
    ensure
      ResetTheEnvironment(database)
    end
  end

