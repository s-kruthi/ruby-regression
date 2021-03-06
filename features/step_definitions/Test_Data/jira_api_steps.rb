
Given(/^I Want To Upload The Scenarios To Jira Task$/i) do

  require_relative('../../support/jira')
  issue = client.Issue.find("#{JIRA_CARD_NO}")
  Content = IO.read("#{SCENARIO_FEATURE_FILE}")
 @bingo = issue.save({"fields"=>{"description" => "#{Content}"}})
  workLog = issue.worklogs.build.save!("timeSpent" => "#{TIME_DUR}","comment" => "#{TIME_COMNT}")
end

Then(/^I Should Be Able To Successfuly Post It To The Desc$/i) do
  begin
  if @bingo == true
    puts "successfully posted"
  else
    puts "something went wrong..please check"
  end
  rescue Exception => e
    puts e.message
  ensure
    File.open('./features/support/jira_post_data.rb', 'w') {|file| file.truncate(0) }
    load ('./features/support/jira_post_data.rb')
    File.open('./features/support/jira_post_data.rb', 'w') {|file| file.puts "JIRA_USER = ''\nJIRA_PASS = ''\nJIRA_CARD_NO = ''\nSCENARIO_FEATURE_FILE = './features/tests/@@fetaurefilename'\nTIME_DUR = '1h'\nTIME_COMNT =''"}
  end

end

################################## PARAMETRIZED METHOD ####################################


  def ReturnCertificateCountForCourses(database)
    SearchDatabaseForASpecificData(database, Find_CertificateCount)
    $TotalCertificates = puts $user_data["COUNT(*):"]
  end

  def Find_CertificateCount()
    "select COUNT(*) from epms_course_certificate_template"
  end

