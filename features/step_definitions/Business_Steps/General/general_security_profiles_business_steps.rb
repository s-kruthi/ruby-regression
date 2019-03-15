Then(/^I Should Be Able To See Security Profiles under General section$/i) do
  GoToASection(GENERAL_EXPAND)
  Sleep_Until(VerifyAnElementExists('xpath', SECURITY_PROFILES_ID))
end


And(/^I Can Add A Profile Of Type ([\w\s]+) Named As ([\w\s-]+)$/i) do | profile_type, profile_name |
  @profile_type = profile_type
  AddSecurityProfile(profile_type, profile_name)
end


Then(/^I Should See That The Profile Is Successfully (Added|Saved|Deleted)$/i) do | profile_action |
  case profile_action
  when 'Deleted'
    #See success message in modal
    Sleep_Until(VerifyAnElementExistByXPath(REQUISITION_MODAL_ID, "Profile successfully deleted"))
    PressEnterOK()
  else
    ClickElement('id', 'securityProfile_save')
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SECURITY_PROFILES__SAVE_SUCCESSMSG_VALUE))
  end
end


And(/^I Can Delete Security Profile With No Users$/i) do
  DeleteSecurityProfile()
end


And(/^I Can Edit Security Profile With No Users$/i) do
  EditSecurityProfile()
end
