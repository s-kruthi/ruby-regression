And(/^I Can Add A Vendor$/i) do
  Sleep_Until(ClickElement('id', 'add-vendor'))
  WaitForAnElementByIdAndInputValue('vendor_name', 'testing_vendors')
  WaitForAnElementByIdAndInputValue('vendor_description', 'Testing Vendors')
  Sleep_Until(ClickElement('id','vendor_save'))
end

When(/^I Search For "([\w\s]+)" Vendor$/i) do | vendor_name |
  @vendor_details = $daos.get_vendor_details(vendor_name)

  if !@vendor_details.nil?
    Sleep_Until(SearchACourse('//input[@id="vendorUserSearch_name"]', @vendor_details[:name], COURSE_SEARCH_BTN_ID))
  else
    puts COLOR_YELLOW + "vendor not found, check manually".upcase
    skip_this_scenario
  end
end

And(/^I Edit The Name To Be "([\w\s]+)"$/i) do | edit_name |
  @edited_name = edit_name
  Sleep_Until(ClickElement("xpath", "//a[contains(@href, '/edit/#{@vendor_details[:id]}')]"))
  ClearField('id', 'vendor_name' )
  WaitForAnElementByIdAndInputValue('vendor_name', edit_name)
  ClickOnSaveButton(SAVE_BTN_ID)
end

Then(/^I Should See That The Vendor Is "([\w]+)" Successfully$/i) do | action |
  case action
    when 'Edited'
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, 'Vendor has been successfully updated.')
    when 'Added'
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, 'Vendor has been successfully added.')
      expect(GetTextAssociatedToElement("xpath","//ol[@class='breadcrumb']/child::li[@class='active']")).to eq('testing_vendors')
    else
      #See success message in modal
      Sleep_Until(VerifyAnElementExistByXPath(REQUISITION_MODAL_ID, 'Vendor has been successfully deactivated.'))
      PressEnterOK()
  end
end

And(/^I Choose To "([\w\s]+)"(:? For The Vendor)?$/i) do | action, text |
  # click on the action dropdown
  $driver.find_element(:xpath, "//button[contains(@class, 'dropdown-toggle')]").click

  case action
    when "Add Vendor User"
      identifier = "//a[@href='/admin/vendor/" + @vendor_details[:id].to_s + "/user/new/']"
    when "View Vendor Users"
      identifier = "//a[@href='/admin/vendor/users/" + @vendor_details[:id].to_s + "']"
    when "Deactivate Vendor"
      identifier = "//a[@href='/admin/vendor/activate-toggle/" + @vendor_details[:id].to_s + "']"
  end
  $driver.find_element(:xpath, identifier).click
end

And(/^I Enter The Vendor User Details$/i) do
  WaitForAnElementByIdAndInputValue('vendoruser_firstName', 'testing_vendors')
  WaitForAnElementByIdAndInputValue('vendoruser_lastName', 'testing_vendors')

  suffix = Time.now.strftime("%Y%m%d%H%M%S").to_s
  vendor_user_email = 'test'+ suffix +'@elmodev.com'
  WaitForAnElementByIdAndInputValue('vendoruser_email', vendor_user_email)
  
  WaitForAnElementByIdAndTouch('vendoruser_save')
end

Then(/^I Should See That The Vendor User Is Added Successfully$/i) do
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, 'User has been successfully added.')
end

And(/^I Activate The Newly Created Vendor User$/i) do
  steps %{
    And   I Click On "Notify Users" Button
    And   I Click On "Activate All Users" Button
    Then  I Should Be Able to Activate All Users
  }
end

Then(/^I Should See The Vendor Users Listed In The Page$/i) do
  count = $daos.get_vendor_usercount(@vendor_details[:id])
  if count == 0
    VerifyAnElementNotExist("xpath", PAGINATION_ID)
    puts COLOR_BLUE + "No users found"
  else
    results_count = $driver.find_element(:xpath, PAGINATION_ID).text.split(" ")[4].to_i
    if results_count.eql? count then
      puts COLOR_BLUE + "Results match"
    end
  end
end





