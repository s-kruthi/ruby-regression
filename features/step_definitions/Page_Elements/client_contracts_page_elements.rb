######### Client Contracts page elements #############################

CLIENT_CONTRACTS_TAB = "//a[contains(.,'Client Contracts')]"
ADD_NEW_CONTRACT_BTN = "//a[contains(.,'Add Contract')]"

CLIENT_CONTRACT_ID = "//input[contains(@id,'contractCode')]"
CLIENT_ACTIVE_STATUS_ID = "//label[contains(.,'Inactive')]"
CONTRACT_START_DATE_ID = "//input[contains(@id,'contractStartDate')]"
CONTRACT_END_DATE_ID = "//input[contains(@id,'contractEndDate')]"
UNLIMITED_USER_ID =  "//label[contains(.,'No')]"
SUBSCRIBER_NUMBER_ID = "//input[contains(@id,'contractSubscriberNumber')]"
CURRENCY_OPTION_ID = "//select[contains(@id,'currency')]"
EXCESS_FEE_ID = "//input[contains(@id,'excessFee')]"
PAYMENT_TERMS_ID = "//textarea[contains(@id,'exceptionsTermsOfPayment')]"
STORAGE_ALLOC_ID = "//input[contains(@id,'storageAllocation')]"
BANDWIDTH_ALLOC_ID = "//input[contains(@id,'clientContractForm_bandwidthAllocation')]"
IS_CC_CLIENT_ID = "//select[contains(@id,'isCreditCardClient')]"
USER_TOLERANCE_ID = "//input[contains(@id,'userTolerance')]"