When(/^I Create A Leave Type Of ([\w\s\/\\w]+) Entitlement Type Named (.*)$/i) do | leave_type, leavetype_name |
  CreateLeaveTypeThroughJmeter(leave_type, leavetype_name)
end


Then(/^I Should See That The Leave Type Is Created Successfully$/i) do
  CheckLeaveTypeExists(@leavetype_title)
end