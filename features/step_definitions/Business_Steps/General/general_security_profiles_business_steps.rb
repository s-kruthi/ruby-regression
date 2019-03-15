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
    Sleep_Until(VerifyAnElementExistByXPath(REQUISITION_MODAL_ID, SECURITY_PROFILES_DEL_SUCCESSMSG_VALUE))
    puts COLOR_GREEN + ("deleted profile " + @profile[:name] + " having id " + @profile[:id].to_s).upcase
    PressEnterOK()
  else
    ClickElement('id', SECURITY_PROFILES_SAVE_ID)
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SECURITY_PROFILES_SAVE_SUCCESSMSG_VALUE))
    # VerifyTabs()
  end
end


And(/^I Can Delete Security Profile With No Users$/i) do
  DeleteSecurityProfile()
end


And(/^I Can Edit Security Profile With No Users$/i) do
  EditSecurityProfile()
end


And(/^I Add (.*) User To The Security Profile$/i) do | user_name |
  AddUserSecurityProfile(user_name)
end


And(/^I Should See That User Is Added To The Profile Successfully$/i) do
  Sleep_Until(ClickElement('id', SECURITY_PROFILES_SUMMARYCONFIRM_ID))
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SECURITY_PROFILES_ADDUSER_SUCCESSMSG_VALUE))
end


