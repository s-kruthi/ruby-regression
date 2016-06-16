module Firefox
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

  end
end