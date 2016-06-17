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
    def PressEnter()
      $driver.action.send_keys(:enter).perform
    end
    def TouchDelete()
      element = $driver.find_element(:link, "Delete")
      element.click
    end
    def TouchHide()
      element = $driver.find_element(:link, "Hide")
      element.click
    end
    def Wait(timeout)
      $driver.manage.timeouts.implicit_wait = timeout
    end
  end
end