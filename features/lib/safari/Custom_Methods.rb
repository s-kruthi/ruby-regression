module Safari
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
          # TODO: Pending review and removal as it’s now redundant and has been added in the After hook
          # $driver.save_screenshot("./features/Screenshots/#{ENV['CHANNEL']}/#{text}Screenshot.png")
          raise VerificationException.new("Verification ERROR...Text is not matching(check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
        end
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end
    def PressEnterConfirm()
      $driver.find_element(:css, "[data-bb-handler='confirm']").click
    end
    def PressConfirm()
      $driver.find_element(:class, "confirm-btn").click
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

        enter_txt.send_keys(text)

        $driver.switch_to.parent_frame
        sleep (1)

      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def SelectFromSelect2Input(index_arrow_name, index_arrow_id, index_class_name, index_class_id)
      begin
        WaitForDropdownByClassAndTouchTheIndex(index_arrow_name, index_arrow_id)
        WaitForDropdownByClassAndTouchTheIndex(index_class_name, index_class_id)
      end
    end

    def browse_file_select(browse_file_id, sample_filename)
      begin
        WaitForAnElementByXpathAndInputValue(browse_file_id, sample_filename)
        sleep (1)
      rescue Exception => e
        puts e.message
        $driver.quit
      end
    end

    def SelectFromDropDown(dropdown_option, dropdown_value)
      begin
        dropdown_list = $driver.find_element(:xpath, dropdown_option)
        select_list = Selenium::WebDriver::Support::Select.new(dropdown_list)
        select_list.select_by(:text, dropdown_value)

      rescue Exception => e
        puts e.message
        $driver.quit
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
