module IOS
  module Capabilities
    def self.set_up_selenium_web_driver
      capabilities = {
          :browserName => "Safari",
          :udid => "your device UDID",
          :platformVersion => '7.1',
          :platformName => "iOS"  ,
          :deviceName =>"YOUR Connected Device name" ,

            #use the below capability for iPhone 6 on ios 8

          # :browserName => "Safari",
          # :udid => "your device UDID",
          # :platformVersion => '8.0',
          # :platformName => "iOS"  ,
          # :deviceName =>"YOUR Connected Device name" ,

                      }

      server_url = "http://localhost:4723/wd/hub"
      #server_url = "http://127.0.0.1:4723/wd/hub"

      $driver = Selenium::WebDriver.for(:remote, :desired_capabilities => capabilities, :url => server_url)
    end

  end
end
