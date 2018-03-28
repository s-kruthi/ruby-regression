module Chrome
  module Verify_Methods

    class VerificationException < Exception;
    end

    def VerifyAnElementExistById(id,text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text == true
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
          raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def VerifyAnElementExistByClass(class_name,text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:class, "#{class_name}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text == true
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
          raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def VerifyAnElementExistByXPath(xpath,text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:xpath, "#{xpath}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text == true
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
          raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def VerifyAnElementExistByName(name,text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:name, "#{name}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text == true
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
          raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def VerifyAnElementExistByCSS(css, text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:css, "#{css}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text == true
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
          raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def VerifyAnElementNotExistByCSS(css)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 3)
        element = wait.until {
          $driver.find_element(:css, "#{css}")
        }
      rescue Selenium::WebDriver::Error::TimeOutError
        puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: Element not exist"
      end
      if element.display
        $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/screenshot - #{Time.now.strftime('%Y-%m-%d %H-%M-%S')}.png")
        puts "\e[0m[ \e[32mFAILED\e[0m ] NOT MATCHED: Element exist"
      end
    end
  end
end
