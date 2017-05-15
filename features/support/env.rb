require 'rubygems'
require 'active_record'
require 'touch_action/selenium-webdriver'
require 'securerandom'
require 'waitutil'
require "selenium-webdriver"
require 'pry'
require 'rest-client'
require 'ruby-jmeter'

require "./features/lib/device_method_factory.rb"

puts "CHANNEL = " + ENV["CHANNEL"] # Enable this when using Windows and/or MacOS Command line

#ENV['CHANNEL'] = 'firefox' #Enable this when using RubyMine IDE

WAIT_TIMEOUT = 5
World(DeviceMethodFactory.for_channel(ENV['CHANNEL']))

