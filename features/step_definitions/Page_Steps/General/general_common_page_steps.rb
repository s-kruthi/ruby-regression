# NOTE: This file contains all the methods used in business steps in the general_common_business_steps.rb file
# Any re-usable method should be added/moved in here

# This following method allows creation of 'Position', 'Department' and 'Location'
def EnterNewTypeDetails(arg1)
  case arg1
    when "Position"
      Sleep_Until(SingleSelectFromSelect2Dropdown(POSITION_PARENT_DROPDOWN_ID, SELECT2_DROPDOWN_ID, POSITION_PARENT_DROPDOWN_VALUE, SELECT2_DROPDOWN_RESULT_CLASS))
      EnterInputFieldText(POSITION_TITLE_ID, POSITION_TITLE_VALUE)
      EnterInputFieldText(POSITIONID_ID, POSITIONID_VALUE)
      EnterDescriptionText(POSITION_DESCRIPTION_VALUE, 0)
      EnterDescriptionText(POSITION_SKILL_DESCRIPTION_VALUE, 1)
      ClickOnSaveButton(SAVE_BTN_ID)

    when "Department"
      pending
      
    when "Location"
      pending
  end
end


# This following method verifies the creation of 'Position', 'Department' and 'Location' by checking the success message
def VerifyNewTypeCreated(arg1)
  case arg1
    when "Position"
      VerifySuccessAlertMessage(VERIFY_SAVE_SUCCESSFUL_ID, POSITION_SAVE_SUCCESS_MESSAGE_VALUE)
    
    when "Department"
      pending
    
    when "Location"
      pending
  end
end

