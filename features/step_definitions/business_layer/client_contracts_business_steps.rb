Given(/^I Have Logged In as an ELMO Admin$/) do
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
  enterIsActiveStatus(CLIENT_ACTIVE_STATUS_ID)
  sleep (1)
  enterStartDate(CONTRACT_START_DATE_ID, CONTRACT_START_DATE)
  sleep (1)
  enterEndDate(CONTRACT_END_DATE_ID, CONTRACT_END_DATE)
  sleep (1)
  enterIsUnlimitedUserValue(UNLIMITED_USER_ID) if UNLIMITED_USER_VALUE == "Yes"
  sleep (1) if UNLIMITED_USER_VALUE == "Yes"
  enterSubscriberUserValue(SUBSCRIBER_NUMBER_ID, SUBSCRIBER_NUMBER_VALUE)
  sleep (1)
  enterCurrencyValue(CURRENCY_OPTION_ID, CURRENCY_OPTION_VALUE)
  sleep (1)

  # enterLicenseFee(LICENSE_FEE_ID, LICENSE_FEE_VALUE)
  #
  # enterExcessFeeValue(EXCESS_FEE_ID, EXCESS_FEE_VALUE.to_i)
  # enterUserToleranceValue(USER_TOLERANCE_VALUE.to_i) if USER_TOLERANCE_VALUE != "10"
  #
  # enterProductsSelectionValue()
  # enterTermsOfPaymentText(PAYMENT_TERMS_ID, PAYMENT_TERMS_VALUE)

  # enterStorageAllocationValue()
  # enterBandwidthAllocationValue()
  # enterIsCreditCardClientValue()
  # enterClientContractContactDetails(CONTACT_FIRSTNAME_ID, CONTACT_FIRSTNAME_VALUE, CONTACT_LASTNAME_ID, CONTACT_EMAIL_ID, CONTACT_EMAIL_VALUE, CONTACT_ADDRESS_ID, CONTACT_ADDRESS_VALUE)
  # createAFormTemplateAndVerify(FORM_TEMPLATE_SAVE_BTN)
end

Then(/^I Should Be Able To Create A Client Contract$/) do
  createAClientContractAndVerify(FORM_TEMPLATE_SAVE_BTN)
  sleep (3)
end


When(/^I Search For A Specific Client Contract$/) do
  searchforAForFormTemplate(FORM_TEMP_SEARCH_BOX, FORM_TEMP_TITLE_TXT, SEARCH_BTN_ID)
end


Then(/^I Should Be Able To Hide A Specific Client Contract$/) do
  hideTheFirstFormTemplatePlanFromTheTable(DROPDOWN,3, ACTION_ITEM)
  $driver.quit
end

