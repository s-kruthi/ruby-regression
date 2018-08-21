# TFN Declaration screen in New Member Assistant Page
TFN_NUMBER = 'input[placeholder="999-999-999"]'
TITLE_XPATH = '//*[@id="ctl_title"]'
NAME_CSS = 'input[placeholder="Given name"]'
SURNAME_CSS='input[placeholder="Surname"]'
OTHERNAME_CSS='input[placeholder="Other names"]'
ADDR_CSS = 'input[placeholder="Line 1"]'
SUBURB_CSS = 'input[placeholder="Suburb"]'
STATE_XPATH = "//div[@class='col-md-12']//div[@class='row']//div[@class='row']//div[2]//div[4]//select[1]"
POSTCODE_CSS = 'input[placeholder="Post code"]'
TFN_DECLARATION_CSS = 'select[data-bind="value: TypeOfEmployment"]'
DATE_CLK_CSS = 'div[class="dx-dropdowneditor-icon"]'
DATE_SEL_XPATH = '/html/body/div[8]/div/div/div/div[1]/div/div[1]/table/tbody/tr[2]/td[1]'
#RESIDENTFORTAX_XPATH = "//div[@class='col-md-6']//div[6]//div[1]//div[1]//div[1]//span[1]"
RESIDENTFORTAX_CSS = 'select[data-bind="value: ResidentForTax"]'
RESIDENTFORTAX_TOGGLE = "//label[contains(text(),'Australian resident for tax purposes?')]"
TAX_FREE_THRESHOLD_TOGGLE= "//label[contains(text(),'Claim tax free threshold?')]"
TAX_FREE_THRESHOLD_XPATH = "//div[@class='col-md-6']//div[7]//div[1]//div[1]//div[1]//span[1]"
HELP_XPATH ="//div[@class='col-md-6']//div[8]//div[1]//div[1]//div[1]//span[2]"
HELP_TOGGLE = "//label[contains(text(),'Higher Education Loan Program (HELP) debt?')]"
SFSS_XPATH = "//div[@class='col-md-6']//div[9]//div[1]//div[1]//div[1]//span[1]"
SFSS_TOGGLE = "//label[contains(text(),'Financial Supplement debt?')]"
CONTINUE_CSS= 'button[class="btn elmo-btn-blue"]'

#Profile Screen in New Member Assistant Page
EMPLYOMENT_XPATH= "//div[@title='This field is required.']//select[@class='form-control']"
GENDER_XPATH = "//div[@class='col-md-6']//div[2]//select[1]"
MARITAL_XPATH="//div[@class='col-md-6']//div[3]//select[1]"
POSITION_XPATH= "//div[@class='tab-pane active']//div[@class='col-md-6']//div[4]//select[1]"
LOCATION_XPATH= "//div[@class='col-md-6']//div[5]//select[1]"
#PAYMENT_PT_XPATH = "//div[@class='col-md-6']//div[6]//select[1]"
PAYMENT_PT_XPATH = "//div[@class='tab-pane active']//div[@class='col-md-6']//div[6]//select[1]"
ROSTER_XPATH = "//div[@class='col-md-6']//div[7]//select[1]"
ABN_XPATH= "//div[@class='col-md-6']//div[8]//select[1]"
HOME_TELE_CSS = 'input[data-bind="masked: TelephoneHome, mask: \'(99) 9999-9999\'"]'
MOBILE_CSS ='input[id="ctl_mobile"]'
CSS_LOC_TYPE = 'css'
XPATH_LOC_TYPE = 'xpath'
AUTO_GEN_TIME_XPATH = "//div[@class='tab-pane active']//div[2]//div[1]//div[1]//div[1]//div[1]//div[1]//span[2]"
WORK_TELE_CSS = 'input[id="ctl_phone_work"]'
EMAIL_CSS = 'input[id="ctl_email"]'
PREVIOUS_CSS= 'button[class="btn elmo-btn-gray"]'

#Pay Details Screen in New Member Assistant Page
PAYCYCLE_XPATH = "//div[@title='Pay cycle must be selected.']//select[@class='form-control']"
STD_WORK_HRS_CSS = 'input[data-bind="value: StandardHoursPerPay.formatted"]'
ROP_CSS = 'input[data-bind="value: HourlyRop.formatted"]'
HOURLY_RATE_CSS = 'input[data-bind="value: HourlyRop.formatted"]'
BSB_CSS = 'input[data-bind="masked: BsbCode, mask: \'999-999\'"]'
ACCOUNT_NO_CSS = 'input[data-bind="masked: AccountNumber, mask: \'999999999\'"]'
ACCOUNT_NAME_CSS = 'input[data-bind="value: AccountName"]'
LODGE_REF_CSS = 'input[data-bind="value: PayMessage"]'
SELF_SUPER_XPATH = "//div[@class='tab-pane active']//div[5]//div[1]//div[1]//div[1]//div[1]//div[1]//span[2]"
SUPER_FUND_XPATH = "//div[@class='tab-pane active']//div[6]//div[1]//div[1]//select[1]"
SUPER_MEM_CSS = 'input[data-bind="value: SuperMemberNumber"]'

#Leave Details Screen in New Member Assistant Page
ACCRUE_ANNUAL_XPATH = "//div[@class='tab-pane active']//div[1]//div[1]//div[1]//div[1]//div[1]//div[1]//span[2]"
ANNUAL_LEAVE_BAL_CSS = 'input[data-bind="value: AnnualOpening, enable: EmployeeAccruesAnnual"]'
OVERRIDE_ANNUAL_ACCRUAL_XPATH = "//div[@class='tab-pane active']//div[1]//div[3]//div[1]//div[1]//div[1]//div[1]//span[2]"
ANNUAL_DAYS_CSS = 'input[data-bind="value: AnnualDays, enable: EmployeeOverrideAnnual"]'
ACCRUE_PERSONAL_XPATH = "//div[@class='tab-pane active']//div[2]//div[1]//div[1]//div[1]//div[1]//div[1]//span[2]"
PERSONAL_BAL_CSS = 'input[data-bind="value: SickOpening, enable: EmployeeAccruesSick"]'
OVERRIDE_PERS_ACCRUAL_XPATH = "//div[@class='tab-pane active']//div[2]//div[3]//div[1]//div[1]//div[1]//div[1]//span[2]"
PERSONAL_DAYS_CSS = 'input[data-bind="value: PersonalDays, enable: EmployeeOverridePersonal"]'
ACCRUE_LONG_SER_XPATH = "//div[@class='tab-pane active']//div[3]//div[1]//div[1]//div[1]//div[1]//div[1]//span[2]"
LONG_SER_BAL_CSS = 'input[data-bind="value: LongServiceOpening, enable: EmployeeAccruesLongService"]'
OVERRIDE_LONG_SER_ACCR_XPATH = "//div[@class='tab-pane active']//div[3]//div[3]//div[1]//div[1]//div[1]//div[1]//span[2]"
LONG_SER_DAYS_CSS = 'input[data-bind="value: LongServiceDays, enable: EmployeeOverrideLongService"]'
ACCRUE_TIME_LIEU_XPATH = "//div[@class='tab-pane active']//div[4]//div[1]//div[1]//div[1]//div[1]//div[1]//span[2]"
TIME_LIEU_BAL_CSS = 'input[data-bind="value: InLieuOpening, enable: EmployeeAccruesInLieu"]'

#Confirmation Screen in New Member Assistant Page
MEMBER_CSS = 'span[data-bind="text: employeeName"]'
CREATE_NEW_CLOSE = 'button[class = "btn blue"]'
AUTO_GEN_MEM_XPATH = "//div[@class='col-md-12 text-center']//div[@class='form-group']//div//span[@class='bootstrap-switch-handle-on bootstrap-switch-primary'][contains(text(),'Yes')]"
AUTO_GEN_MEM_TOGGLE = "//label[contains(text(),'Auto generate member number?')]"
DEF_NEW_MEM = 'input[data-bind="value: employeeNumber, disable: AutoEmployeeNumber()"]'

#Member Details Page
SEARCH_EMP_XPATH = "//div[@class='portlet-title']//input[@type='text']"
#SEARCH_DRP_XPATH = "//div[@class='dx-template-wrapper dx-item-content dx-list-item-content']"
SEARCH_DRP_XPATH = "//div[@class='dx-template-wrapper dx-item-content dx-list-item-content']"
EMPNAME_ID_XPATH = "//span[@class='caption-helper']"
