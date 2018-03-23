module Headless
  module Wait_Methods

    def WaitForAnElementById(id)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        select_item
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByClass(class_name)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:class, "#{class_name}")
          element if element.displayed?
        }
        select_item
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByXPath(xpath)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:xpath, "#{xpath}")
          element if element.displayed?
        }
        select_item
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByName(name)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:name, "#{name}")
          element if element.displayed?
        }
        select_item
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByCSS(css)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:css, "#{css}")
          element if element.displayed?
        }
        select_item
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def WaitForAnElementByLink(link)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:link, "#{link}")
          element if element.displayed?
        }
        select_item
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def WaitForAnElementByPartialLinkText(partial_link_text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:partial_link_text, "#{partial_link_text}")
          element if element.displayed?
        }
        select_item
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForToggleButtonStateChangedByXpath(toggle_xpath, toggle_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        wait.until {
          $driver.find_element(:xpath, toggle_xpath).text === toggle_value
        }
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
  end
end