SELECT_MANAGER = 0
SELECT_START_DATE = 1
SELECT_EXPIRY_DATE = 0
SELECT_TIMEZONE = 0


USE_ACTIVE_INACTIVE_FILTER = 0





MANAGER_SELECT_INPUT_VALUE = "manager1.omar1"

NEW_USER_DETAILS_MAP = {
    email_prefix_value: "@elmodev.com",
    timezone_value: "Sydney",
    start_date_value: (DateTime.now).prev_month.strftime "%d/%m/%Y",
    expiry_date_value: (DateTime.now).next_year.strftime "%d/%m/%Y",
    user_password_value: "Admin1234567"
}


ADD_USER_SAVE_SUCCESS_VALUE = "User details have been updated!"


EM_USER__NAME_VALUE = "Automation Test User"
EM_USER_RELATIONSHIP_VALUE = "Tester"
EM_USER_ADDRESS_VALUE = "520 Oxford St, Bondi Junction, New South Wales, Australia"
EM_USER_MOBILE_VALUE = "0430000000"
EM_USER_EMAIL_VALUE = "auto.test@elmodev.com"


USERNAME_SEARCH_VALUE = "auto1.test1"


USERNAME_SEARCH_RESULT_VALUE = "//td[contains(.,'auto1.test1@elmodev.com')]"


ACTION_DROPDOWN_INDEX_VALUE = 4


ACTION_DROPDOWN_EDIT_VALUE = "Edit User Profile"
ACTION_DROPDOWN_DEACTIVATE_VALUE = "Deactivate user"


INACTIVE_ATTRIBUTE_TEXT = "User is not active"
USER_NOTIFY_SUCCESS_MSG_VALUE = "Successfully notify user."
ROLE_CHANGE_SUCCESS_MSG_VALUE = "×  User role has been updated!"
