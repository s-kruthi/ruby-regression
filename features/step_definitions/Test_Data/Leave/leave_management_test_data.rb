LEAVE_RQST_TITLE_VAL = 'Automation Leave Data'
LEAVE_APROVAL_COMMENT = 'Approving For Automation'

# HOLIDAY_STARTDATE = "19/07/2017"
# HOLIDAY_ENDDATE = "19/07/2017"
HOLIDAY_STARTDATE = (DateTime.now).next_month.strftime "%d/%m/%Y"
HOLIDAY_ENDDATE = (DateTime.now).next_month.strftime "%d/%m/%Y"

LEAVE_POLICY_SHOWLSLXYRS_ALERT_MSG = "Show Long Service Leave after x years\nThis value should between 1 to 35."
