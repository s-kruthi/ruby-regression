And(/^I Can Add A Vendor$/i) do
  AddVendor()
end

When(/^I Search For "([\w\s]+)" Vendor$/i) do | vendor_name |
  SearchForVendor(vendor_name)
end

And(/^I Edit The Name To Be "([\w\s]+)"$/i) do | edit_name |
  EditNameVendor(edit_name)
end

Then(/^I Should See That The Vendor Is "([\w]+)" Successfully$/i) do | action |
  case action
    when 'Added'
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, VENDOR_ADD_SUCCESS_MSG_VAL)
      expect(GetTextAssociatedToElement("xpath", VENDOR_BREADCRUMB_ID)).to eq(VENDOR_NAME_VAL)
    when 'Edited'
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, VENDOR_UPDATE_SUCCESS_MSG_VAL)
    else
      #See success message in modal
      Sleep_Until(VerifyAnElementExistByXPath(REQUISITION_MODAL_ID, VENDOR_DEACTIVATE_SUCCESS_MSG_VAL))
      PressEnterOK()
  end
end

And(/^I Choose To "([\w\s]+)"(:? For The Vendor)?$/i) do | action, text |
  ClickActionsDropdown()
  PerformActionVendor(action)
end

And(/^I Enter The Vendor User Details$/i) do
  EnterVendorUserDetails()
end

Then(/^I Should See That The Vendor User Is "(Added|Edited|Deactivated)" Successfully$/i) do | action_type |
  if action_type == 'Added'
    VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, VENDOR_USER_ADD_SUCCESS_MSG_VAL)
  elsif action_type == 'Edited'
    VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, VENDOR_USER_UPDATE_SUCCESS_MSG_VAL)
  else
    #See success message in modal
    Sleep_Until(VerifyAnElementExistByXPath(REQUISITION_MODAL_ID, VENDOR_USER_DEACTIVATE_SUCCESS_MSG_VAL))
    PressEnterOK()
  end
end

And(/^I Activate The Newly Created Vendor User$/i) do
  steps %{
    And   I Click On "Notify Users" Button
    And   I Click On "Activate All Users" Button
    Then  I Should Be Able to Activate All Users
  }
end

Then(/^I Should See The Vendor Users Listed In The Page$/i) do
  ViewVendorUsers()
end

And(/^I "(Edit|Deactivate)" Vendor User$/i) do | action |
  SearchForVendorUser()
  ClickActionsDropdown()
  PerformActionVendorUser(action)
end






