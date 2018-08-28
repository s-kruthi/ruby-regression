module Firefox
  module StartMethod
    def startWebDriver()
      Firefox::Capabilities.set_up_selenium_web_driver
    end
  end
end