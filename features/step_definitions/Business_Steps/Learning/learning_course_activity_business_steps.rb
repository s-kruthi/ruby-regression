And(/^I Can View The (.*) Named (.*)$/i) do | link_type, link_name |
  case link_type
    when "Learning Course"
      begin
        ClickOnFirstActivity(link_name)
      end
    
    else
      begin
        ClickOnLinkByText("//span[contains(.,'#{link_name}')]")
      end
  end
end

Then(/^I Should Be Able To "(Sign Up|Withdraw)" For That Session$/i) do |self_session_action|
  case self_session_action
    when "Sign Up"
      begin
        Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_SIGNUP_BUTTON_ID))
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_SIGNUP_SUCCESS_VERIFY_MSG))
      end
    
    when "Withdraw"
      begin
        Sleep_Until(WaitForAnElementByXpathAndTouch(F2F_SESSION_WITHDRAW_BUTTON_ID))
        Sleep_Until(WaitForAnElementByXpathAndInputValue(F2F_SESSION_WITHDRAW_MSG_ID, F2F_SESSION_WITHDRAW_MSG_VALUE))
        Sleep_Until(PressConfirm())
        Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, F2F_SESSION_WITHDRAW_SUCCESS_VERIFY_MSG))
      end
  end
end


And(/^I Enter CPD "([^"]*)" Details$/) do |arg|
  case arg
    when "New Category"
      EnterInputFieldText(CPD_CATEGORY_TITLE_ID, CPD_CATEGORY_TITLE_VALUE)
      EnterDescriptionText(CPD_CATEGORY_DESC_TXT_VALUE, 0)
    
    when "New Plan"
      EnterInputFieldText(CPD_PLAN_TITLE_ID, CPD_PLAN_TITLE_VALUE)
      EnterDescriptionText(CPD_PLAN_DESC_TXT_VALUE, 0)
      EnterStartDate(CPD_PLAN_START_DATE_ID, CPD_PLAN_START_DATE)
      EnterEndDate(CPD_PLAN_END_DATE_ID, CPD_PLAN_END_DATE)
      EnterInputFieldText(CPD_PLAN_POINTS_REQ_ID, CPD_PLAN_POINTS_REQ_VALUE)
  end
end


And(/^I Select CPD "(Category|Plan)" Named "([^"]*)"$/) do |arg1, arg2|
  case arg1
    when "Category"
      cpd_category_name_result = $daos.get_visible_cpd_category_by_name(arg2)
      if !cpd_category_name_result.nil?
        puts COLOR_BLUE + "Using CPD Plan '#{cpd_category_name_result[:name]}' with ID #{cpd_category_name_result[:id]}"
        SelectFromDropDown(CPD_PLAN_CATEGORY_DROPDOWN_ID, "#{cpd_category_name_result[:name]}")
      
      else
        puts COLOR_YELLOW + "CPD Category not found. Please check the database manually".upcase
        skip_this_scenario
      end
  
    when "Plan"
      cpd_plan_name_result = $daos.get_visible_cpd_plan_by_name(arg2)
      if !cpd_plan_name_result.nil?
        puts COLOR_BLUE + "Using CPD Plan '#{cpd_plan_name_result[:name]}' with ID #{cpd_plan_name_result[:id]}"
        SelectFromDropDown(CPD_PLAN_CATEGORY_DROPDOWN_ID, "#{cpd_plan_name_result[:name]}")
  
      else
        puts COLOR_YELLOW + "CPD Plan not found. Please check the database manually".upcase
        skip_this_scenario
      end
  end
end


Then(/^I Should Be Able To Add CPD "([^"]*)" Successfully$/i) do |arg|
  case arg
    when "New Category"
      ClickOnSaveButton(SAVE_BTN_ID)
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CPD_CATEGORY_SAVE_SUCCESS_TXT)
    
    when "New Plan"
      ClickOnSaveButton(SAVE_BTN_ID)
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CPD_PLAN_SAVE_SUCCESS_TXT)
  end
end