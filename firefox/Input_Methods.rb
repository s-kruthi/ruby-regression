module Firefox
  module Input_Methods

    class VerificationException < Exception;
    end


    def WaitForAnElementByIdAndInputValue(id,value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        select_item.send_keys "#{value}"


      rescue Exception => e
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end


    def WaitForAnElementByXpathAndClearValue(xpath)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:xpath, "#{xpath}")
          element if element.displayed?
        }
        select_item.clear()

      rescue Exception => e
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end

  end
end
