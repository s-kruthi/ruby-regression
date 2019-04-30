And(/^I Can Add A Vendor$/i) do
  Sleep_Until(ClickElement('id', 'add-vendor'))
  WaitForAnElementByIdAndInputValue('vendor_name', 'testing_vendors')
  WaitForAnElementByIdAndInputValue('vendor_description', 'Testing Vendors')
  Sleep_Until(ClickElement('id','vendor_save'))
end


Then(/^I Should See That Vendor Is Successfully Added$/i) do
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
  WaitForAnElementByIdAndInputValue('vendor_name', 'testing_vendors')
  ClickOnSaveButton(SAVE_BTN_ID)
end


Then(/^I Should See That The Vendor Was "([\w]+)" Successfully$/i) do | action |
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, 'Vendor has been successfully updated.')
end

