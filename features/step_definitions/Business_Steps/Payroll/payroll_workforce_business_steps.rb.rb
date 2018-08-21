And(/^I Fill All The Details In TFN Declaration Page And Continue$/) do

  begin
    Sleep_Until(ValidateField(TFN_DECLARATION_CSS,NEW_TFN_DEC_OPTION))
    puts COLOR_BLUE + "Default value TFN status is #{NEW_TFN_DEC_OPTION}"
  end
  Sleep_Until(FillTextField(TFN_NUMBER,NEW_TFN_NO))
  Sleep_Until(SelectDropDown(TITLE_XPATH,NEW_TFN_TITLE))
  Sleep_Until(FillTextField(NAME_CSS,NEW_EMP_NAME))
  Sleep_Until(FillTextField(SURNAME_CSS,NEW_EMP_SURNAME))
  Sleep_Until(FillTextField(OTHERNAME_CSS,NEW_EMP_OTHER_NAME))
  Sleep_Until(FillTextField(ADDR_CSS,NEW_EMP_ADDRESS))
  Sleep_Until(FillTextField(SUBURB_CSS,NEW_EMP_SUBURB))
  Sleep_Until(SelectDropDown(STATE_XPATH, NEW_EMP_STATE))
  Sleep_Until(FillTextField(POSTCODE_CSS,NEW_EMP_POSTCODE))
  Sleep_Until(EnterDateField(CSS_LOC_TYPE,DATE_CLK_CSS,NEW_DOBCAL,DATE_SEL_XPATH))
  Sleep_Until(EnterDateField(CSS_LOC_TYPE,DATE_CLK_CSS,NEW_DOECAL,DATE_SEL_XPATH))
  Sleep_Until(EnterDateField(CSS_LOC_TYPE,DATE_CLK_CSS,NEW_DODCAL,DATE_SEL_XPATH))

  begin
    Sleep_Until(ValidateField(RESIDENTFORTAX_CSS,NEW_RESIDENT_FOR_TAX))
    puts COLOR_BLUE + "Default value of Are you is: #{NEW_RESIDENT_FOR_TAX}"
  end
  Sleep_Until(ValidateToggleText(XPATH_LOC_TYPE,TAX_FREE_THRESHOLD_TOGGLE))
  Sleep_Until(ValidateToggleText(XPATH_LOC_TYPE,HELP_TOGGLE))
  Sleep_Until(ValidateToggleText(XPATH_LOC_TYPE,SFSS_TOGGLE))
  Sleep_Until(ClickContinue(CONTINUE_CSS))
end


And(/^I Fill All The Details In Profile Page And Continue$/) do
  Sleep_Until(SelectDropDown(EMPLYOMENT_XPATH, NEW_EMPLOYMENT))
  Sleep_Until(SelectDropDown(GENDER_XPATH, NEW_GENDER))
  Sleep_Until(SelectDropDown(MARITAL_XPATH, NEW_MARITAL_STATUS))
  begin
    Sleep_Until(ValidateValue(POSITION_XPATH,NEW_POSITION))
    Sleep_Until(ValidateToggleText(XPATH_LOC_TYPE,SFSS_TOGGLE))
  end

  begin
    Sleep_Until(ValidateValue(LOCATION_XPATH,NEW_LOCATION))
    puts COLOR_BLUE + "Default value of Location : Not applicable in the Profile section"
  end

  begin
    Sleep_Until(ValidateValue(PAYMENT_PT_XPATH,NEW_PAYMENT_POINT))
    puts COLOR_BLUE + "Default value of Payment point : Not applicable in the Profile section"
  end
  begin
    Sleep_Until(ValidateValue(ROSTER_XPATH,$roster))
    puts COLOR_BLUE + "Default value of Roster : Not applicable in the Profile section"
  end
  begin
    Sleep_Until(ValidateValue(ABN_XPATH,NEW_ABN))
    puts COLOR_BLUE + "Default value of Employing ABN : Default company in the Profile section"
  end
  Sleep_Until(FillTextField(HOME_TELE_CSS,NEW_HOME_TELEPHONE_NO))

  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,WORK_TELE_CSS))
    puts COLOR_BLUE + "Work Telephone field is present in the Profile section"
  end
  Sleep_Until(FillTextField(MOBILE_CSS,NEW_MOBILE_NO))
  Sleep_Until(FillTextField(EMAIL_CSS,NEW_EMAIL_ADDR))
  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,PREVIOUS_CSS))
    puts COLOR_BLUE + "Previous button is present in the Profile section"
  end
  Sleep_Until(ClickContinue(CONTINUE_CSS))
end


And(/^I Fill All The Details In Pay Details Page And Continue$/) do
  Sleep_Until(SelectDropDown(PAYCYCLE_XPATH, NEW_PAY_CYCLE))
  Sleep_Until(EnterStdHours(STD_WORK_HRS_CSS,NEW_STD_WORK_HRS))
  begin
    Sleep_Until(FieldExistence(XPATH_LOC_TYPE,AUTO_GEN_TIME_XPATH))
    puts COLOR_BLUE + "Automatically generate timesheet entries based on standard work hours?, Toggle is present"
  end
  Sleep_Until(EnterROP(ROP_CSS,NEW_RATE_OF_PAY))
  Sleep_Until(FillTextField(BSB_CSS,NEW_BSB))
  Sleep_Until(FillTextField(ACCOUNT_NO_CSS,NEW_BANK_ACCOUNT_NO))
  Sleep_Until(FillTextField(ACCOUNT_NAME_CSS,NEW_BANK_ACCOUNT_NAME))
  Sleep_Until(FillTextField(LODGE_REF_CSS,NEW_LODGEMENT_REF))
  begin
    if NEW_SELF_SUPER == "TRUE"
      Sleep_Until(ToggleValue(SELF_SUPER_XPATH))
    end
  end
  Sleep_Until(SelectDropDown(SUPER_FUND_XPATH, NEW_SUPER_FUND))
  Sleep_Until(FillTextField(SUPER_MEM_CSS,NEW_SUPER_MEMBER_NO))
  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,PREVIOUS_CSS))
    puts COLOR_BLUE + "Previous button is present in the Pay Details section"
  end
  Sleep_Until(ClickContinue(CONTINUE_CSS))
end


And(/^I Fill All The Details In Leave Details And Continue$/) do
  #"Accrue annual leave?" details
  begin
    if NEW_ACCRUES_ANNUAL == "TRUE"
      Sleep_Until(ToggleValue(ACCRUE_ANNUAL_XPATH))
      Sleep_Until(EnterLeaveBal(ANNUAL_LEAVE_BAL_CSS,NEW_OPENING_ANNUAL_LEAVE_BAL))
  else
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,ANNUAL_LEAVE_BAL_CSS))
    puts COLOR_BLUE + "Opening balance is disabled since there is no annual leave accrual"
    end
  end
  begin
    Sleep_Until(FieldExistence(XPATH_LOC_TYPE,OVERRIDE_ANNUAL_ACCRUAL_XPATH))
    puts COLOR_BLUE + "Accrue Annual Leave: Override accrual days per annum?, Toggle is present"
  end
  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,ANNUAL_DAYS_CSS))
    puts COLOR_BLUE + "Accrue Annual Leave: Annual days field is present in Leave Details section"
  end

  #"Accrue personal leave?" details
  begin
    if NEW_ACCRUES_PERSONAL == "TRUE"
      Sleep_Until(ToggleValue(ACCRUE_PERSONAL_XPATH))
      Sleep_Until(EnterLeaveBal(PERSONAL_BAL_CSS,NEW_OPENING_PERSONAL_LEAVE_BAL))
    else
      Sleep_Until(FieldExistence(CSS_LOC_TYPE,PERSONAL_BAL_CSS))
      puts COLOR_BLUE + "Opening balance is disabled since there is no personal leave accrual"
    end
  end
  begin
    Sleep_Until(FieldExistence(XPATH_LOC_TYPE,OVERRIDE_PERS_ACCRUAL_XPATH))
    puts COLOR_BLUE + "Accrue Personal Leave: Override accrual days per annum?, Toggle is present"
  end
  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,PERSONAL_DAYS_CSS))
    puts COLOR_BLUE + "Accrue Personal Leave: Annual days field is present in Leave Details section"
  end

  #"Accrue long service leave?" details
  begin
    if NEW_ACCRUES_LONG_SER == "TRUE"
      Sleep_Until(ToggleValue(ACCRUE_LONG_SER_XPATH))
      Sleep_Until(EnterLeaveBal(LONG_SER_BAL_CSS,NEW_OPENING_LONG_SER_LEAVE_BAL))
    else
      Sleep_Until(FieldExistence(CSS_LOC_TYPE,LONG_SER_BAL_CSS))
      puts COLOR_BLUE + "Opening balance is disabled since there is no long service leave accrual"
    end
  end
  begin
    Sleep_Until(FieldExistence(XPATH_LOC_TYPE,OVERRIDE_LONG_SER_ACCR_XPATH))
    puts COLOR_BLUE + "Accrue long service Leave: Override accrual days per annum?, Toggle is present"
  end
  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,LONG_SER_DAYS_CSS))
    puts COLOR_BLUE + "Accrue long service Leave: Annual days field is present in Leave Details section"
  end

  #"Accrue time in lieu" details
  begin
    if NEW_ACCRUES_TIME_IN_LIEU == "TRUE"
      Sleep_Until(ToggleValue(ACCRUE_TIME_LIEU_XPATH))
      Sleep_Until(EnterLeaveBal(TIME_LIEU_BAL_CSS,NEW_OPENING_TIME_IN_LIEU_BAL))
    else
      Sleep_Until(FieldExistence(CSS_LOC_TYPE,TIME_LIEU_BAL_CSS))
      puts COLOR_BLUE + "Opening balance is disabled since there is no Time in Lieu leave accrual"
    end
  end
  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,PREVIOUS_CSS))
    puts COLOR_BLUE + "Previous button is present in the Leave Details section"
  end
  Sleep_Until(ClickContinue(CONTINUE_CSS))
end


Then(/^I Confirm To Add New Member$/) do
  Sleep_Until(VerifyMember(MEMBER_CSS))
  begin
    Sleep_Until(FieldExistence(XPATH_LOC_TYPE,AUTO_GEN_MEM_XPATH))
    puts COLOR_BLUE + "Auto Generate Member Toggle is present in the Confirm section"
  end
  Sleep_Until(ValidateToggleText(XPATH_LOC_TYPE,AUTO_GEN_MEM_TOGGLE))

  begin
    Sleep_Until(FieldExistence(CSS_LOC_TYPE,DEF_NEW_MEM))
    puts COLOR_BLUE + "Define New Member number is present and disabled in Confirm section"
  end

  begin
    Sleep_Until(VerifyCreateButtons(CREATE_NEW_CLOSE,"Create and new",CREATE_AND_NEW))
    puts COLOR_BLUE + "Create and New button is present in the Confirm section"
  end

  begin
    Sleep_Until(VerifyCreateButtons(CREATE_NEW_CLOSE,"Create and close",CREATE_AND_CLOSE))
    puts COLOR_BLUE + "Create and Close button is present in the Confirm section"
    Sleep_Until(ClickCreateAndClose(CREATE_NEW_CLOSE,CREATE_AND_CLOSE))
  end
end


Then(/^I Verify The New Member Created$/) do
  sleep(3)
  Sleep_Until(EnterNewEmpName(SEARCH_EMP_XPATH,EMP_NAME))
  Sleep_Until(EmpSearch(XPATH_LOC_TYPE,SEARCH_DRP_XPATH,1))
  Sleep_Until(FetchEmpNameID(XPATH_LOC_TYPE,EMPNAME_ID_XPATH))
end