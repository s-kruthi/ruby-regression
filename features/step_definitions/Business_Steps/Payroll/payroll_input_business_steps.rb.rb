And(/^I navigate To the Input Menu and select "([^"]*)"$/) do |submenu|

  begin
    NavigateMenu(INPUT_MENU)
    case submenu
    when "Termination entries"
      begin
        Wait_For(3)
        submenu_name = "//a[contains(.,'#{submenu}')]"
        GoToAMenu(submenu_name)
      end
    when "Quantity input"
      begin
        submenu_name = "//a[contains(.,'#{submenu}')]"
        GoToAMenu(submenu_name)
      end
    when "Leave entries"
      begin
        submenu_name = "//a[contains(.,'#{submenu}')]"
        GoToAMenu(submenu_name)
      end
    end
  end
end

And(/^I click on Add Termination and fill and Verify all the details in Terminate employee screen$/) do
  ClkAddTermination(ADD_TERM_XPATH)
  SelectTermEmp(XPATH_LOC_TYPE,TERM_NAME_XPATH)
  EnterTermDate(DATE_CLK_XPATH,TERM_DATE_SEL_XPATH)
  InputCheckFields(XPATH_LOC_TYPE,TERM_IMMEDIATELY_XPATH,"Terminate immediately and create an adhoc pay cycle?")
  FieldExistence(XPATH_LOC_TYPE,TERM_TYPE_XPATH)
  InputCheckFields(XPATH_LOC_TYPE,PAY_AL_XPATH,"Pay annual leave?")
  InputCheckFields(XPATH_LOC_TYPE,PAY_LSL_XPATH,"Pay long service leave?")
  InputCheckFields(XPATH_LOC_TYPE,PAY_ETP_XPATH,"Pay ETP?")
  FieldExistence(XPATH_LOC_TYPE,TAX_COMP_XPATH)
  FieldExistence(CSS_LOC_TYPE,TAX_AMT_CSS)
  FieldExistence(XPATH_LOC_TYPE,TAX_FREE_COMP_XPATH)
  FieldExistence(CSS_LOC_TYPE,TAX_FREE_AMT_CSS)
  FieldExistence(XPATH_LOC_TYPE,TAX_WITHELD_XPATH)
  FieldExistence(CSS_LOC_TYPE,TAX_WITHELD_AMT_CSS)
  FieldExistence(XPATH_LOC_TYPE,ETP_CODE_XPATH)
  EnterReason(REASON_CSS,$term_reference)
  FieldExistence(CSS_LOC_TYPE,TERM_CLOSE_CSS)
  FieldExistence(XPATH_LOC_TYPE,SAVE_NEW_XPATH)
  TermSaveClose(SAVE_CLOSE_XPATH)
end

Then(/^I click on ADD TIMESHEET and enter the timesheet details$/) do
  ClkAddTimesheet(ADD_TIMESHEET_XPATH)
  EnterTimeDetails(ADD_TIME_NAME_XPATH,$add_timesheet_emp)
  EnterTimeDetails(TIME_PAYELEMENT_XPATH,$time_pay_element)
  EnterStdHours(INPUT_QTY_CSS,$input_qty)
  FieldExistence(CSS_LOC_TYPE,TIME_RATEOFPAY_CSS)
  FieldExistence(XPATH_LOC_TYPE,TIME_COSTCENTRE_XPATH)
  FieldExistence(CSS_LOC_TYPE,TIME_LOADING_FAC_CSS)
  InputCheckFields(XPATH_LOC_TYPE,TIME_EACH_PAYPERIOD_XPATH,"Process each pay period")
  InputCheckFields(CSS_LOC_TYPE,TIME_CLOSE_CSS,"CLOSE button")

end

Then(/^I click on save to update the timesheet entries$/) do
  ClkSaveTimesheet(TIME_SAVE_CSS)
end


