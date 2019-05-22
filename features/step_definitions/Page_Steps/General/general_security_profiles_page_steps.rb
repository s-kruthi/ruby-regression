def DeleteSecurityProfile()
  if @no_users
    #get security profile with no users assigned
    @profile = $daos.get_security_profiles_no_users()

    if !@profile.nil?
      #search for the profile
      SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @profile[:name], COURSE_SEARCH_BTN_ID)
      Sleep_Until(ClickElement('xpath', '//a[@href="/admin/security-profile/delete/'+ @profile[:id].to_s + '"]'))
      @profile_name = @profile[:name]
    else
      puts COLOR_YELLOW + "security profile with no assigned users does not exist".upcase
      skip_this_scenario
    end

  else
    #search for the specified profile
    SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @profile_name, COURSE_SEARCH_BTN_ID)
    Sleep_Until(ClickElement('xpath', SECURITY_PROFILES_DEL))
  end

  Sleep_Until(PressEnterConfirm())
  puts COLOR_BLUE + ("deleting security profile " + @profile_name).upcase
end

def AddSecurityProfile(profile_type, profile_name)
  Sleep_Until(ClickElement('xpath', SECURITY_PROFILES_ADD_ID))

  Sleep_Until(SelectFromDropdown(SECURITY_PROFILES_ROLETYPE_ID, profile_type))
  WaitForAnElementByIdAndInputValue(SECURITY_PROFILES_NAME_ID, profile_name)

  profile_desc = 'Profile having ' + profile_type
  Sleep_Until(UseCkeditorToEnterText(profile_desc, 0))
end

def EditSecurityProfile()
  if @no_users
    #get security profile with no users assigned
    @profile = $daos.get_security_profiles_no_users()

    if !@profile.nil?
      #search for the profile
      SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @profile[:name], COURSE_SEARCH_BTN_ID)
      Sleep_Until(ClickElement('xpath', '//a[@href="/admin/security-profile/edit/details/'+ @profile[:id].to_s + '"]'))
      puts COLOR_BLUE + ("editing security profile " + @profile[:name]).upcase
    else
      puts COLOR_YELLOW + "security profile with no assigned users does not exist".upcase
      skip_this_scenario
    end

  else
    #search for the specified profile
    SearchACourse(COURSE_LIST_SEARCH_BOX_ID, @profile_name, COURSE_SEARCH_BTN_ID)
    Sleep_Until(ClickElement('xpath', SECURITY_PROFILES_EDIT))
    puts COLOR_BLUE + ("editing security profile " + @profile_name).upcase
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

  #search for user and then add
  Sleep_Until(ClickElement('xpath', SECURITY_PROFILES_USERSEARCH_ID))
  Sleep_Until(WaitForAnElementByXpathAndInputValue(SECURITY_PROFILES_USERINPUT_ID, user_name))
  Sleep_Until(ClickElement('xpath', "//span[@class='select2-match']"))
  Sleep_Until(ClickElement('id', SECURITY_PROFILES_USERSAVE_ID ))
  puts COLOR_BLUE + ("adding user with username " + user_name).upcase

  Sleep_Until(VerifySuccessAlertMessage(SECURITY_PROFILES_USERSSUCCESSMSG_ID, SECURITY_PROFILES_USERS_SUCCESSMSG_VALUE))
  Sleep_Until(ClickElement('xpath',SECURITY_PROFILES_SUMMARYTAB_ID))
end

def SelectReport(profile_type, table)

  #check profile type
  if profile_type == 'Learning'
    reports_id = LEARNING_REPORTS
    report = "filter_form_lmsReport-select-type"
  end

  data = table.hashes
  data.each do |row|
    case row["section_name"]
    when "HR Core"
      reports_id = HRCORE_REPORTS
      report = "filter_form_hrAuditReport-select-type"
    when "Leave"
      reports_id = LEAVE_REPORTS
      report = "filter_form_leaveReport-select-type"
    end

    case row["report_name"]
    when 'None'
      checkbox_id = report + "_1"
      CheckAndSelect(checkbox_id, row["report_name"])
    when 'All'
      checkbox_id = report + "_0"
      CheckAndSelect(checkbox_id, row["report_name"])
    else
      checkbox_id = report + "_2"

      #check if selected reports is already selected
      CheckAndSelect(checkbox_id, row["report_name"])

      #check if report is already selected
      if(!$driver.find_element(:id, reports_id[row["report_name"]].split("'")[1]).selected?)
        ClickElement('xpath', reports_id[row["report_name"]])
      else
        puts COLOR_BLUE + (row["report_name"] + " is already chosen").upcase
      end
    end
  end
  Sleep_Until(ClickElement('xpath', SAVE_BTN_ID))
end

def CheckAndSelect(checkbox_id, report_type)
  if checkbox_id.include? '_2' then report_type = "selected" end

  if(!$driver.find_element(:id, checkbox_id).selected?)
    ClickElement('id', checkbox_id)
  else
    puts COLOR_BLUE + (report_type + " already chosen").upcase
  end
end