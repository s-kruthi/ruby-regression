#require 'rubygems'
require 'active_record'
#require 'touch_action/selenium-webdriver'
#require 'secure_random'
require 'waitutil'
require 'selenium-webdriver'
require 'pry'
require 'rest-client'
require 'ruby-jmeter'
require 'sequel'
require 'net/ssh/gateway'

require './features/lib/device_method_factory.rb'

if ENV["CHANNEL"] == nil
  ENV['CHANNEL'] = 'chrome' #Edit this when using RubyMine needs to run against specific browser
else
  puts "CHANNEL = " + ENV["CHANNEL"]
end

WAIT_TIMEOUT = 5
World(DeviceMethodFactory.for_channel(ENV['CHANNEL']))


HOST      = 'secure.elmodev.com'
SSH_USER  = 'tester'
DB_HOST   = "basic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com"
PWD = "Muraf3cAR"




gateway = Net::SSH::Gateway.new(HOST, SSH_USER, :password => PWD)
port = gateway.open(DB_HOST,3306,3306)



  db = Sequel.connect(:adapter => 'mysql2', :host => '127.0.0.1',:port => port, :user => 'tester', :password => PWD, :database => 'pmsdev_tmsfull')
  puts db['select id from epms_placeholder'].count


gateway.close(port)

