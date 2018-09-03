module Firefox
  module Capabilities
    def self.set_up_selenium_web_driver
      # we now point to locally installed geckodriver , $brew upgrade geckodriver
      $driver = Selenium::WebDriver.for :firefox, marionette: true
      # driver_path: File.join(File.absolute_path('../../../drivers/', File.dirname(__FILE__)),"geckodriver")
      #$driver.manage.window.move_to(300,400)
      $driver.switch_to.window($driver.window_handles[0])
      $driver.manage.window.maximize()
    end
  end
end