module Safari
  module Custom_Methods
    
    class VerificationException < Exception;
    end
    
    
    def PressEnterConfirm()
      $driver.find_element(:css, "[data-bb-handler='confirm']").click
    end
    
    
    def PressConfirm()
      $driver.find_element(:class, "confirm-btn").click
    end
    
    
    def PressEnterKey(type,identifier)
      $driver.find_element(:"#{type}", "#{identifier}").send_keys :enter
    end
    
    
    def PressEnterOK()
      $driver.find_element(:css, "[data-bb-handler='ok']").click
    end
    
    
    def TouchDelete()
      element = $driver.find_element(:link, "Delete")
      element.click
    end
    
    
    def TouchCancel()
      element = $driver.find_element(:link, "cancel")
      element.click
    end
    
    
    def PressEnterClose()
      $driver.find_element(:class, "close-btn").click
    end
    
    
    def PressModalClose()
      $driver.find_element(:css, '.modal button[class="close"]').click
    end
    
    
    def Wait_For(timeout)
      $driver.manage.timeouts.implicit_wait = timeout
    end
    
    
    def Sleep_Until(method)
      i=1
      sleep(i)
      for loop in 1..i do
        i+=1
        # puts "#{i}"
        break if method
      end
    end
    
    
    def UseCkeditorToEnterText(text, index_id)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:class, "cke_wysiwyg_frame")[index_id]
          element if element.displayed?
        }
        $driver.switch_to.frame(select_item)
        
        enter_txt = wait.until {
          element = $driver.find_element(:tag_name, "body")
          element if element.displayed?
        }
        
        enter_txt.clear()
        enter_txt.send_keys(text)
        
        $driver.switch_to.parent_frame
        sleep (1)
      
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    
    #Example: SelectFromDropdown("//select[contains(@id,'Profile Image-visible')]", "Everybody")
    def SelectFromDropdown(dropdown_option, dropdown_value)
      begin
        dropdown_list = $driver.find_element(:xpath, dropdown_option)
        select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
        select_list.select_by(:text, dropdown_value)
      
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    
    # NOTE: This is a deprecated method and should be improved with SingleSelectFromSelect2Dropdown()
    # Syntax: SelectFromSelect2Dropdown("select2-choices", 0, "select2-result-selectable", 1)
    def SelectFromSelect2Dropdown(index_arrow_name, index_arrow_id, index_class_name, index_class_id)
      begin
        WaitForDropdownByClassAndTouchTheIndex(index_arrow_name, index_arrow_id)
        WaitForDropdownByClassAndTouchTheIndex(index_class_name, index_class_id)
      end
    end
    
    
    # Syntax: SingleSelectFromSelect2Dropdown("//select[contains(@id,'enrolmentRuleUserFilters_userFilters_0_fieldCondition')]", SELECT2_DROPDOWN_ID, "manager1.scriptonce1", SELECT2_DROPDOWN_RESULT_CLASS)
    def SingleSelectFromSelect2Dropdown(select2_input_id, select2_search_input_class, select2_search_input_text, select2_search_result_class)
      $driver.find_elements(:id, select2_input_id).last.click
      Sleep_Until($driver.find_elements(:class, select2_search_input_class).last.send_keys(select2_search_input_text))
      Sleep_Until($driver.find_elements(:class, select2_search_result_class).first.click)
    end
    
    
    def BrowseFileSelect(browse_file_id, sample_filename)
      begin
        WaitForAnElementByXpathAndInputValue(browse_file_id, sample_filename)
        sleep (1)
      
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    
    
    def CheckboxCheckedCSS?(checkbox)
      wait = Selenium::WebDriver::Wait.new(:timeout => 10)
      element = wait.until {
        $driver.find_element(:css, checkbox)
      }
      element.selected?
    end


    module Chrome
      module Custom_Methods
    
        class VerificationException < Exception;
        end
    
    
        def PressEnterConfirm()
          $driver.find_element(:css, "[data-bb-handler='confirm']").click
        end
    
    
        def PressConfirm()
          $driver.find_element(:class, "confirm-btn").click
        end
    
    
        def PressEnterKey(type,identifier)
          $driver.find_element(:"#{type}", "#{identifier}").send_keys :enter
        end
    
    
        def PressEnterOK()
          $driver.find_element(:css, "[data-bb-handler='ok']").click
        end
    
    
        def TouchDelete()
          element = $driver.find_element(:link, "Delete")
          element.click
        end
    
    
        def TouchCancel()
          element = $driver.find_element(:link, "cancel")
          element.click
        end
    
    
        def PressEnterClose()
          $driver.find_element(:class, "close-btn").click
        end
    
    
        def PressModalClose()
          $driver.find_element(:css, '.modal button[class="close"]').click
        end
    
    
        def Wait_For(timeout)
          $driver.manage.timeouts.implicit_wait = timeout
        end
    
    
        def Sleep_Until(method)
          i=1
          sleep(i)
          for loop in 1..i do
            i+=1
            # puts "#{i}"
            break if method
          end
        end
    
    
        def UseCkeditorToEnterText(text, index_id)
          begin
            wait = Selenium::WebDriver::Wait.new(:timeout => 10)
            select_item = wait.until {
              element = $driver.find_elements(:class, "cke_wysiwyg_frame")[index_id]
              element if element.displayed?
            }
            $driver.switch_to.frame(select_item)
        
            enter_txt = wait.until {
              element = $driver.find_element(:tag_name, "body")
              element if element.displayed?
            }
        
            enter_txt.clear()
            enter_txt.send_keys(text)
        
            $driver.switch_to.parent_frame
            sleep (1)
      
          rescue Exception => e
            puts e.message
            $driver.quit
          end
        end
    
    
        #Example: SelectFromDropdown("//select[contains(@id,'Profile Image-visible')]", "Everybody")
        def SelectFromDropdown(dropdown_option, dropdown_value)
          begin
            dropdown_list = $driver.find_element(:xpath, dropdown_option)
            select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
            select_list.select_by(:text, dropdown_value)
      
          rescue Exception => e
            puts e.message
            $driver.quit
          end
        end
    
    
        # NOTE: This is a deprecated method and should be improved with SingleSelectFromSelect2Dropdown()
        # Syntax: SelectFromSelect2Dropdown("select2-choices", 0, "select2-result-selectable", 1)
        def SelectFromSelect2Dropdown(index_arrow_name, index_arrow_id, index_class_name, index_class_id)
          begin
            WaitForDropdownByClassAndTouchTheIndex(index_arrow_name, index_arrow_id)
            WaitForDropdownByClassAndTouchTheIndex(index_class_name, index_class_id)
          end
        end
    
    
        # Syntax: SingleSelectFromSelect2Dropdown("//select[contains(@id,'enrolmentRuleUserFilters_userFilters_0_fieldCondition')]", SELECT2_DROPDOWN_ID, "manager1.scriptonce1", SELECT2_DROPDOWN_RESULT_CLASS)
        def SingleSelectFromSelect2Dropdown(select2_input_id, select2_search_input_class, select2_search_input_text, select2_search_result_class)
          $driver.find_elements(:id, select2_input_id).last.click
          Sleep_Until($driver.find_elements(:class, select2_search_input_class).last.send_keys(select2_search_input_text))
          Sleep_Until($driver.find_elements(:class, select2_search_result_class).first.click)
        end
    
    
        def BrowseFileSelect(browse_file_id, sample_filename)
          begin
            WaitForAnElementByXpathAndInputValue(browse_file_id, sample_filename)
            sleep (1)
      
          rescue Exception => e
            puts e.message
            $driver.quit
          end
        end
    
    
        def CheckboxCheckedCSS?(checkbox)
          wait = Selenium::WebDriver::Wait.new(:timeout => 10)
          element = wait.until {
            $driver.find_element(:css, checkbox)
          }
          element.selected?
        end

        
        def WaitForToggleButtonStateChangedByXpath(toggle_xpath, toggle_value)
          begin
            wait = Selenium::WebDriver::Wait.new(:timeout => 10)
            wait.until {
              $driver.find_element(:xpath, toggle_xpath).text === toggle_value
            }
  
          rescue Exception => e
            fail
            raise VerificationException.new(COLOR_RED + "Element not found. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})\n")
            puts e.message
          end
        end
        
        
        # Syntax: WaitForSelectFileButtonAndUploadFile('small-world.png')
        # Note: The file must be placed in the /test_files/ folder for this to work
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
  
      end
    end

  end
end