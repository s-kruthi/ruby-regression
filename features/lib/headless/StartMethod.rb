module Headless
  module StartMethod
    def startWebDriver()
      Headless::Capabilities.set_up_selenium_web_driver
    end
  end
end