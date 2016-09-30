module Firefox
  module Custom_Methods

    def WaitForDropdownByClassAndTouchTheIndex(class_name,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:class, "#{class_name}")[index_value]
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def WaitForAnElementByXpathAndTouchTheIndex(xpath,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:xpath, "#{xpath}")[index_value]
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def WaitForAnElementByIdAndTouchTheIndex(id,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:id, "#{id}")[index_value]
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def VerifyAnElementExistByCSSAndIndex(css,text,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:css, "#{css}")[index_value]
          element if element.displayed?
        }
        select_item.text.include? "#{text}"
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def PressEnterConfirm()
      $driver.find_element(:css, "[data-bb-handler='confirm']").click
    end
    def PressEnterOK()
      $driver.find_element(:css, "[data-bb-handler='ok']").click
    end
    def TouchDelete()
      element = $driver.find_element(:link, "Delete")
      element.click
    end
    def Wait_For(timeout)
      $driver.manage.timeouts.implicit_wait = timeout
    end
  end
end
