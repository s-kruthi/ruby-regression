
Given(/^I Am On The Employee's Payment Details Section$/i) do
  startWebDriver
  GoToThePage(EMPLOYEE_PROFILE_PAGE)
  EnterUsername(USER_NAME,RECRUITMENT_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,RECRUITMENT_ADMIN_PASSWORD)
  LogInAndWaitForTheDashboard(LOGIN_BUTTON,ADMIN_PROFILE_DROPDOWN)
end

When(/^I Try To View The Payment Details Of An Employee For A Particular Employment Type$/i) do
  GoToPaymentDetailsSectionOfAParticularEmployee(EMPLOYMENT_DETAILS_SECTION)
end

And(/^I Should Be Able To Unmask The Rate And Salary Details By Tapping The Show Button$/i) do
  UnmaskAndViewRateAndSalaryDetailsForTheEmployee()
end

When(/^I Try To View The TFN Details Of An Employee$/i) do
  GoToTaxFileNumberSectionOfAParticularEmployee(TFN_DETAILS_SECTION)
end


And(/^I Should Be Able To Unmask The TFN Number By Tapping The Show Button$/i) do
  UnmaskAndViewTaxFileNumberDetailsForTheEmployee()
end

Then(/^i should be able to view (.*) sub-tab$/i) do |sub_tab_name|

  case sub_tab_name
    when "Activity"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_ACTIVITY_NAME_ID))
      end

    when "Resume"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_RESUME_NAME_ID))
      end

    when "My Career"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_MYCAREER_NAME_ID))
      end

    when "Personal Details"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_PERSONAL_NAME_ID))
      end

    when "Payment Details"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_PAYMENT_NAME_ID))
      end

    when "Recognition"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_RECOGNITION_NAME_ID))
      end
   end
end

And(/^i should be able to click (.*) sub-tab$/i) do |sub_tab_name|

  case sub_tab_name

    when "Activity"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_ACTIVITY_NAME_ID))
      end

    when "Resume"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_RESUME_NAME_ID))
      end

    when "My Career"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_MYCAREER_NAME_ID))
      end

    when "Personal Details"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_PERSONAL_NAME_ID))
      end

    when "Payment Details"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_PAYMENT_NAME_ID))
      end

    when "Recognition"
      begin
        Sleep_Until(click_on_a_sub_tab(SUB_TAB_RECOGNITION_NAME_ID))
      end
  end
end