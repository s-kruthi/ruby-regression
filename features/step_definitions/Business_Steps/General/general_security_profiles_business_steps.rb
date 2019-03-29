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
    PressEnterOK()
  else
    ClickElement('id', SECURITY_PROFILES_SAVE_ID)
    Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SECURITY_PROFILES_SAVE_SUCCESSMSG_VALUE))
    # VerifyTabs()
  end
end


And(/^I Can Delete Security Profile With No Users$/i) do
  @no_users = true
  DeleteSecurityProfile()
end


And(/^I Can Edit Security Profile With No Users$/i) do
  @no_users = true
  EditSecurityProfile()
end


And(/^I Add (.*) User To The Security Profile$/i) do | user_name |
  AddUserSecurityProfile(user_name)
end


And(/^I Should See That User Is Added To The Profile Successfully$/i) do
  Sleep_Until(ClickElement('id', SECURITY_PROFILES_SUMMARYCONFIRM_ID))
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SECURITY_PROFILES_ADDUSER_SUCCESSMSG_VALUE))
end


And(/^I Can (Edit|Delete) (.*) Security Profile$/i) do | profile_action, profile_name |
  @profile_name = profile_name

  if profile_action == 'Edit'
    EditSecurityProfile()
  else
    DeleteSecurityProfile()
  end
end


And(/^I Go To The (.*) Tab Of The Profile$/i) do | tab_name |
  if tab_name == 'Reports'
    ClickOnASubTab('//a[contains(@href,"type=report")]')
  else
    ClickOnASubTab(SUB_TAB_SECTION_NAME_ID)
  end
end


And(/^I Select Sections For The Users Assigned To Profile$/i) do | table |
  data = table.hashes
  data.each do |row|
    row.each do |key, value|
      case value
        when 'Course Certificate Templates'
        checkbox_id = '//input[@value="courseCertificateTemplate_enabled"]'
      end
      ClickElement('xpath', checkbox_id)
      Sleep_Until(ClickElement('xpath', SAVE_BTN_ID))
    end
  end
end


Then(/^I Should See That The Profile With Filter Details Is Successfully Saved$/i) do
  Sleep_Until(ClickElement('xpath',SECURITY_PROFILES_SUMMARYTAB_ID))
  Sleep_Until(ClickElement('id', SECURITY_PROFILES_SUMMARYCONFIRM_ID))
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SECURITY_PROFILES_ADDUSER_SUCCESSMSG_VALUE))
end


And(/^I Select Reports For The Users Assigned To Profile$/i) do | table |
  #all -> //div[@id='filter_form_lmsReport-select-type']//div[1]
  # none -> //div[@id='filter_form_lmsReport-select-type']//div[2]
  # selected ->//div[@id='filter_form_lmsReport-select-type']//div[3]
  # report 1 checkbox -> //label[@for='filter_form_lmsReport_0']
  # learning_reports  = { "Learning Cost Report" => "//label[@for='filter_form_lmsReport_0']",
  #              "Learner Report" => "//label[@for='filter_form_lmsReport_1']",
  #              "Survey Report" => "//label[@for='filter_form_lmsReport_2']",
  #              "Training Matrix Report" => "//label[@for='filter_form_lmsReport_3']",
  #              "Face-to-Face Session Report" => "//label[@for='filter_form_lmsReport_4']",
  #              "Course Status Report" => "//label[@for='filter_form_lmsReport_5']",
  #              "Continuing Professional Development Report" => "//label[@for='filter_form_lmsReport_6']",
  #              "Question Details Report" => "//label[@for='filter_form_lmsReport_7']",
  #              "Misconceptions Report" =>  "//label[@for='filter_form_lmsReport_8']"}
  # learning_reports["Learning Cost Report"]
  data = table.hashes
  data.each do |row|
    row.each do |key, value|
      case value
      when 'Course Certificate Templates'
        checkbox_id = '//input[@value="courseCertificateTemplate_enabled"]'
      end
      ClickElement('xpath', checkbox_id)
      Sleep_Until(ClickElement('xpath', SAVE_BTN_ID))
    end
  end
end





