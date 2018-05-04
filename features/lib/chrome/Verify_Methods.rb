module Chrome
  module Verify_Methods

    class VerificationException < Exception;
    end

    def VerifyAnElementExistById(id, text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:id, "#{id}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        Cucumber.wants_to_quit = true
        raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is NOT matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end

    def VerifyAnElementExistByClass(class_name, text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:class, "#{class_name}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        Cucumber.wants_to_quit = true
        raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is NOT matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end

    def VerifyAnElementExistByXPath(xpath, text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:xpath, "#{xpath}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        Cucumber.wants_to_quit = true
        raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is NOT matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end


    def VerifyAnElementExistByName(name, text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:name, "#{name}")
          element if element.displayed?
        }
        expected_text = select_item.text.include? "#{text}"
        if expected_text
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        Cucumber.wants_to_quit = true
        raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is NOT matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
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
        if expected_text
          puts "\e[0m[ \e[32mPASSED\e[0m ] MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        Cucumber.wants_to_quit = true
        raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is NOT matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end

    ####Verify element and Select2 elements ability to change Martinma123
    def VerifyElementAbilityByCSS(element_css, setting_ability)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        element_ability = wait.until {
          disabled_element_css = "#{element_css}[disabled]"
          enabled_element_css = element_css
          if $driver.find_elements(:css, disabled_element_css).any?
            "disabled"
          elsif $driver.find_elements(:css, enabled_element_css).any?
            "enabled"
          end
        }
        if element_ability == setting_ability.downcase
          puts "\e[0m[ \e[32mPASSED\e[0m ] Element ability MATCHED: #{setting_ability}"
        else
          fail
        end

      rescue Exception => e
        Cucumber.wants_to_quit = true
        raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Text is NOT matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end

    def VerifySelect2Ability(select2_element_css, setting_ability)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        element_ability = wait.until {
          disabled_element_css = "#{select2_element_css}.select2-container-disabled"
          enabled_element_css = "#{select2_element_css}:not(.select2-container-disabled)"
          if $driver.find_elements(:css, disabled_element_css).any?
            "disabled"
          elsif $driver.find_elements(:css, enabled_element_css).any?
            "enabled"
          end
        }
        if element_ability == setting_ability.downcase
          puts "\e[0m[ \e[32mPASSED\e[0m ] Element ability MATCHED: #{setting_ability}"
        else
          raise VerificationException.new("\e[0m[ \e[31mFAILED\e[0m ] Element ability is not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
  end
end
