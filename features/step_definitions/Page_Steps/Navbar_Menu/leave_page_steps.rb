def SelectLeaveDate(date_value)
  SelectDate(LEAVE_REQUEST_STARTDATE_ID, date_value)
  SelectDate(LEAVE_REQUEST_ENDDATE_ID, date_value)
end


def EnterLeaveHours(leave_hours)
  ClearField('id', LEAVE_REQUEST_HOURS_ID)
  Sleep_Until(WaitForAnElementByIdAndInputValue(LEAVE_REQUEST_HOURS_ID, leave_hours))
end

