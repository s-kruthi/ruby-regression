def StartTheTunnel()
  %x(chmod 755 features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.sh) #change modify user permission to execute bash script
  puts "modified permissions"
  tunnel = %x(./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.sh) #starts ssh tunneling
  if tunnel.include? "Address already in use"
    raise TunnelException.new("SSH Tunneling Failure, Port already in use\n please execute this TC again")
  else
    puts "SSH Tunneling Established"
  end

  sleep(1)

end