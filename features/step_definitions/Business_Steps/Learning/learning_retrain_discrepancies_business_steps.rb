When(/^I See a List of Discrepancy Courses for Users$/i) do
  discrepancy_course = $daos.get_course_discrepancy_list()

  if !discrepancy_course.nil?
    SearchACourse(COURSE_LIST_SEARCH_BOX_ID, discrepancy_course[:courseName], COURSE_SEARCH_BTN_ID)
  else
    puts COLOR_YELLOW + "Course Discrepancy List not found. Please check the database manually".upcase
    skip_this_scenario
  end
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


And(/^I See a Filtered List of Retrain Discrepancy Course Results for Learner$/i) do
  VerifyFilterResult(FILTER_RESULT_VERIFY_TABLE_ID, "#{@user[:name]}")
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


When(/^I Filter For An Employee With Discrepancies$/i) do
  @user = $daos.get_user_with_course_discrepancy()

  if !@user.nil?
    #create filter for user
    steps %{
    When  I Click On "Create Filter" Button
    And   I Select "Employee Name" Select2 Dropdown As "#{@user[:name]}"
    Then  I Should Be Able to Create a Filter
    }
  else
    puts COLOR_YELLOW + "No Course Discrepancies found for any active user. Please check the database manually".upcase
    skip_this_scenario
  end
end

