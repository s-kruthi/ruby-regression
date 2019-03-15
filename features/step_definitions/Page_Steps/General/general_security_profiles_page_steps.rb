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
  else
    puts COLOR_YELLOW + "security profile with no assigned users does not exist".upcase
    skip_this_scenario
  end
end


# def VerifyTabs()
#   case @profile_type
#     when 'Learning Administrator Page Permissions'
#       #users, reports,sections,assignment rules, courses, filter,summary
#       Sleep_Until(VerifyAnElementExists('xpath','//a[contains(@href,"/admin/security-profile/edit/user/")]'))
#       Sleep_Until(VerifyAnElementExists('xpath','//a[contains(@href,"type=report")]'))
#       Sleep_Until(VerifyAnElementExists('xpath','//a[contains(@href,"type=configuration")]'))
#       Sleep_Until(VerifyAnElementExists('xpath','//a[contains(@href,"type=learningClass")]'))
#       Sleep_Until(VerifyAnElementExists('xpath','//a[contains(@href,"type=course")]'))
#       Sleep_Until(VerifyAnElementExists('xpath','//a[contains(@href,"type=filter")]'))
#       Sleep_Until(VerifyAnElementExists('xpath','//a[contains(@href,"/admin/security-profile/edit/confirmation/")]'))
#   end
# end


def AddUserSecurityProfile(user_name)
  Sleep_Until(ClickElement('xpath', SECURITY_PROFILES_USERSTAB_ID))
  Sleep_Until(ClickElement('xpath', SECURITY_PROFILES_USERSEARCH_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(SECURITY_PROFILES_USERINPUT_ID, user_name))
  Sleep_Until(ClickElement('xpath', "//span[@class='select2-match']"))
  Sleep_Until(ClickElement('id', SECURITY_PROFILES_USERSAVE_ID ))
  Sleep_Until(VerifySuccessAlertMessage(SECURITY_PROFILES_USERSSUCCESSMSG_ID, SECURITY_PROFILES_USERS_SUCCESSMSG_VALUE))
  Sleep_Until(ClickElement('xpath',SECURITY_PROFILES_SUMMARYTAB_ID))
end