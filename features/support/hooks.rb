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

After do | scenario |
  status_scenario = scenario.passed?
  scenario.tags.map(&:name).each do | tag |
   if (tag =~ /^\@[C]\d/)
     $testrail_tag = tag.gsub('@C','').to_s
   end
  end
  if status_scenario
    status_id = 1
  else
    status_id = 5
  end
  $testrail_client.send_post('add_result_for_case/' + ENV['test_run_id'] +'/'+ $testrail_tag,{ :status_id => status_id, :comment => "This testing API."})
  $driver.quit
end