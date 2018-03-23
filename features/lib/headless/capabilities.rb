module Headless
  module Capabilities
    def self.set_up_selenium_web_driver
      options = Selenium::WebDriver::Chrome::Options.new(args: %w('ignore-certificate-errors', 'disable-popup-blocking', 'disable-translate'))
      options.add_argument('--headless')
      options.add_argument('--disable-gpu')
      $driver = Selenium::WebDriver.for :chrome,options: options , driver_path: File.join(File.absolute_path('../../../drivers/', File.dirname(__FILE__)),"chromedriver")
      # $driver.manage.window.resize_to(1500, 1900)
      # $driver.switch_to.window($driver.window_handles[0])
      $driver.manage.window.maximize()
    end
  end
end