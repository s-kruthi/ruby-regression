When(/^I Click On The Enrol Button For A Course$/i) do
  EnrolToCourse()
end


Then(/^I Should See The Success Message For The Enrolment$/i) do
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, ENROL_SUCCESS_MSG_VALUE))
end


And(/^I Should See That I Am Enrolled To The Course$/i) do
  VerifyEnrolmentToCourse()
end