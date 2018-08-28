module Headless
  module Touch_Methods
    
    class VerificationException < Exception;
    end
    
    
    def WaitForAnElementByIdAndTouch(id)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        select_item.click
      
      rescue Exception => e
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        fail
        raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end
    
    
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
    
    
    def WaitForAnElementByPartialLinkTextAndTouchTheIndex(partial_link_text,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:partial_link_text, "#{partial_link_text}")[index_value]
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    
    def WaitForAnElementByCssAndTouchTheIndex(css,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:css, "#{css}")[index_value]
          element if element.displayed?
        }
        select_item.click
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    
    def WaitForToggleDropDownItemAndTouch(toggle_button_xpath, drop_down_item_xpath)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        toggle_button = wait.until {
          element = $driver.find_element(:xpath, toggle_button_xpath)
          element if element.displayed?
        }
        Sleep_Until(toggle_button.click)
        dropdown_item = wait.until {
          element = $driver.find_element(:xpath, drop_down_item_xpath)
          element if element.displayed?
        }
        Sleep_Until(dropdown_item.click)
      rescue Exception => e
        puts e.message
      end
    end
    
    
    def WaitForAlertWindowAndTouchAcceptOrDismiss(accept_or_dismiss)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        alert_window = wait.until { $driver.switch_to.alert }
      rescue Selenium::WebDriver::Error::NoAlertOpenError => e
        puts e.message
      end
      if accept_or_dismiss.downcase === "accept"
        alert_window.accept
      elsif accept_or_dismiss.downcase === "dismiss"
        alert_window.dismiss
      end
    end
  
  end
end
