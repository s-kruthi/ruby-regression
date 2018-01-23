#require 'rubygems'
require 'active_record'
#require 'touch_action/selenium-webdriver'
#require 'secure_random'
require 'waitutil'
require 'selenium-webdriver'
require 'pry'
require 'rest-client'
require 'ruby-jmeter'

require './features/lib/device_method_factory.rb'

if ENV["CHANNEL"] == nil
  ENV['CHANNEL'] = 'chrome' #Edit this when using RubyMine needs to run against specific browser
else
  puts "CHANNEL = " + ENV["CHANNEL"]
end

WAIT_TIMEOUT = 5
World(DeviceMethodFactory.for_channel(ENV['CHANNEL']))