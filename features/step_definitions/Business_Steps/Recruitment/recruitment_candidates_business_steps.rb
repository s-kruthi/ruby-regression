Then (/^I Should See That The Candidate is Created Successfully$/i) do
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CANDIDATE_UPDATE_SUCCESS_MSG))
end

When (/^I Search For The Candidate By Keywords (.*)$/i) do |keyword_name|
  SearchbyNewCandidate(keyword_name)
end

Then (/^I Should See That The Candidate Is Displayed Successfully$/i) do
  ValidateCandidate()
end