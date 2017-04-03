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
    def VerifyAnElementExistByCSSAndIndex(css,text,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:css, "#{css}")[index_value]
          element if element.displayed?
        }
        select_item.text.include? "#{text}"
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def VerifyAnElementExistByClassAndIndex(class_name,text,index_value)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_elements(:class, "#{class_name}")[index_value]
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
    def PressEnterConfirm()
      $driver.find_element(:css, "[data-bb-handler='confirm']").click
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
    def Wait_For(timeout)
      $driver.manage.timeouts.implicit_wait = timeout
    end

    def useCKEditorToEnterDescription(text)
      begin
        wait = Selenium::WebDriver::Wait.new(:timeout => 10)
        select_item = wait.until {
          element = $driver.find_element(:class, "cke_wysiwyg_frame")
          element if element.displayed?
        }
        $driver.switch_to.frame(select_item)
        #       sleep (1)

        enter_txt = wait.until {
          element = $driver.find_element(:tag_name, "body")
          element if element.displayed?
        }

        enter_txt.send_keys(text)
        #        sleep (1)

        $driver.switch_to.parent_frame
        sleep (1)

      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def useSelect2InPutField(index_arrow_name, index_arrow_id, index_class_name, index_class_id)
      begin
        WaitForDropdownByClassAndTouchTheIndex(index_arrow_name, index_arrow_id)
        WaitForDropdownByClassAndTouchTheIndex(index_class_name, index_class_id)
      end
    end

    def browseFileSelect(browse_file_id, sample_filename)
      begin
        WaitForAnElementByXpathAndInputValue(browse_file_id, sample_filename)
        sleep (1)
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def selectFromDropDown(dropdown_option, dropdown_value)
      begin
        WaitForAnElementByXpathAndTouch(dropdown_option)
        WaitForAnElementByXpathAndTouch(dropdown_value)

      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

  end
end
