
 require "selenium-webdriver"
    Selenium::WebDriver::Firefox::Binary.path = "/Applications/Firefox.app/Contents/MacOS/firefox"
    $driver = Selenium::WebDriver.for :firefox, marionette: true
    $driver = Selenium::WebDriver.for:safari
    $driver.navigate.to 'https://id.atlassian.com/login?continue=https%3A%2F%2Fjira.atlassian.com%2Fsecure%2FDashboard.jspa&application=jac'
    
    begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_username = wait.until {
            element = $driver.find_element(:id, 'username')
            element if element.displayed?
        }
        select_username.send_keys "xxxxxxxx@gmail.com"
        rescue Exception => e
        puts e.message
        $driver.quit
    end

    puts " enter your password"
    secret = gets.chomp
    element = $driver.find_element(:id, 'password')
    element.send_keys "#{secret}"
    
    element = $driver.find_element(:id, 'login-submit')
    element.click
    puts $driver.title
    

#
#    begin
#        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#        select_menu = wait.until {
#            element = $driver.find_element(:id, 'create_link')
#            element if element.displayed?
#        }
#        select_menu.click
#        
#        rescue Exception => e
#        puts e.message
#        $driver.quit
#    end
#
#    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#    select_menu = wait.until {
#        element = $driver.find_element(:id, 'summary')
#        element if element.displayed?
#    }
#    select_menu.send_keys "Automation In Progress"
#    
#    element = $driver.find_element(:id, 'create-issue-submit')
#    element.click
#    
#    puts "New issue Created"
#
#
#    
#    wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#    select_menu = wait.until {
#        element = $driver.find_element(:id, 'create_link')
#        element if element.displayed?
#    }
#    select_menu.send_keys ""
#    
#    
#    
#    toast = $driver.find_elements(:xpath, '/html/body/div[1]/div/div').size == 0
#    
#
#    
#$driver.navigate.refresh
#
#element = $driver.find_element(:id, 'find_link').click
#wait = Selenium::WebDriver::Wait.new(:timeout => 15)
#select_menu = wait.until {
#
#element = $driver.find_element(:id, 'issues_new_search_link_lnk')
#element if element.displayed?
#}
#select_menu.click
#
#
#wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#select_link = wait.until {
#
# element = $driver.find_element(:link_text, 'All Issues')
# element if element.displayed?
#}
#select_link.click
#
#
#$driver.navigate.refresh
#wait = Selenium::WebDriver::Wait.new(:timeout => 10)
#
#element = wait.until {element = $driver.find_element(:id, 'summary-val').text.include? "Automation In Progress" }
#
#
##element = $driver.find_element(:id, 'summary-val').text.include? "Automation In Progress"
#
#wait = Selenium::WebDriver::Wait.new(:timeout => 15)
#select_link = wait.until {
#element = $driver.find_element(:xpath, '/html/body/div[1]/section/div[1]/div[4]/div/div/div/div/div/div[2]/div/div/header/div/header/div/div[2]/ol/li[2]/a')
#element if element.displayed?
#}
#select_link.click
#
#
##this will print the created issue no.
#puts $driver.title
#
#element = $driver.find_element(:id, 'header-details-user-fullname').click
#lelement = $driver.find_element(:id, 'log_out').click
#$driver.quit
#
#
#
#
#



    
