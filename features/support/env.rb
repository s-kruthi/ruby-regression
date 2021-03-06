require 'rubygems'
require 'touch_action/selenium-webdriver'
require 'securerandom'
require 'waitutil'
require 'selenium-webdriver'
require 'pry'
require 'rest-client'
require 'ruby-jmeter'
require 'net/ssh/gateway'
require 'active_record'
require 'sequel'
require 'watir'
require 'colorize'
require 'csv'
require 'byebug'
require 'simplecov'
SimpleCov.start

require './features/lib/device_method_factory.rb'

if ENV["CHANNEL"] == nil
  ENV['CHANNEL'] = 'chrome' #Edit this when using RubyMine needs to run against specific browser
else
  puts "CHANNEL = " + ENV["CHANNEL"]
end


WAIT_TIMEOUT = 5
World(DeviceMethodFactory.for_channel(ENV['CHANNEL']))

COLOR_GREEN = "[PASSED] ".colorize(:green)
COLOR_RED = "[FAILED] ".colorize(:red)
COLOR_YELLOW = "[WARN] ".colorize(:yellow)
COLOR_BLUE = "[INFO] ".colorize(:blue)
COLOR_CYAN = "[INFO] ".colorize(:cyan)
COLOR_MAGENTA = "[INFO] ".colorize(:magenta)
COLOR_WHITE = "[INFO] ".colorize(:white)
