module Safari
  module Input_Methods

    def WaitForAnElementByIdAndInputValue(id,value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        select_item.send_keys "#{value}"
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    def WaitForAnElementByClassAndInputValue(class_name,value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:class, "#{class_name}")
          element if element.displayed?
        }
        select_item.send_keys "#{value}"
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByXpathAndInputValue(xpath,value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:xpath, "#{xpath}")
          element if element.displayed?
        }
        select_item.send_keys "#{value}"
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByCSSAndInputValue(css,value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:css, "#{css}")
          element if element.displayed?
        }
        select_item.send_keys "#{value}"
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

  end
end
