module Chrome
  module Capabilities
    def self.set_up_selenium_web_driver
      $driver = Selenium::WebDriver::Chrome.driver_path = File.join(File.absolute_path('../../../drivers/', File.dirname(__FILE__)),"chromedriver")
      # it picks chromedriver from a default location /usr/local/bin/chromedriver,thus update your local chromedriver if need be
      $driver = Selenium::WebDriver.for :chrome
      $driver.manage.window.resize_to(1500, 1900)
      $driver.manage.window.maximize()
    end


    # use the below method for remote execution on chrome, ideal for selenium hub
    # def self.set_up_selenium_web_driver
    #   profile = Selenium::WebDriver::Chrome::Profile.new
    #   profile['download.prompt_for_download'] = false
    #   profile['download.default_directory'] = "/Applications/Google Chrome.app/Contents/MacOS"
    #   data = profile.as_json
    #   caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--test-type" ]})
    #
    #   $driver = Selenium::WebDriver.for :remote,:url => "http://localhost:9515",:desired_capabilities => caps
    #   #$driver.manage.window.move_to(300,400)
    #   #$driver.manage.window.resize_to(900, 1500)  use it for responsive web design
    #   #$driver.manage.window.resize_to(1200, 1500)
    #   $driver.manage.window.maximize()
    # end

  end
end