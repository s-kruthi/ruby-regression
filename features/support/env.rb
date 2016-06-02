
require "selenium-webdriver"
require "selenium/client"


require "./features/lib/device_method_factory.rb"

puts "CHANNEL = " + ENV["CHANNEL"]

#ENV['CHANNEL'] = 'chrome'

WAIT_TIMEOUT = 5
World(DeviceMethodFactory.for_channel(ENV['CHANNEL']))

