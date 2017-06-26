# Before('@leaveManagement') do
#   $driver = Selenium::WebDriver.for :firefox, marionette: true
#   $driver.manage.all_cookies
# end

File.open('./features/step_definitions/Test_Data/stored_ids.rb', 'w') {|file| file.truncate(0) }

