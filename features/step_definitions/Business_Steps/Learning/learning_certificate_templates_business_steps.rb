When(/^"([\w\s]+)" Once Less Than "(\d+)" Exist In The Database$/i) do |to_create, number|
  # ToDo make the method scalable (to_create, desired_number, create_number)
  CreateCertTemplateWhenLess(to_create, number)
end

When(/^I Should See The "(\w\S+)" Listed In "(\w+)" Order$/i) do |items, sort|
  CheckTableHeader(TABLE_HEADER_VALUE,PAGE_TITLE_CSS)
  VerifyTableSortedByColumn(TABLE_BODY_CSS, 4, sort, 'datetime')
end

And("I Should Create A Certificate With {runtime name}") do |cert_temp_name|
  @cert_temp_created = cert_temp_name
  WaitForAnElementByCSSAndTouch(CREATE_CERTIFICATE_CSS)
  FillFieldsCreateCertTemp(cert_temp_name)
  WaitForAnElementByCSSAndTouch(SAVE_CERTIFICATE_CSS)
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CERT_TEMP_SAVE_SUCCESSFUL_VALUE))
end

And(/^I Should Edit The Created Certificate$/i) do
  SearchItemNoSelect2(CERTIFICATE_TEMP_SEARCH_CSS, @cert_temp_created, CERTIFICATE_TEMP_SEARCH_BTN_ID)
  WaitForAnElementByCSSAndTouch(EDIT_CERTIFICATE_CSS)
  FillFieldsEditCertTemp(@cert_temp_created, edit='edit')
  Sleep_Until(WaitForAnElementByCSSAndTouch(SAVE_CERTIFICATE_CSS))
  PressConfirm()
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CERT_TEMP_SAVE_SUCCESSFUL_VALUE))
end

And(/^I Should Copy The Created Certificate$/i) do
  SearchItemNoSelect2(CERTIFICATE_TEMP_SEARCH_CSS, @cert_temp_created, CERTIFICATE_TEMP_SEARCH_BTN_ID)
  ClickMenuOfFirstItemFromTable(LIST_DROPDOWN, 'Copy')
  # Todo check the copied template fields equal to DB data enty
  FillFieldsEditCertTemp(@cert_temp_created, edit='copy')
  Sleep_Until(WaitForAnElementByCSSAndTouch(SAVE_CERTIFICATE_CSS))
  Sleep_Until(VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, CERT_TEMP_SAVE_SUCCESSFUL_VALUE))
end

And(/^I Should Search For The Created Certificate$/i) do
  Sleep_Until(SearchItemNoSelect2(CERTIFICATE_TEMP_SEARCH_CSS, @cert_temp_created, CERTIFICATE_TEMP_SEARCH_BTN_ID))
  # Expect to see 2 items as the certificate template has been copied
  VerifySearchResultElmoTable(2, @cert_temp_created)
end