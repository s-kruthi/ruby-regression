When(/^I Click On The Assign Contract Button/i) do
  Sleep_Until(ClickAssignContract(ASSIGN_CONTRACT_BTN_ID))
end

And(/^I Search For An "(\w+)" User With No Contract Workflow Assigned/i) do | user_type |
  search_user(user_type)
end

Then(/^I Should Be Able To Differentiate User As "(\w+)"/i) do | user_type |
  Sleep_Until(IdentifyUser(user_type))
end

And(/^I Choose The User Who Is To Be Assigned A Contract/i) do
  Sleep_Until(ChooseUserForContract(CONFIRM_ASSIGN_CONTRACT_BTN_ID))
end

Then(/^I Should See That The User Has Been Assigned A Contract/i) do
  Sleep_Until(VerifyAssignSuccessMessage(ASSIGN_CONFIRMATION_MSG_CLASS, ASSIGN_CONFIRMATION_MSG_TEXT))
  confirm_user_pending_contract_workflow()
end