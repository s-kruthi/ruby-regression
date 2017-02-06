open('./signup_data.csv', 'w') do |f|
    i = 0
    loop do
        i += 1
        
        f.puts " #{i}shankuloadtestdata@loadtest.com"
        
        break if i >= 7        # you can have as many users you want by specifying the no.
        
    end
end

#you need to run this file before executing #signup_job.jmx or any user creation related tests as this function
# adds the user to the csv file.