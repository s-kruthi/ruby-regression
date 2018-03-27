# Before('@leaveManagement') do
#   $driver = Selenium::WebDriver.for :firefox, marionette: true
#   $driver.manage.all_cookies
# end

require 'net/ssh/gateway'
require 'sequel'

File.open('./features/step_definitions/Test_Data/stored_ids.rb', 'w') {|file| file.truncate(0) }


Before do |scenario|
  $tag_counts ||= {}
  scenario.tags.map(&:name).each do |tag|
    $tag_counts[tag] ||= 0
    $tag_counts[tag] += 1
  end
end

After do
  $driver.quit
end