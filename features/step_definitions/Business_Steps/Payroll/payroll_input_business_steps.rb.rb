And(/^I Navigate To the Input Menu And Select ([^"]*)$/) do |submenu|

  begin
    NavigateMenu(INPUT_MENU)
    case submenu
    when "Termination entries"
      begin
        Wait_For(3)
        submenu_name = "//a[contains(.,'#{submenu}')]"
        Sleep_Until(GoToAMenu(submenu_name))
      end
    when "Quantity input"
      begin
        submenu_name = "//a[contains(.,'#{submenu}')]"
        Sleep_Until(GoToAMenu(submenu_name))
      end
    when "Leave entries"
      begin
        submenu_name = "//a[contains(.,'#{submenu}')]"
        Sleep_Until(GoToAMenu(submenu_name))
      end
    end
  end
end

And(/^I Click On Add Termination And Fill And Verify All The Details In Terminate Employee Screen$/) do
  Sleep_Until(ClkAddTermination(ADD_TERM_XPATH))
  Sleep_Until(SelectTermEmp(XPATH_LOC_TYPE,TERM_NAME_XPATH))
  Sleep_Until(EnterTermDate(DATE_CLK_XPATH,TERM_DATE_SEL_XPATH))
  Sleep_Until(InputCheckFields(XPATH_LOC_TYPE,TERM_IMMEDIATELY_XPATH,"Terminate immediately and create an adhoc pay cycle?"))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TERM_TYPE_XPATH))
  Sleep_Until(InputCheckFields(XPATH_LOC_TYPE,PAY_AL_XPATH,"Pay annual leave?"))
  Sleep_Until(InputCheckFields(XPATH_LOC_TYPE,PAY_LSL_XPATH,"Pay long service leave?"))
  Sleep_Until(InputCheckFields(XPATH_LOC_TYPE,PAY_ETP_XPATH,"Pay ETP?"))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TAX_COMP_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TAX_AMT_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TAX_FREE_COMP_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TAX_FREE_AMT_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TAX_WITHELD_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TAX_WITHELD_AMT_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,ETP_CODE_XPATH))
  Sleep_Until(EnterReason(REASON_CSS,$term_reference))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TERM_CLOSE_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,SAVE_NEW_XPATH))
  Sleep_Until(TermSaveClose(SAVE_CLOSE_XPATH))
end

Then(/^I Click On Add Timesheet And Enter The Timesheet Details$/) do
  Sleep_Until(ClkAddTimesheet(ADD_TIMESHEET_XPATH))
  Sleep_Until(EnterTimeDetails(ADD_TIME_NAME_XPATH,$add_timesheet_emp))
  Sleep_Until(EnterTimeDetails(TIME_PAYELEMENT_XPATH,$time_pay_element))
  Sleep_Until(EnterStdHours(INPUT_QTY_CSS,$input_qty))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TIME_RATEOFPAY_CSS))
  Sleep_Until(FieldExistence(XPATH_LOC_TYPE,TIME_COSTCENTRE_XPATH))
  Sleep_Until(FieldExistence(CSS_LOC_TYPE,TIME_LOADING_FAC_CSS))
  Sleep_Until(InputCheckFields(XPATH_LOC_TYPE,TIME_EACH_PAYPERIOD_XPATH,"Process each pay period"))
  Sleep_Until(InputCheckFields(CSS_LOC_TYPE,TIME_CLOSE_CSS,"CLOSE button"))

end

Then(/^I Click On Save To Update The Timesheet Entries$/) do
  Sleep_Until(ClkSaveTimesheet(TIME_SAVE_CSS))
end


