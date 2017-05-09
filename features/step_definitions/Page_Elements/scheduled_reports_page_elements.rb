######### Scheduled Reports page elements #############################

REPORTS_TAB_ID = "//a[contains(.,'Reports')]"
SCH_REPORTS_TAB_ID = "//a[contains(.,'Scheduled Reports')]"
SCHD_REPORTS_BTN_ID = "//button[contains(.,'Scheduled Report')]"
SCHD_REPORTS_NAME_ID = "//input[contains(@placeholder,'Title')]"
SCHD_REPORTS_FREQ_ID = "//select[contains(@data-ng-model,'report.frequency')]"
SCHD_REPORTS_START_DATE_ID = "//input[contains(@name,'startDate')]"
SCHD_REPORTS_END_DATE_ID = "//input[contains(@name,'endDate')]"

REPORTS_NAME_ID = "//div[@id='s2id_autogen5']"
FILTER_NAME_ID = "//div[@id='s2id_autogen221']"

REPORTS_LEVEL_ID =  "//select[@ng-model='report.parameters[parameter.name]']"

REPORTS_FORMAT_ID =  "//select[contains(@data-ng-model,'report.format')]"
SHOW_ALL_DATA_ID =  "//select[contains(@data-ng-model,'report.showAllData')]"

REPORTS_SAVE_BTN_ID = "//button[contains(.,'Save')]"

REPORTS_VERIFY_SAVE_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"

RECIPIENT_FIELD_ID = "//input[contains(@id,'autogen8')]"
RECIPIENT1_RESULT_ID = "//span[contains(.,'test1')]"
RECIPIENT2_RESULT_ID = "//span[contains(.,'test2')]"

# CLIENT_CONTRACTS_TAB = "//a[contains(.,'Client Contracts')]"
# ADD_NEW_CONTRACT_BTN = "//a[contains(.,'Add Contract')]"
#
# CLIENT_CONTRACT_ID = "//input[contains(@id,'contractCode')]"
# CLIENT_CONTRACT_STATUS_ID = "//label[contains(.,'Inactive')]"
# CONTRACT_START_DATE_ID = "//input[contains(@id,'contractStartDate')]"
# CONTRACT_END_DATE_ID = "//input[contains(@id,'contractEndDate')]"
# UNLIMITED_USER_ID =  "//label[contains(.,'No')]"
# SUBSCRIBER_NUMBER_ID = "//input[contains(@id,'contractSubscriberNumber')]"
# CURRENCY_OPTION_ID = "//select[contains(@id,'currency')]"
# EXCESS_FEE_ID = "//input[contains(@id,'excessFee')]"
# PAYMENT_TERMS_ID = "//textarea[contains(@id,'exceptionsTermsOfPayment')]"
# STORAGE_ALLOC_ID = "//input[contains(@id,'storageAllocation')]"
# BANDWIDTH_ALLOC_ID = "//input[contains(@id,'clientContractForm_bandwidthAllocation')]"
# IS_CC_CLIENT_ID = "//select[contains(@id,'isCreditCardClient')]"
# USER_TOLERANCE_ID = "//input[contains(@id,'userTolerance')]"
# PRODUCT_OPTION_ID = "//select[contains(@id,'clientContractForm_products')]"
#
# CONTACT_FIRSTNAME_ID = "//input[contains(@id,'contactFirstName')]"
# CONTACT_LASTNAME_ID = "//input[contains(@id,'contactLastName')]"
# CONTACT_EMAIL_ID = "//input[contains(@id,'contactEmail')]"
# CONTACT_ADDRESS_ID = "//textarea[contains(@id,'contactAddress')]"
#
# CONTRACT_SEARCH_ID = "//input[@id='clientContractSearch_searchText']"
# CONTRACT_SEARCH_RESULT = "//td[contains(.,'Staging4')]"
#
# CONTRACT_SEARCH_BTN = "//button[contains(@type,'submit')]"
#
# CONTRACT_ACTION_DROPDOWN = "dropdown-toggle"
#
# VERIFY_SAVE_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"
