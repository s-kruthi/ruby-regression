SELECT_MANAGER = 0
SELECT_START_DATE = 1
SELECT_EXPIRY_DATE = 0
SELECT_TIMEZONE = 0


USE_ACTIVE_INACTIVE_FILTER = 0


NEW_USER_FIRST_NAME_PREFIX = "general.manager"
NEW_USER_LAST_NAME_PREFIX = "omar"
NEW_USER_EMAIL_SUFFIX = "@elmodev.com"


MANAGER_SELECT_INPUT_VALUE = "manager1.omar1"


SELECT_START_DATE_VALUE = (DateTime.now).prev_month.strftime "%d/%m/%Y"
SELECT_EXPIRY_DATE_VALUE = (DateTime.now).next_year.strftime "%d/%m/%Y"
SELECT_TIMEZONE_VALUE = "Sydney"
USER_PASSWORD_VALUE = "Admin1234567"


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

#Select2 dropdown generic data
SELECT2_DROPDOWN_ID = "select2-input"
SELECT2_DROPDOWN_RESULT_CLASS = "select2-result-selectable"