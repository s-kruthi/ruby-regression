require 'rubygems'
require 'active_record'
require 'touch_action/selenium-webdriver'

require "selenium-webdriver"
#require "selenium/client"

require "./features/lib/device_method_factory.rb"

puts "CHANNEL = " + ENV["CHANNEL"]

#ENV['CHANNEL'] = 'safari'

WAIT_TIMEOUT = 5
World(DeviceMethodFactory.for_channel(ENV['CHANNEL']))

