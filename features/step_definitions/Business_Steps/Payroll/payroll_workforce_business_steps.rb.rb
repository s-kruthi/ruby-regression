And(/^I Fill All The Details In TFN Declaration Page And Continue$/) do

  begin
    ValidateField(TFN_DECLARATION_CSS,$tfn_decl)
    puts "Default value TFN status is #{$tfn_decl}"
  end
  FillTextField(TFN_NUMBER,$tfn)
  SelectDrpDwn(TITLE_XPATH,$title)
  FillTextField(NAME_CSS,$name)
  FillTextField(SURNAME_CSS,$surname)
  FillTextField(OTHERNAME_CSS,$othername)
  FillTextField(ADDR_CSS,$addr)
  FillTextField(SUBURB_CSS,$suburb)
  SelectDrpDwn(STATE_XPATH,$state)
  FillTextField(POSTCODE_CSS,$postcode)
  EnterDateField(CSS_LOC_TYPE,DATE_CLK_CSS,$dobcal,DATE_SEL_XPATH)
  EnterDateField(CSS_LOC_TYPE,DATE_CLK_CSS,$doecal,DATE_SEL_XPATH)
  EnterDateField(CSS_LOC_TYPE,DATE_CLK_CSS,$dodcal,DATE_SEL_XPATH)

  begin
    ValidateField(RESIDENTFORTAX_CSS,$residentfortax)
    puts "Default value of Are you is: #{$residentfortax}"
  end
  ValidateToggleText(XPATH_LOC_TYPE,TAX_FREE_THRESHOLD_TOGGLE)
  ValidateToggleText(XPATH_LOC_TYPE,HELP_TOGGLE)
  ValidateToggleText(XPATH_LOC_TYPE,SFSS_TOGGLE)
  ClickContinue(CONTINUE_CSS)
end

And(/^I Fill All The Details In Profile Page And Continue$/) do
  SelectDrpDwn(EMPLYOMENT_XPATH,$employment)
  SelectDrpDwn(GENDER_XPATH,$gender)
  SelectDrpDwn(MARITAL_XPATH,$marital)
  begin
    ValidateValue(POSITION_XPATH,$position)
    ValidateToggleText(XPATH_LOC_TYPE,SFSS_TOGGLE)
  end

  begin
    ValidateValue(LOCATION_XPATH,$location)
    puts COLOR_BLUE + "Default value of Location : Not applicable in the Profile section"
  end

  begin
    ValidateValue(PAYMENT_PT_XPATH,$paymentpoint)
    puts COLOR_BLUE + "Default value of Payment point : Not applicable in the Profile section"
  end
  begin
    ValidateValue(ROSTER_XPATH,$roster)
    puts "Default value of Roster : Not applicable in the Profile section"
  end
  begin
    ValidateValue(ABN_XPATH,$abn)
    puts "Default value of Employing ABN : Default company in the Profile section"
  end
  FillTextField(HOME_TELE_CSS,$hometel)

  begin
    FieldExistence(CSS_LOC_TYPE,WORK_TELE_CSS)
    puts "Work Telephone field is present in the Profile section"
  end
  FillTextField(MOBILE_CSS,$mobile)
  FillTextField(EMAIL_CSS,$email)
  begin
    FieldExistence(CSS_LOC_TYPE,PREVIOUS_CSS)
    puts "Previous button is present in the Profile section"
  end
  ClickContinue(CONTINUE_CSS)

end

And(/^I Fill All The Details In Pay Details Page And Continue$/) do
  SelectDrpDwn(PAYCYCLE_XPATH,$paycycle)
  EnterStdHours(STD_WORK_HRS_CSS,$stdworkhrs)
  begin
    FieldExistence(XPATH_LOC_TYPE,AUTO_GEN_TIME_XPATH)
    puts "Automatically generate timesheet entries based on standard work hours?, Toggle is present"
  end
  EnterROP(ROP_CSS,$rop)
  FillTextField(BSB_CSS,$bsb)
  FillTextField(ACCOUNT_NO_CSS,$account_no)
  FillTextField(ACCOUNT_NAME_CSS,$account_name)
  FillTextField(LODGE_REF_CSS,$lodge_ref)
  begin
    if $self_super == "TRUE"
    ToggleValue(SELF_SUPER_XPATH)
    end
  end
  SelectDrpDwn(SUPER_FUND_XPATH,$super_fund)
  FillTextField(SUPER_MEM_CSS,$super_member_no)
  begin
    FieldExistence(CSS_LOC_TYPE,PREVIOUS_CSS)
    puts "Previous button is present in the Pay Details section"
  end
  ClickContinue(CONTINUE_CSS)

end

And(/^I Fill All The Details In Leave Details And Continue$/) do
  #"Accrue annual leave?" details
  begin
    if $accrues_annual == "TRUE"
    ToggleValue(ACCRUE_ANNUAL_XPATH)
    EnterLeaveBal(ANNUAL_LEAVE_BAL_CSS,$open_annual_leave_bal)
  else
    FieldExistence(CSS_LOC_TYPE,ANNUAL_LEAVE_BAL_CSS)
    puts "Opening balance is disabled since there is no annual leave accrual"
    end
  end
  begin
    FieldExistence(XPATH_LOC_TYPE,OVERRIDE_ANNUAL_ACCRUAL_XPATH)
    puts "Accrue Annual Leave: Override accrual days per annum?, Toggle is present"
  end
  begin
    FieldExistence(CSS_LOC_TYPE,ANNUAL_DAYS_CSS)
    puts "Accrue Annual Leave: Annual days field is present in Leave Details section"
  end

  #"Accrue personal leave?" details
  begin
    if $accrues_personal == "TRUE"
      ToggleValue(ACCRUE_PERSONAL_XPATH)
      EnterLeaveBal(PERSONAL_BAL_CSS,$open_personal_leave_bal)
    else
      FieldExistence(CSS_LOC_TYPE,PERSONAL_BAL_CSS)
      puts "Opening balance is disabled since there is no personal leave accrual"
    end
  end
  begin
    FieldExistence(XPATH_LOC_TYPE,OVERRIDE_PERS_ACCRUAL_XPATH)
    puts "Accrue Personal Leave: Override accrual days per annum?, Toggle is present"
  end
  begin
    FieldExistence(CSS_LOC_TYPE,PERSONAL_DAYS_CSS)
    puts "Accrue Personal Leave: Annual days field is present in Leave Details section"
  end

  #"Accrue long service leave?" details
  begin
    if $accrues_lon_serv == "TRUE"
      ToggleValue(ACCRUE_LONG_SER_XPATH)
      EnterLeaveBal(LONG_SER_BAL_CSS,$open_long_serv_leave_bal)
    else
      FieldExistence(CSS_LOC_TYPE,LONG_SER_BAL_CSS)
      puts "Opening balance is disabled since there is no personal leave accrual"
    end
  end
  begin
    FieldExistence(XPATH_LOC_TYPE,OVERRIDE_LONG_SER_ACCR_XPATH)
    puts "Accrue Personal Leave: Override accrual days per annum?, Toggle is present"
  end
  begin
    FieldExistence(CSS_LOC_TYPE,LONG_SER_DAYS_CSS)
    puts "Accrue Personal Leave: Annual days field is present in Leave Details section"
  end

  #"Accrue time in lieu" details
  begin
    if $accrues_time_lieu == "TRUE"
      ToggleValue(ACCRUE_TIME_LIEU_XPATH)
      EnterLeaveBal(TIME_LIEU_BAL_CSS,$open_time_lieu_leave_bal)
    else
      FieldExistence(CSS_LOC_TYPE,TIME_LIEU_BAL_CSS)
      puts "Opening balance is disabled since there is no personal leave accrual"
    end
  end
  begin
    FieldExistence(CSS_LOC_TYPE,PREVIOUS_CSS)
    puts "Previous button is present in the Leave Details section"
  end
  ClickContinue(CONTINUE_CSS)
end

Then(/^I Confirm To Add New Member$/) do
  VerifyMember(MEMBER_CSS)
  begin
    FieldExistence(XPATH_LOC_TYPE,AUTO_GEN_MEM_XPATH)
    puts COLOR_BLUE + "Auto Generate Member Toggle is present in the Confirm section"
  end
  ValidateToggleText(XPATH_LOC_TYPE,AUTO_GEN_MEM_TOGGLE)

  begin
    FieldExistence(CSS_LOC_TYPE,DEF_NEW_MEM)
    puts COLOR_BLUE + "Define New Member number is present and disabled in Confirm section"
  end

  begin
    VerifyCreateButtons(CREATE_NEW_CLOSE,"Create and new",$create_new_index)
    puts COLOR_BLUE + "Create and New button is present in the Confirm section"
  end

  begin
    VerifyCreateButtons(CREATE_NEW_CLOSE,"Create and close",$create_close_index)
    puts COLOR_BLUE + "Create and Close button is present in the Confirm section"

    ClickCreateAndClose(CREATE_NEW_CLOSE,$create_close_index)
  end

end

Then(/^I Verify The New Member Created$/) do
  Wait_For(3)
  EnterNewEmpName(SEARCH_EMP_XPATH,$emp_name)
  EmpSearch(XPATH_LOC_TYPE,SEARCH_DRP_XPATH,1)
  FetchEmpNameID(XPATH_LOC_TYPE,EMPNAME_ID_XPATH)
end