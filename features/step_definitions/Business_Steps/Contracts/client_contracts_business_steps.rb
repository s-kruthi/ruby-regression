When(/^I click on Add New Contract Button$/i) do
  GoToAddClientContractsPage(ADD_NEW_CONTRACT_BTN)
  end

And(/^I Enter New Client Contract Details$/i) do
  Sleep_Until(EnterSubDomainName(CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, SUBDOMAIN_INDEX_VALUE))
  Sleep_Until(EnterContractCode(CLIENT_CONTRACT_ID, CLIENT_CONTRACT_VALUE))
  Sleep_Until(EnterIsActiveStatus(CLIENT_CONTRACT_STATUS_ID))
  Sleep_Until(EnterStartDate(CONTRACT_START_DATE_ID, CONTRACT_START_DATE))
  Sleep_Until(EnterEndDate(CONTRACT_END_DATE_ID, CONTRACT_END_DATE)) if ENTER_CONTRACT_END_DATE == "Yes"
  Sleep_Until(EnterIsUnlimitedUserValue(UNLIMITED_USER_ID)) if UNLIMITED_USER_VALUE == "Yes"
  Sleep_Until(EnterSubscriberUserValue(SUBSCRIBER_NUMBER_ID, SUBSCRIBER_NUMBER_VALUE))
  Sleep_Until(EnterCurrencyValue(CURRENCY_OPTION_ID, CURRENCY_OPTION_VALUE))
  Sleep_Until(EnterExcessFeeValue(EXCESS_FEE_ID, EXCESS_FEE_VALUE))
  Sleep_Until(EnterUserToleranceValue(USER_TOLERANCE_ID, USER_TOLERANCE_VALUE)) if USER_TOLERANCE_VALUE != "10"
  Sleep_Until(EnterProductsSelectionValue(PRODUCT_OPTION_ID, PRODUCT_OPTION_VALUE_1, PRODUCT_OPTION_VALUE_2, PRODUCT_OPTION_VALUE_3))
  Sleep_Until(EnterExceptionsTermsOfPaymentText(PAYMENT_TERMS_ID, PAYMENT_TERMS_VALUE))
  Sleep_Until(EnterStorageAllocationValue(STORAGE_ALLOC_ID, STORAGE_ALLOC_VALUE))
  Sleep_Until(EnterBandwidthAllocationValue(BANDWIDTH_ALLOC_ID, BANDWIDTH_ALLOC_VALUE))
  Sleep_Until(EnterIsCreditCardClientValue(IS_CC_CLIENT_ID, IS_CC_CLIENT_VALUE))
  Sleep_Until(EnterClientContractContactDetails(CONTACT_FIRSTNAME_ID, CONTACT_FIRSTNAME_VALUE, CONTACT_LASTNAME_ID, CONTACT_LASTNAME_VALUE, CONTACT_EMAIL_ID, CONTACT_EMAIL_VALUE, CONTACT_ADDRESS_ID, CONTACT_ADDRESS_VALUE))
 end


Then(/^I Should Be Able To Create A Client Contract$/i) do
  Sleep_Until(CreateAClientContract(FORM_TEMPLATE_SAVE_BTN))
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, VERIFY_SAVE_SUCCESSFUL_VALUE))
end

Then(/^I Should Be Able To Search For A Specific Active Client Contract$/i) do
  Sleep_Until(SearchForAClientContractAndVerify(CONTRACT_SEARCH_ID, CONTRACT_SEARCH_VALUE, CONTRACT_SEARCH_BTN, CONTRACT_SEARCH_RESULT))
end

When(/^I Search For A Specific Active Client Contract$/i) do
  Sleep_Until(SearchForAClientContractAndVerify(CONTRACT_SEARCH_ID, CONTRACT_SEARCH_VALUE, CONTRACT_SEARCH_BTN, CONTRACT_SEARCH_RESULT))
end

Then(/^I Should Be Able To De-Activate A Specific Active Client Contract$/i) do
  Sleep_Until(EditAClientContract(CONTRACT_ACTION_DROPDOWN,3, CONTRACT_DROPDOWN_ACTION_ITEM))
  Sleep_Until(EnterIsActiveStatus(CLIENT_CONTRACT_STATUS_ID))
  Sleep_Until(EnterEndDate(CONTRACT_END_DATE_ID, CONTRACT_END_DATE))
  Sleep_Until(CreateAClientContract(FORM_TEMPLATE_SAVE_BTN))
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, VERIFY_SAVE_SUCCESSFUL_VALUE))
end