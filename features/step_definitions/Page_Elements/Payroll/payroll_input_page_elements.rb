#Termination Page
ADD_TERM_XPATH = "//button[contains(text(),'Add termination')]"
TERM_NAME_XPATH = "//div[@id='employeeSelectWidget']//input[@type='text']"
DATE_CLICK_XPATH = "//div[@title='This field is required.']//div[@class='col-md-6']//div[@class='dx-dropdowneditor-icon']"
TERM_DATE_SEL_XPATH = "/html[1]/body[1]/div[10]/div[1]/div[1]/div[1]/div[1]/div[1]/div[1]/table[1]/tbody[1]/tr[2]/td[1]/span[1]"
TERM_IMMEDIATELY_XPATH = "//div[@class='col-md-6']//div[2]//div[1]//div[1]//div[1]//span[2]"
TERM_TYPE_XPATH = "//div[@class='mt-radio-inline']"
PAY_ETP_XPATH = "//div[@class='col-md-6']//div[6]//div[1]//div[1]//div[1]//span[2]"
TAX_COMP_XPATH = "//div[@class='col-md-6']//div[1]//div[1]//select[1]"
TAX_AMT_CSS = 'input[data-bind="value: ETPTaxableComponent, enable: PayEtp()"]'
TAX_FREE_COMP_XPATH = "//div[@class='col-md-6']//div[2]//div[1]//select[1]"
TAX_FREE_AMT_CSS = 'input[data-bind="value: ETPTaxFreeComponent, enable: PayEtp()"]'
TAX_WITHELD_XPATH = "//div[@class='col-md-6']//div[3]//div[1]//select[1]"
TAX_WITHELD_AMT_CSS = 'input[data-bind="value: ETPTaxWithheld, enable: PayEtp()"]'
ETP_CODE_XPATH = "//div[@class='col-md-6']//div[4]//div[1]//select[1]"
REASON_CSS = 'textarea[data-bind="value: Reason"]'
TERM_CLOSE_CSS = 'button[data-bind="click: onCloseModal"]'
SAVE_NEW_XPATH = "//button[contains(text(),'Save and new')]"
SAVE_CLOSE_XPATH = "//button[contains(text(),'Save and close')]"
TERM_SEARCH = "//div[@class='dx-datagrid-search-panel dx-texteditor dx-searchbox dx-show-clear-button dx-widget dx-textbox dx-texteditor-empty']"
TERM_RECORD_CSS = 'table[class="dx-datagrid-table dx-datagrid-table-fixed"]'
PAY_AL_XPATH = "//div[@class='col-md-6']//div[4]//div[1]//div[1]//div[1]//span[2]"
PAY_LSL_XPATH = "//div[@class='col-md-6']//div[5]//div[1]//div[1]//div[1]//span[2]"

#Add Timesheet Page
ADD_TIMESHEET_XPATH = "//button[contains(text(),'Add timesheet')]"
ADD_TIME_NAME_XPATH = "//div[@class='col-md-10']//div[@id='employeeSelectWidget']//input[@type='text']"
TIME_PAYELEMENT_XPATH = "//div[@class='col-md-10']//div[@id='payElementSelectWidget']//input[@type='text']"
INPUT_QTY_CSS = 'input[data-bind="value: inputQty.formatted, disable: $parent.isPaid"]'
TIME_RATEOFPAY_CSS = 'input[data-bind="value: ROP.formatted, disable: $parent.isPaid"]'
TIME_COSTCENTRE_XPATH = "//div[@id='costCentreSelectWidget']//input[@type='text']"
TIME_LOADING_FAC_CSS = 'input[data-bind="value: loadingFactor.formatted"]'
TIME_EACH_PAYPERIOD_XPATH = "//div[@class='bootstrap-switch bootstrap-switch-wrapper bootstrap-switch-off bootstrap-switch-animate']//span[@class='bootstrap-switch-handle-off bootstrap-switch-default'][contains(text(),'No')]"
TIME_CLOSE_CSS = 'button[data-bind="click: onClosePayElementInputModal"]'
TIME_SAVE_CSS = 'button[data-bind="enable: model.isValid(),click: onSavePayItem"]'