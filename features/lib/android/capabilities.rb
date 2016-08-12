module Android
  module Capabilities
      def self.set_up_selenium_web_driver
        caps = Selenium::WebDriver::Remote::Capabilities.android
        client = Selenium::WebDriver::Remote::Http::Default.new
        client.timeout = 480
        $driver = Selenium::WebDriver.for(
            :remote,
            :url => "http://localhost:8080/wd/hub/",
            :http_client => client,
            :desired_capabilities => caps)
      end
    end
end


