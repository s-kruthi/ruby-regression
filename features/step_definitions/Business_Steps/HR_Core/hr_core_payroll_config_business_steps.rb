And(/^I Enter Payroll Integration Details$/i) do
  Sleep_Until(EnterPayrollIntegrationDetails(HRCORE_PAYROLL_CONFIG_ID_MAP[:integration_dropdown_id], HRCORE_PAYROLL_CONFIG_VALUE_MAP[:integration_dropdown_id]))
end

Then(/^I Should Be Able To Successfully Save Payroll Integration Details$/i) do
  enterSaveBtn(SAVE_BTN_ID)
  VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, HRCORE_PAYROLL_CONFIG_VALUE_MAP[:success_message_value])
end