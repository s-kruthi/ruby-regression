And(/^I Can Add A Vendor$/i) do
  Sleep_Until(ClickElement('id', 'add-vendor'))
  WaitForAnElementByIdAndInputValue('vendor_name', 'testing_vendors')
  WaitForAnElementByIdAndInputValue('vendor_description', 'Testing Vendors')
  Sleep_Until(ClickElement('id','vendor_save'))
end

Then(/^I Should See That Vendor Is Added Successfully$/i) do
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, 'Vendor has been successfully added.')
  expect(GetTextAssociatedToElement("xpath","//ol[@class='breadcrumb']/child::li[@class='active']")).to eq('testing_vendors')
end

When(/^I Search For "([\w\s]+)" Vendor$/i) do | vendor_name |
  @vendor_details = $daos.get_vendor_details(vendor_name)

  if !@vendor_details.nil?
    SearchACourse('//input[@id="vendorUserSearch_name"]', @vendor_details[:name], COURSE_SEARCH_BTN_ID)
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

Then(/^I Should See That The Vendor Was "([\w]+)" Successfully$/i) do | action |
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, 'Vendor has been successfully updated.')
end

And(/^I Choose To "([\w\s]+)" For The Vendor$/i) do | action |
  # click on the action dropdown
  $driver.find_element(:xpath, "//button[contains(@class, 'dropdown-toggle')]").click

  case action
    when "Add Vendor User"
      identifier = "//a[@href='/admin/vendor/" + @vendor_details[:id].to_s + "/user/new/']"
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




