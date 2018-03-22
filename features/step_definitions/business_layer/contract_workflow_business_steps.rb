When(/^I Click On The Assign Contract Button/i) do
  Sleep_Until(ClickAssignContract(ASSIGN_CONTRACT_BTN_ID))
end

And(/^I Search For An "(\w+)" User With No Contract Workflow Assigned/i) do | user_type |
  search_user(user_type)
end

Then(/^I should be able to differentiate user as "(\w+)"/i) do | user_type |
  Sleep_Until(IdentifyUser(user_type))
end