When(/^I See a List of Discrepancy Courses for Users$/i) do
  discrepancy_course = $daos.get_course_discrepancy_list()
  SearchACourse(COURSE_LIST_SEARCH_BOX_ID, discrepancy_course, COURSE_SEARCH_BTN_ID)
end


Then(/^I Should Be Able To (.*) Of A Specific Course$/i) do |retrain_action|
  ClickMenuOfFirstItemFromTable(COURSE_LIST_DROPDOWN, retrain_action)

  case retrain_action
    when "Fix Retrain"
      begin
        PressEnterConfirm()
        sleep (1)
        Sleep_Until(VerifySuccessAlertMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_FIX_SUCCESSFUL_VALUE))
      end

    when "Disable Retrain"
      begin
        PressEnterConfirm()
        sleep (1)
        Sleep_Until(VerifySuccessAlertMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_DISABLE_SUCCESSFUL_VALUE))
      end
  end
end


And(/^I See a Filtered List of Retrain Discrepancy Course Results for Learner (.*)$/i) do |learner_name|
  VerifyFilterResult(FILTER_RESULT_VERIFY_TABLE_ID, "#{learner_name.to_s}")
end


And(/^I Choose To (Fix Retrain|Disable Retrain) From The Actions Menu$/i) do | retrain_action |
  ClickMenuOfFirstItemFromTable(COURSE_PAGE_DROPDOWN, retrain_action)
  PressEnterConfirm()
  sleep (2)
end


Then(/^I Should Be Able To See The Success Message For (Fix|Disable) Retrain For Users$/i) do | retrain_action |
  case retrain_action
    when "Fix"
      Sleep_Until(VerifySuccessAlertMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_FIX_SUCCESSFUL_VALUE))
    when "Disable"
      Sleep_Until(VerifySuccessAlertMessage(COURSE_DISCREPANCY_SUCCESSFUL_ID, COURSE_DISCREPANCY_DISABLE_SUCCESSFUL_VALUE))
  end
end

