And(/^I Navigate To the Input Menu And Select ([^"]*)$/) do |submenu|

  begin
    Sleep_Until(NavigateMenu(INPUT_MENU))
    submenu_name = "//a[contains(.,'#{submenu}')]"
    case submenu
    when "Termination entries"
      begin
        Wait_For(3)
        Sleep_Until(GoToAMenu(submenu_name))
      end

    when "Quantity input"
      begin
        Sleep_Until(GoToAMenu(submenu_name))
      end

    when "Leave entries"
      begin
        Sleep_Until(GoToAMenu(submenu_name))
      end

    end
  end
end


And(/^I Click On Add Termination And Fill And Verify All The Details In Terminate Employee Screen$/) do
  Sleep_Until(ClickAddTermination(ADD_TERM_XPATH))
  Sleep_Until(SelectTerminationEmployee(XPATH_LOC_TYPE, TERM_NAME_XPATH))
  Sleep_Until(EnterTerminationDate(DATE_CLICK_XPATH, TERM_DATE_SEL_XPATH))
  Sleep_Until(CheckFields(XPATH_LOC_TYPE, TERM_IMMEDIATELY_XPATH, "Terminate immediately and create an adhoc pay cycle?"))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TERM_TYPE_XPATH))
  Sleep_Until(CheckFields(XPATH_LOC_TYPE, PAY_AL_XPATH, "Pay annual leave?"))
  Sleep_Until(CheckFields(XPATH_LOC_TYPE, PAY_LSL_XPATH, "Pay long service leave?"))
  Sleep_Until(CheckFields(XPATH_LOC_TYPE, PAY_ETP_XPATH, "Pay ETP?"))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TAX_COMP_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TAX_AMT_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TAX_FREE_COMP_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TAX_FREE_AMT_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TAX_WITHELD_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TAX_WITHELD_AMT_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,ETP_CODE_XPATH))
  Sleep_Until(EnterReason(REASON_CSS,TERMINATION_REFERENCE))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TERM_CLOSE_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,SAVE_NEW_XPATH))
  Sleep_Until(TerminationSaveClose(SAVE_CLOSE_XPATH))
end


Then(/^I Click On Add Timesheet And Enter The Timesheet Details$/) do
  Sleep_Until(ClickAddTimesheet(ADD_TIMESHEET_XPATH))
  Sleep_Until(EnterTimeDetails(ADD_TIME_NAME_XPATH, ADD_TIMESHEET_EMP))
  Sleep_Until(EnterTimeDetails(TIME_PAYELEMENT_XPATH,TIMESHEET_PAY_ELEMENT))
  Sleep_Until(EnterStdHours(INPUT_QTY_CSS,INPUT_QUANTITY))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TIME_RATEOFPAY_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TIME_COSTCENTRE_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TIME_LOADING_FAC_CSS))
  Sleep_Until(CheckFields(XPATH_LOC_TYPE, TIME_EACH_PAYPERIOD_XPATH, "Process each pay period"))
  Sleep_Until(CheckFields(CSS_LOC_TYPE, TIME_CLOSE_CSS, "CLOSE button"))

end


Then(/^I Click On Save To Update The Timesheet Entries$/) do
  Sleep_Until(ClickSaveTimesheet(TIME_SAVE_CSS))
end