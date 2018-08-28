module Firefox
  module Wait_Methods
    
    class VerificationException < Exception;
    end
    
    
    def WaitForAnElementById(id)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        select_item
      
      rescue Exception => e
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end
    
    
    def WaitForSelectFileButtonAndUploadFile(file)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        upload_button = wait.until {
          element = $driver.find_element(:css, 'input[id*=fileInput]')
          element if element.displayed?
        }
        file_path = File.expand_path('../../..', File.dirname(__FILE__)) + "/test_files/#{file}"
        upload_button.send_keys(file_path)
          # VerifyAnElementNotExist('css', 'input[id*=fileInput]')
          # VerifyAnElementNotExistByCSS(input[id*=fileInput])
      rescue Exception => e
        puts e.message
      end
    end
    
    
    # Syntax:
    # ClickElement("id", "username")
    # ClickElement("class", "select2-arrow", 1)
    def ClickElement(type, identifier, index = nil)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        
        element = wait.until {
          element = $driver.find_element(:"#{type}", "#{identifier}") if index == nil
          element = $driver.find_elements(:"#{type}", "#{identifier}")[index] if index != nil
          element if element.displayed?
        }
        
        if element
          element.click
          puts COLOR_GREEN + "MATCHED: Element present"
        else
          fail
        end
      
      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Element not present, so could not click. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end
  
  end
end