HOW_MANY_USERS = 10
SELECT_MANAGER = 0
SELECT_START_DATE = 0
SELECT_EXPIRY_DATE = 0
SELECT_TIMEZONE = 0

NEW_USER_FIRST_NAME_PREFIX = "auto"
NEW_USER_LAST_NAME_PREFIX = "test"
NEW_USER_EMAIL_SUFFIX = "@elmodev.com"

MANAGER_SELECT_INPUT_VALUE = "manager2.omar2"

SELECT_START_DATE_VALUE = (DateTime.now).prev_month.strftime "%d/%m/%Y"
SELECT_EXPIRY_DATE_VALUE = (DateTime.now).next_year.strftime "%d/%m/%Y"
SELECT_TIMEZONE_VALUE = "Sydney"

ADD_USER_SAVE_SUCCESS_VALUE = "User details have been updated!"


EM_USER__NAME_VALUE = "Automation Test User"
EM_USER_RELATIONSHIP_VALUE = "Tester"
EM_USER_ADDRESS_VALUE = "520 Oxford St, Bondi Junction, New South Wales, Australia"
EM_USER_MOBILE_VALUE = "0430000000"
EM_USER_EMAIL_VALUE = "auto.test@elmodev.com"