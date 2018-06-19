
if File.file?("#{ARGV[0]}_oauth_secrets.csv")
puts "you are already registered"

else
File.open("#{ARGV[0]}_oauth_secrets.csv", 'w+')

puts "Registration in progress ...."

end