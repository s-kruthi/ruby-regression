irb
module Firefox
  module Capabilities
    def self.set_up_selenium_web_driver
      # Selenium::WebDriver::Firefox::Binary.path = "/Applications/Firefox.app/Contents/MacOS/firefox" #Old Method
      $driver = Selenium::WebDriver.for :firefox, marionette: true, driver_path: File.join(File.absolute_path('./drivers/', File.dirname(__FILE__)),"geckodriver")
      #$driver = Selenium::WebDriver.for :firefox, marionette: true
      #$driver.manage.window.move_to(300,400)
      $driver.manage.window.maximize()
    end
  end
end