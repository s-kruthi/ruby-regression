Given(/^I Have Logged In as an Finance Manager$/) do
  startWebDriver
  GoToThePage(ADMIN_SETUP_LANDING_PAGE)
  EnterUsername(USER_NAME,ELMO_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,ELMO_ADMIN_PASSWORD)

  loginToSystem(LOGIN_BUTTON)

  GoToThePage(ADMIN_SETUP_LANDING_PAGE)
  EnterUsername(USER_NAME,ELMO_SETUP_ADMIN_USERNAME)
  EnterPassword(PASS_WORD,ELMO_SETUP_ADMIN_PASSWORD)
  loginToSystem(LOGIN_BUTTON)

end


And(/^I Go To The Contracts Section$/) do
  GoToThePage(CLIENT_CONTRACTS_LANDING_PAGE)
  goToClientContractsTab(CLIENT_CONTRACTS_TAB)
end


When(/^I click on Add New Contract Button$/) do
  goToAddClientContractsPage(ADD_NEW_CONTRACT_BTN)
  end

And(/^I Enter New Client Contract Details$/) do
  enterSubDomainName(CAT_POS_INDEX_ARROW, 0, CAT_POS_INDEX_CLASS, SUBDOMAIN_INDEX_VALUE)
  enterContractCode(CLIENT_CONTRACT_ID, CLIENT_CONTRACT_VALUE)
  enterIsActiveStatus(CLIENT_CONTRACT_STATUS_ID)
  sleep (1)

  enterStartDate(CONTRACT_START_DATE_ID, CONTRACT_START_DATE)
  sleep (1)

  enterEndDate(CONTRACT_END_DATE_ID, CONTRACT_END_DATE) if ENTER_CONTRACT_END_DATE == "Yes"
  sleep (1)  if ENTER_CONTRACT_END_DATE == "Yes"

  enterIsUnlimitedUserValue(UNLIMITED_USER_ID) if UNLIMITED_USER_VALUE == "Yes"
  sleep (1) if UNLIMITED_USER_VALUE == "Yes"

  enterSubscriberUserValue(SUBSCRIBER_NUMBER_ID, SUBSCRIBER_NUMBER_VALUE)
  enterCurrencyValue(CURRENCY_OPTION_ID, CURRENCY_OPTION_VALUE)
  sleep (1)

  enterExcessFeeValue(EXCESS_FEE_ID, EXCESS_FEE_VALUE)

  enterUserToleranceValue(USER_TOLERANCE_ID, USER_TOLERANCE_VALUE) if USER_TOLERANCE_VALUE != "10"

  enterProductsSelectionValue(PRODUCT_OPTION_ID, PRODUCT_OPTION_VALUE_1, PRODUCT_OPTION_VALUE_2, PRODUCT_OPTION_VALUE_3)

  enterExceptionsTermsOfPaymentText(PAYMENT_TERMS_ID, PAYMENT_TERMS_VALUE)

  enterStorageAllocationValue(STORAGE_ALLOC_ID, STORAGE_ALLOC_VALUE)

  enterBandwidthAllocationValue(BANDWIDTH_ALLOC_ID, BANDWIDTH_ALLOC_VALUE)

  enterIsCreditCardClientValue(IS_CC_CLIENT_ID, IS_CC_CLIENT_VALUE)

  enterClientContractContactDetails(CONTACT_FIRSTNAME_ID, CONTACT_FIRSTNAME_VALUE, CONTACT_LASTNAME_ID, CONTACT_LASTNAME_VALUE, CONTACT_EMAIL_ID, CONTACT_EMAIL_VALUE, CONTACT_ADDRESS_ID, CONTACT_ADDRESS_VALUE)
 end

Then(/^I Should Be Able To Create A Client Contract$/) do
  createAClientContract(FORM_TEMPLATE_SAVE_BTN)
  sleep (1)
  verifySuccessMessage(VERIFY_SAVE_SUCCESSFUL_ID, VERIFY_SAVE_SUCCESSFUL_VALUE)
  $driver.quit
end

Then(/^I Should Be Able To Search For A Specific Active Client Contract$/) do
  searchForAclientContractAndVerify(CONTRACT_SEARCH_ID, CONTRACT_SEARCH_VALUE, CONTRACT_SEARCH_BTN, CONTRACT_SEARCH_RESULT)
  sleep(1)
  $driver.quit
end

When(/I Search For A Specific Active Client Contract$/) do
  searchForAclientContractAndVerify(CONTRACT_SEARCH_ID, CONTRACT_SEARCH_VALUE, CONTRACT_SEARCH_BTN, CONTRACT_SEARCH_RESULT)
end

Then(/^I Should Be Able To De-Activate A Specific Active Client Contract$/) do
  editAclientContract(CONTRACT_ACTION_DROPDOWN,3, CONTRACT_DROPDOWN_ACTION_ITEM)
  sleep (1)
  enterIsActiveStatus(CLIENT_CONTRACT_STATUS_ID)
  enterEndDate(CONTRACT_END_DATE_ID, CONTRACT_END_DATE)
  sleep (1)
  createAClientContract(FORM_TEMPLATE_SAVE_BTN)
  sleep (1)
  verifySuccessMessage(VERIFY_SAVE_SUCCESSFUL_ID, VERIFY_SAVE_SUCCESSFUL_VALUE)
  sleep (1)
  $driver.quit
end
