module Headless
  module Touch_Methods

    def WaitForAnElementByIdAndTouch(id)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    def WaitForAnElementByClassAndTouch(class_name)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:class, "#{class_name}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByXpathAndTouch(xpath)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:xpath, "#{xpath}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    def WaitForAnElementByTagNameAndTouch(tag_name)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:tag_name, "#{tag_name}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    def WaitForAnElementByCSSAndTouch(css)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:css, "#{css}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByLinkAndTouch(link)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:link, "#{link}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    def WaitForAnElementByLinkTextAndTouch(link_text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:link_text, "#{link_text}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def WaitForAnElementByPartialLinkTextAndTouch(partial_link_text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:partial_link_text, "#{partial_link_text}")
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
  end
end
