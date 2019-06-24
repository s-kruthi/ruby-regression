# NOTE: This file contains all the methods used in business steps in the common_general_business_steps.rb file
# Any re-usable method should be added/moved in here

# verifies the successful flash message which disappears after 3 seconds.
# syntax: VerifySuccessAlertMessage("//div[contains(@class,'alert alert-success')]", "Course has been saved!")
def VerifySuccessAlertMessage(success_alert_id, success_alert_value)
  Sleep_Until(VerifyAnElementExistByXPath(success_alert_id,success_alert_value))
end

# NOTE: This following method fills out details of 'Position', 'Department' and 'Location'
def EnterNewTypeDetails(arg1)
  case arg1
    when "Position"
      Sleep_Until(SingleSelectFromSelect2Dropdown(POSITION_PARENT_DROPDOWN_ID, SELECT2_DROPDOWN_ID, POSITION_PARENT_DROPDOWN_VALUE, SELECT2_DROPDOWN_RESULT_CLASS))
      EnterInputFieldText(POSITION_TITLE_ID, POSITION_TITLE_VALUE)
      EnterInputFieldText(POSITIONID_ID, POSITIONID_VALUE)
      EnterDescriptionText(POSITION_DESCRIPTION_VALUE, 0)
      EnterDescriptionText(POSITION_SKILL_DESCRIPTION_VALUE, 1)
    
    when "Department"
      Sleep_Until(SingleSelectFromSelect2Dropdown(DEPARTMENT_PARENT_DROPDOWN_ID, SELECT2_DROPDOWN_ID, DEPARTMENT_PARENT_DROPDOWN_VALUE, SELECT2_DROPDOWN_RESULT_CLASS))
      EnterInputFieldText(DEPARTMENT_TITLE_ID, DEPARTMENT_TITLE_VALUE)
      EnterInputFieldText(DEPARTMENTID_ID, DEPARTMENTID_VALUE)
      EnterDescriptionText(DEPARTMENT_DESCRIPTION_VALUE, 0)
  
    when "Location"
      Sleep_Until(SingleSelectFromSelect2Dropdown(LOCATION_PARENT_DROPDOWN_ID, SELECT2_DROPDOWN_ID, LOCATION_PARENT_DROPDOWN_VALUE, SELECT2_DROPDOWN_RESULT_CLASS))
      EnterInputFieldText(LOCATION_TITLE_ID, LOCATION_TITLE_VALUE)
      EnterInputFieldText(LOCATIONID_ID, LOCATIONID_VALUE)
      EnterInputFieldText(LOCATION_ADDRESS_ID, LOCATION_ADDRESS_VALUE)
      EnterDescriptionText(LOCATION_DESCRIPTION_VALUE, 0)
  end
end

# NOTE: This following method verifies the creation of 'Position', 'Department' and 'Location' by checking the success message
def VerifyNewTypeCreated(arg1)
  ClickOnSaveButton(SAVE_BTN_ID)
  
  case arg1
    when "Position"
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, POSITION_SAVE_SUCCESS_MESSAGE_VALUE)
    
    when "Department"
     VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, DEPARTMENT_SAVE_SUCCESS_MESSAGE_VALUE)
  
    when "Location"
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, LOCATION_SAVE_SUCCESS_MESSAGE_VALUE)
  end
end
