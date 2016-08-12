module Chrome
  module StartMethod
    def startWebDriver()
      Chrome::Capabilities.set_up_selenium_web_driver
    end
  end
end