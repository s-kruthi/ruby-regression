module Safari
  module Capabilities
    def self.set_up_selenium_web_driver
      $driver = Selenium::WebDriver.for(:safari)
      $driver.manage.window.move_to(300,400)
      #$driver.manage.window.resize_to(900, 1500)
      $driver.switch_to.window($driver.window_handles[0])
      $driver.manage.window.maximize()
    end
  end
end