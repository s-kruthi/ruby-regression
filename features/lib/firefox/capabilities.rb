module Firefox
  module Capabilities
    def self.set_up_selenium_web_driver
      $driver = Selenium::WebDriver.for(:firefox)
      $driver.manage.window.move_to(300,400)
      #$driver.manage.window.resize_to(900, 1500)
      $driver.manage.window.resize_to(1200, 1500)
    end
  end
end