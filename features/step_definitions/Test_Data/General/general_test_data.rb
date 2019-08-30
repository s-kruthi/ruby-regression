SELECT_EMPLOYEE_NUMBER = 1
# SELECT_MANAGER = 1
SELECT_START_DATE = 1
SELECT_EXPIRY_DATE = 0
SELECT_TIMEZONE = 1

USE_ACTIVE_INACTIVE_FILTER = 0

NEW_USER_DETAILS_MAP = {
    # employee_number_value: "EMP" + Time.now.strftime("%Y%m%d%H%M%S").to_s,
    email_suffix_value: "@elmodev.com",
    timezone_value: "Sydney",
    country_value: "Australia",
    state_value: "New South Wales",
    mobile_number: "0420330011",
    dateofbirth_value: (DateTime.now).prev_year.strftime("%d/%m/%Y"),
    start_date_value: (DateTime.now).prev_month.strftime("%d/%m/%Y"),
    expiry_date_value: (DateTime.now).next_year.strftime("%d/%m/%Y"),
    end_date_value: (DateTime.now).next_year.strftime("%d/%m/%Y"),
    employee_user_type: "General Employee",
    user_password_value: "Admin1234567",
}

USER_PROFILE_DETAILS_VALUE_MAP = {
    legal_entity: $daos.get_legal_entity_details()[:business_name],#"AU Company",
    cost_centre: "",
    position: "Quality Assurance Tester - Automation",
    department: "Research and Development",
    location: "Sydney"
}

MANAGER_SELECT_INPUT_VALUE = "manager1.scriptonce1"

ADD_USER_SAVE_SUCCESS_VALUE = "User details have been updated!"
EDIT_USER_PROFILE_SAVE_SUCCESS_VALUE = "User profile has been updated!"

EM_USER__NAME_VALUE = "Automation Test User" + Time.now.strftime("%Y%m%d%H%M%S").to_s
EM_USER_RELATIONSHIP_VALUE = "Tester"
EM_USER_ADDRESS_VALUE = "520 Oxford St, Bondi Junction, New South Wales, Australia"
EM_USER_MOBILE_VALUE = "0430000000"
EM_USER_EMAIL_VALUE = "auto.test@elmodev.com"

ACTION_DROPDOWN_INDEX_VALUE = 0

ACTION_DROPDOWN_EDIT_VALUE = "Edit User Profile"
ACTION_DROPDOWN_DEACTIVATE_VALUE = "Deactivate user"

INACTIVE_ATTRIBUTE_TEXT = "User is not active"
USER_NOTIFY_SUCCESS_MSG_VALUE = "Successfully notify user."
ROLE_CHANGE_SUCCESS_MSG_VALUE = "×  User role has been updated!"
USER_ACTIVATE_SUCCESS_MSG_VALUE = "Successfully activate user"
USER_PROFILE_UPDATE_ERR_MSG_VALUE = 'Failed to update user profile!'

USER_COST_CENTRE_SPLITVALSUM_ERR_MSG_VALUE = 'Total cost centre split percentage must be 100%'
USER_COST_CENTRE_SPLITVALDECI_ERR_MSG_VALUE = 'No decimal values are allowed'

MODAL_DELETE_MSG_VALUE = 'Do you really want to delete this item?'
MODAL_DEACTIVATE_MSG_VALUE = 'Do you really want to deactivate this item?'
MODAL_ACTIVATE_MSG_VALUE = 'Do you really want to activate this item?'

NOTIFICATION_DEL_SUCCESS_MSG_VALUE = 'Item has been deleted successfully'
NOTIFICATION_ACTDEACT_SUCCESS_MSG_VALUE = 'Item has been toggled successfully'
NOTIFICATION_DESC_VALUE = "Automation Notification"