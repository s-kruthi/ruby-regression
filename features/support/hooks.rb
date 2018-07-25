# Before('@leaveManagement') do
#   $driver = Selenium::WebDriver.for :firefox, marionette: true
#   $driver.manage.all_cookies
# end

require 'net/ssh/gateway'
require 'sequel'
require 'fileutils'

Before do |scenario|
  $tag_counts ||= {}
  scenario.tags.map(&:name).each do |tag|
    $tag_counts[tag] ||= 0
    $tag_counts[tag] += 1
  end
  FileUtils.rm_rf Dir.glob("./features/step_definitions/MySQL_Scripts/sql_dependencies/json_data_storage/*.*")
  File.open('./features/step_definitions/MySQL_Scripts/sql_dependencies/random_sql_script.txt', 'w') {|file| file.truncate(0) }
  File.open('./JMETER_AUTO/Jmeter_tests/Learning/learning_course_add.csv', 'w') {|file| file.truncate(0) }
end


After do | scenario |
  #Send the testcase results only if you have passed the Test Run id from the command line
  if ENV['test_run_id']
    test_run_id = ENV['test_run_id'].to_s
    status_scenario = scenario.passed?
    scenario.tags.map(&:name).each do | tag |
      if (tag =~ /^\@[C]\d/)
        $testrail_tag = tag.gsub('@C','').to_s
      end
    end
    if status_scenario
      #Status = Passed
      status_id = 1
    else
      #Status = Failed
      status_id = 5
    end
    if $testrail_tag.nil?
      puts COLOR_RED + "Couldnt update the testrun, please add the testrail id to your testcase to update TEST RESULTS"
    else
      $testrail_client.send_post('add_result_for_case/'+ test_run_id +'/'+ $testrail_tag,{ :status_id => status_id, :comment => "Testing Testrail API integration."})
    end
  end

  #screenshots incase of failure
  if scenario.failed?
    puts COLOR_BLUE + "URL: " + $driver.current_url
    $driver.save_screenshot("./features/screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
  end

  File.open('./features/step_definitions/Test_Data/stored_ids.rb', 'w') {|file| file.truncate(0) }
  File.write('./features/step_definitions/MySQL_Scripts/sql_dependencies/json_data_storage/GitIgnoreFile.txt', 'here is the text file to fix the gitignore issue', mode: 'a')
    $driver.quit
end


at_exit do
  #closing all forwarded ports and then closing the gateway's SSH session
  $gateway.shutdown!
end

