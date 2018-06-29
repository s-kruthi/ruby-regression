When(/^I Click On The Enrol Button For A Course$/i) do
  EnrolToCourse()
end


Then(/^I Should See The Success Message For The (Enrolment|Unerollment)$/i) do | enrolment_unerollment |
  if enrolment_unerollment == "Enrolment"
    SUCCESS_MSG_VALUE = ENROL_SUCCESS_MSG_VALUE
  else
    SUCCESS_MSG_VALUE = UNENROLL_SUCCESS_MSG_VALUE
  end
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, SUCCESS_MSG_VALUE))
end


And(/^I Should See That I Am (Enrolled|Unenrolled) To The Course$/i) do | enrolment_unenrollment |
  if enrolment_unenrollment == "Enrolled"
    VerifyEnrolmentToCourse()
  else
    VerifyUnenrollmentToCourse()
  end
end


Given(/^A Course Has Self-Unenroll Set To (Yes|No)$/i) do
  pending
end


And(/^The User Has Enrolled To The Course$/i) do
  pending
end


And(/^I Search For The Course Which Has Self-Unenroll (Enabled|Disabled)$/i) do
  pending
end


When(/^I Click On The Enrolled Button For The Course$/i) do
  pending
end


And(/^I Click On The Unenrol Button In The Course$/i) do
  pending
end
