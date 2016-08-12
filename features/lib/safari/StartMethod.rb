module Safari
  module StartMethod
    def startWebDriver()
      Safari::Capabilities.set_up_selenium_web_driver
    end
  end
end