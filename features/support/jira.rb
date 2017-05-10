require 'rubygems'
require 'pp'
require 'jira-ruby'

def client()

 JIRA::Client.new(options = {
     :username     => JIRA_USER,
     :password     => JIRA_PASS,
     :site         => 'https://elmolearning.atlassian.net/',
     :context_path => '',
     :auth_type    => :basic,
     :use_ssl => true
 })
end

#issue = client.Issue.find("TDC-40")

# issue.comments.each do |comment|
#   #puts comment
# end

#add a new comment
#comment = issue.comments.build
#comment.save({"body" => "New comment from shanku"})

##update first comment
#issue.comments.first.save({"body" => "New updated first comment from shanku"})

##update last comment
#issue.comments.last.save({"body" => "New updated last comment from shanku"})

##commentdelete last one
#issue.comments.last.delete

#ENTER DECRIPTION
#issue.save({"fields"=>{"description" => "#{CLIENT_CONTRACT_VALUE}"}})