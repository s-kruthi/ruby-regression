module IOS
  module StartMethod
    def startWebDriver()
      IOS::Capabilities.set_up_selenium_web_driver
    end
  end
end