SELECT_EMPLOYEE_NUMBER = 1
SELECT_MANAGER = 0
SELECT_START_DATE = 1
SELECT_EXPIRY_DATE = 0
SELECT_TIMEZONE = 0


USE_ACTIVE_INACTIVE_FILTER = 0


NEW_USER_DETAILS_MAP = {
    employee_number_value: "EMP" + Time.now.strftime("%Y%m%d%H%M%S").to_s,
    email_prefix_value: "@elmodev.com",
    timezone_value: "Sydney",
    start_date_value: (DateTime.now).prev_month.strftime("%d/%m/%Y"),
    expiry_date_value: (DateTime.now).next_year.strftime("%d/%m/%Y"),
    user_password_value: "Admin1234567",
}


MANAGER_SELECT_INPUT_VALUE = "manager1.scriptonce1"


ADD_USER_SAVE_SUCCESS_VALUE = "User details have been updated!"


EM_USER__NAME_VALUE = "Automation Test User"
EM_USER_RELATIONSHIP_VALUE = "Tester"
EM_USER_ADDRESS_VALUE = "520 Oxford St, Bondi Junction, New South Wales, Australia"
EM_USER_MOBILE_VALUE = "0430000000"
EM_USER_EMAIL_VALUE = "auto.test@elmodev.com"


ACTION_DROPDOWN_INDEX_VALUE = 4


ACTION_DROPDOWN_EDIT_VALUE = "Edit User Profile"
ACTION_DROPDOWN_DEACTIVATE_VALUE = "Deactivate user"


INACTIVE_ATTRIBUTE_TEXT = "User is not active"
USER_NOTIFY_SUCCESS_MSG_VALUE = "Successfully notify user."
ROLE_CHANGE_SUCCESS_MSG_VALUE = "×  User role has been updated!"
USER_ACTIVATE_SUCCESS_MSG_VALUE = "Successfully activate user"
USER_PROFILE_UPDATE_ERR_MSG_VALUE = 'Failed to update user profile!'

USER_COST_CENTRE_SPLITVALSUM_ERR_MSG_VALUE = 'Total cost centre split percentage must be 100%'
USER_COST_CENTRE_SPLITVALDECI_ERR_MSG_VALUE = 'No decimal values are allowed'
