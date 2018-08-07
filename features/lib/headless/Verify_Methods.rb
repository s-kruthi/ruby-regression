module Headless
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
          puts COLOR_GREEN + "MATCHED: Element is not displayed."
        else
          fail
        end

      rescue Exception => e
        raise VerificationException.new(COLOR_RED + "Element is displayed. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
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


    def VerifyResetSearch(reset_button_css, expected_url)
      WaitForAnElementByCSSAndTouch(reset_button_css)
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      url = wait.until {
        $driver.current_url
      }

      if url.eql? expected_url
        puts COLOR_GREEN + "MATCHED: Reset search return to the list"
      else
        fail
      end

    rescue Exception => e
      raise VerificationException.new(COLOR_RED + "Reset search not return to the list. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
      puts e.message
    end


    def VerifySearchResultElmoTable(expected_amount, search_value)
#   verify the row amount in the table body and search is included in each row
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      elements = wait.until {
        $driver.find_elements(:css, '#elmo-table tbody tr')
      }
      if (elements.size.eql? expected_amount) && EachRowIncludeValue(elements ,search_value)
        puts COLOR_GREEN + "MATCHED: Searched result with correct items"
      else
        fail
      end

    rescue Exception => e
      raise VerificationException.new(COLOR_RED + "Search result has incorrect item or amount. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
      puts e.message
    end


    def VerifyTableSortedByColumn(table_body_css, column_number, sort, datatype = '')
      column_values = GetValuesByColumnFromTableByCSS(table_body_css, column_number)
      if column_values.eql? SortArray(column_values, sort, datatype)
        puts COLOR_GREEN + "MATCHED: Table is sorted by column#{4} #{sort}"
      else
        fail
      end

    rescue Exception => e
      raise VerificationException.new(COLOR_RED + "Table is not sorted by column#{4} #{sort}")
      puts e.message
    end


    def VerifyTableByRowColumnCSS(table_body_css = '#elmo-table tbody', row, expected_table_column_value_hash)
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      table_body = wait.until {
        $driver.find_element(:css, table_body_css)
      }
      unmatch_result = ''
      expected_table_column_value_hash.each do |col_num, expected_value|
        column_css = table_body_css + " tr:nth-child(#{row})" + " td:nth-child(#{col_num})"
        page_column_value = $driver.find_element(:css, column_css).text
        unless page_column_value.eql?(expected_value)
          unmatch_result += page_column_value + ' unmatch ' + expected_value
        end
      end
      if unmatch_result.empty?
        puts COLOR_GREEN + "MATCHED: Table columns are as expected"
      else
        fail
      end
    rescue Exception => e
      raise VerificationException.new(COLOR_RED + unmatch_result)
      puts e.message
    end


    def VerifyElementDisableCSS(css)
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      element = wait.until {
        $driver.find_element(:css, css)
      }
      # When the attribute "disabled = disabled" it will return 'true' as string
      if element.attribute('disabled').eql?(true.to_s)
        puts COLOR_GREEN + "MATCHED: Web Element is diabled"
      else
        fail
      end
    rescue Exception => e
      raise VerificationException.new(COLOR_RED + "Web Element is not disabled")
      puts e.message
    end


    def VerifyNumberChange(before, after, expect_increase_decrease)
      result = ''
      if expect_increase_decrease.downcase.include?('increase')
        result = before.to_i < after.to_i
      elsif expect_increase_decrease.downcase.include?('decrease')
        result = before_to_i > after.to_i
      end
      if result
        puts COLOR_GREEN + "MATCHED: Number is #{expect_increase_decrease} as expected"
      else
        fail
      end
    rescue Exception => e
      raise VerificationException.new(COLOR_RED + "Number is not #{expect_increase_decrease}")
      puts e.message
    end


    def VerifyCheckboxSelectedByCSS(css, selected_number, verify_message)
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      elements = wait.until {
        $driver.find_elements(:css, css)
      }

      result = []
      for i in 1..selected_number
        element_index = i - 1
        # When the attribute "disabled = disabled" it will return 'true' as string
        unless elements[element_index].attribute('disabled').eql? 'true'
          result << "#{i} #{verify_message}"
        end
      end

      if result.size == 0
        puts COLOR_GREEN + "MATCHED: Successful #{verify_message}"
      else
        fail
      end

    rescue Exception => e
      raise VerificationException.new(COLOR_RED + result.join(','))
      puts e.message
    end
  end
end
