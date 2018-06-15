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
          puts COLOR_GREEN + "MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Text not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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
          puts COLOR_GREEN + "MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Text not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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
          puts COLOR_GREEN + "MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Text not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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
          puts COLOR_GREEN + "MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Text not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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
          puts COLOR_GREEN + "MATCHED: #{text}"
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Text not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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
          puts COLOR_GREEN + "Element ability MATCHED: #{setting_ability}"
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Text not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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
          puts COLOR_GREEN + "Element ability MATCHED: #{setting_ability}"
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Element ability is not matching. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        puts e.message
      end
    end


    def VerifyAnElementNotExist(*section_identifier ,type, identifier)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 5)
        if section_identifier.empty?
          elements = wait.until {
            $driver.find_elements(:"#{type}", "#{identifier}")
          }
        else
          elements = wait.until {
            $driver.find_element(:"#{type}", "%s" %section_identifier).find_elements(:"#{type}", "%s" %identifier)
          }
        end
        if elements.empty?
          puts COLOR_GREEN + "MATCHED: Item not displayed."
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Item is displayed. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end


    def VerifyColumnTextsMatchExpectedCSS(column_css, column_hash_title_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        element_columns = wait.until {$driver.find_elements(:css, column_css)}
        column_title_values = element_columns.map(&:text)
        unmatched_item = []
        column_title_values.each do |column|
          column_title = column.split("\n").first
          column_value = column.split("\n").last
          unless column_value.include?(column_hash_title_value[column_title.downcase])
            unmatched_item.push(column)
          end
        end

        if unmatched_item.size.zero?
          puts COLOR_GREEN + 'Page elements matched'
        else
          puts COLOR_RED + 'Unmateched page items'
          puts unmatched_item
          fail
        end
      rescue Exception => e
          raise VerificationException.new(COLOR_RED + "Page text is not as expected. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        puts e.message
      end
    end


    def VerifyAnElementExists(type, identifier)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        elements = wait.until {
          $driver.find_elements(:"#{type}", "#{identifier}")
        }

        if elements.empty?
          fail
        else
          puts COLOR_GREEN + "MATCHED: Element present"
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Element not present. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
        puts e.message
      end
    end

  end

end
