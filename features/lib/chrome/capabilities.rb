module Chrome
  module Capabilities
    def self.set_up_selenium_web_driver
      profile = Selenium::WebDriver::Chrome::Profile.new
      profile['download.prompt_for_download'] = false
      profile['download.default_directory'] = "/Applications/Google Chrome.app/Contents/MacOS"
      data = profile.as_json
      caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "--test-type" ]})

      $driver = Selenium::WebDriver.for :remote,:url => "http://localhost:9515",:desired_capabilities => caps
      $driver.manage.window.move_to(300,400)
      #$driver.manage.window.resize_to(900, 1500)  use it for responsive web design
      $driver.manage.window.resize_to(1200, 1500)
    end

  end
end