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
          puts "#{text} matched"
        else
          $driver.save_screenshot("./features/screenshots/#{ENV['CHANNEL']}/#{text}screenshot.png")
          raise VerificationException.new("Verification ERROR...Text is not matching(check screenshot under features->screenshots->#{ENV['CHANNEL']})")
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
          puts "#{text} matched"
        else
          $driver.save_screenshot("./features/screenshots/#{ENV['CHANNEL']}/#{text}Screenshot.png")
          raise VerificationException.new("Verification ERROR...Text is not matching(check screenshot under features->screenshots->#{ENV['CHANNEL']})")
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
          puts "#{text} matched"
        else
          $driver.save_screenshot("./features/screenshots/#{ENV['CHANNEL']}/#{text}screenshot.png")
          raise VerificationException.new("Verification ERROR...Text is not matching(check screenshot under features->screenshots->#{ENV['CHANNEL']})")
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
          puts "#{text} matched"
        else
          $driver.save_screenshot("./features/screenshots/#{ENV['CHANNEL']}/#{text}screenshot.png")
          raise VerificationException.new("Verification ERROR...Text is not matching(check screenshot under features->screenshots->#{ENV['CHANNEL']})")
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
          puts "#{text} matched"
        else
          $driver.save_screenshot("./features/screenshots/#{ENV['CHANNEL']}/#{text}screenshot.png")
          raise VerificationException.new("Verification ERROR...Text is not matching(check screenshot under features->screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

  end
end
