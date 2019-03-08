Then(/^I Should Be Able To See Security Profiles under General section$/i) do
  GoToASection(GENERAL_EXPAND)
  Sleep_Until(VerifyAnElementExists('xpath', SECURITY_PROFILES_ID))
end


And(/^I Can Add A Profile Of Type ([\w\s]+) Named As ([\w\s-]+)$/i) do | profile_type, profile_name |
  ClickElement('xpath', SECURITY_PROFILES_ADD_ID)
  SelectFromDropdown('//select[@id="securityProfile_roleType"]', profile_type)
  WaitForAnElementByIdAndInputValue('securityProfile_name', profile_name)
  profile_desc = 'Profile having ' + profile_type
  Sleep_Until(UseCkeditorToEnterText(profile_desc, 0))
end


Then(/^I Should See That The Profile Is Successfully (Added|Saved|Deleted)$/i) do | profile_action |
  case profile_action
    when 'Deleted'
      byebug
    else
      ClickElement('id', 'securityProfile_save')
      Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SECURITY_PROFILES__SAVE_SUCCESSMSG_VALUE))
  end
end


And(/^I Can Delete Named As ([\w\s-]+)$/i) do | profile_name |
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, profile_name , COURSE_SEARCH_BTN_ID)
  byebug
end
