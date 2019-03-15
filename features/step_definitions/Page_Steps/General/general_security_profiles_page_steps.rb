def DeleteSecurityProfile()
  #get security profile with no users assigned
  @profile = $daos.get_security_profiles_no_users()

  if !@profile.nil?
    #search for the profile
    SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @profile[:name], COURSE_SEARCH_BTN_ID)
    Sleep_Until(ClickElement('xpath', '//a[@href="/admin/security-profile/delete/'+ @profile[:id].to_s + '"]'))
    Sleep_Until(PressEnterConfirm())
  else
    puts COLOR_YELLOW + "security profile with no assigned users does not exist".upcase
    skip_this_scenario
  end
end


def AddSecurityProfile(profile_type, profile_name)
  Sleep_Until(ClickElement('xpath', SECURITY_PROFILES_ADD_ID))

  Sleep_Until(SelectFromDropdown(SECURITY_PROFILES_ROLETYPE_ID, profile_type))
  WaitForAnElementByIdAndInputValue(SECURITY_PROFILES_NAME_ID, profile_name)

  profile_desc = 'Profile having ' + profile_type
  Sleep_Until(UseCkeditorToEnterText(profile_desc, 0))
end


def EditSecurityProfile()
  #get security profile with no users assigned
  @profile = $daos.get_security_profiles_no_users()

  if !@profile.nil?
    #search for the profile
    SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @profile[:name], COURSE_SEARCH_BTN_ID)
    Sleep_Until(ClickElement('xpath', '//a[@href="/admin/security-profile/edit/details/'+ @profile[:id].to_s + '"]'))
    pending
  else
    puts COLOR_YELLOW + "security profile with no assigned users does not exist".upcase
    skip_this_scenario
  end
end
