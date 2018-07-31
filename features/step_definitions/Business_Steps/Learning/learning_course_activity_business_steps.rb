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