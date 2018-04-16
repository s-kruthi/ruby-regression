require_relative 'testrail.rb'
require 'pry'

$testrail_client = TestRail::APIClient.new('https://elmotalent.testrail.net')
$testrail_client.user = 'omar.khan@elmolearning.com.au'
$testrail_client.password = 'Tester1!'

