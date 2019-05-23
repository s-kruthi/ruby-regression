class VerificationException < Exception;
end

And(/^I Search For A Specific Assignment Rule Named (.*)$/i) do |rule_name|
  SearchTheAssignmentRule(ENROLMENT_RULE_ID, rule_name, SEARCH_ENTER_CSS)
end

When(/^I Reset The Assignment Rule$/) do
  DeactivateTheSearchedAssignment()
  ReActivateTheSearchedAssignment()
end

And(/^I Enter Assignment Rules Details$/i) do
  Sleep_Until(EnterCourseTitle(ASSIGN_RULE_TITLE_ID, ASSIGN_RULE_TITLE_VALUE))
  Sleep_Until(EnterCourseTitle(ASSIGN_RULE_DESC_ID, ASSIGN_RULE_DESC_VALUE))
end

And(/^I Enter Assignment Rules Condition For "(.*)" As "(.*)"$/i) do |assignment_rule_condition_type, assignment_rule_condition_value|
  Sleep_Until(ClickOnAButtonByLastIndex(ASSIGN_RULE_ADD_COND_ID))
  Sleep_Until(SelectFromDropdown(ASSIGN_RULE_FIELDTYPE_ID, assignment_rule_condition_type))
#Select the correct element ID based on the selected condition type. Only 3 types are supported at present (i.e. Manager, Location, Department)
  begin
    ASSIGN_RULE_FIELDINPUT_ID_MAP.each do |key, value|
      if key.to_s.eql? assignment_rule_condition_type
        ClickOnSelect2MultiSelectDropDownAndInputValue("#{value}", assignment_rule_condition_value)
      end
    end

  rescue Exception => e
    raise VerificationException.new(COLOR_RED + "Please check ASSIGN_RULES_FIELDINPUT_MAP table. Check screenshot under features->Screenshots->#{ENV['CHANNEL']})")
    puts e.message
  end
end

And(/^I Enter Assignment Rules Required Course Named As "(.*)"/i) do |assign_rule_req_course_name|
  course_list_result = $daos.get_assignment_rules_course_list_by_name(assign_rule_req_course_name)
  if !course_list_result.nil?
    ClickOnSelect2MultiSelectDropDownAndInputValue(ASSIGN_RULE_REQ_COURSE_CLASS_ID, course_list_result)
  
  else
    puts COLOR_YELLOW + "Course not found. Please check the database manually".upcase
    skip_this_scenario
  end
end

And(/^I Enter Assignment Rules Recommended Course Named As "(.*)"$/i) do |assign_rule_rec_course_name|
  course_list_result = $daos.get_assignment_rules_course_list_by_name(assign_rule_rec_course_name)
  if !course_list_result.nil?
    ClickOnSelect2MultiSelectDropDownAndInputValue(ASSIGN_RULE_RECMD_COURSE_CLASS_ID, course_list_result)
  
  else
    puts COLOR_YELLOW + "Course Rule not found. Please check the database manually".upcase
    skip_this_scenario
  end
end

Then(/^I Should Be Able To Save An Assignment Rule Successfully$/i) do
  Sleep_Until(ClickOnSaveButton(SAVE_BTN_ID))
  Sleep_Until(ClickOnAButtonByLastIndex(ASSIGN_RULE_SAVE_BUTTON_ID))
  Sleep_Until(VerifyAnElementExistByXPath(ASSIGN_RULE_UNLOCK_BUTTON_ID, ASSIGN_RULE_UNLOCK_BUTTON_VALUE))
end

Then(/^I Should Be Able To (Deactivate) A Specific Assignment Rule Successfully$/i) do |assign_rule_action|

    case assign_rule_action

    when 'Deactivate'
      begin
        Sleep_Until(ClickMenuOfFirstItemFromTable(ASSIGN_RULE_LIST_ACTION_BTN_ID, ASSIGN_RULE_LIST_ACTION_DEACTIVATE))
        Sleep_Until(ClickOnAButtonByLastIndex(ASSIGN_RULE_SAVE_BUTTON_ID))
        Sleep_Until(VerifyAnElementExistByXPath(BACKGROUND_JOB_PROCESS_ID, BACKGROUND_JOB_PROCESS_TEXT_VALUE))
      end
    end
end
