require_relative 'testrail.rb'
require 'pry'

client = TestRail::APIClient.new('https://elmotalent.testrail.net')
client.user = 'omar.khan@elmolearning.com.au'
client.password = 'Tester1!'
c = client.send_get('get_case/12259')
puts c 
r = client.send_post('add_result_for_case/79/12259',{ :status_id => 1, :comment => 'This test API.'})
puts r
