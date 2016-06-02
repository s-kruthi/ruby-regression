module Android
  module StartMethod
      def startWebDriver
      Android::Capabilities.set_up_selenium_web_driver
    end
  end
end