MENU_PROFILE_LINK = "//a[contains(@href,'/controlpanel/my-profile')]"
MENU_MY_TEAM_LINK = "//a[contains(.,'My Team')]" #"//a[@href='/controlpanel/team-members')]"
MENU_LEARNING_LINK = "//a[contains(@href,'/learning/my')]"
MENU_LEAVE_LINK = "//a[contains(@href,'/dashboard/leave/my/leave-requests')]"
MENU_DOCUMENTS_LINK = "//a[contains(@href,'/documents')]"
MENU_PERFORMANCE_LINK = "//a[contains(@href,'/dashboard/my-performance')]"
MENU_RECRUITMENT_LINK = "//a[contains(@href,'/controlpanel/recruitment/requisition/requisition')]"
MENU_CAREERS_LINK = "//a[contains(@href,'/controlpanel/recruitment/careers/browse-jobs/')]"
MENU_CALENDER_LINK = "//a[contains(@href,'/controlpanel/calendar/')]"
MENU_CONTRACTS_LINK = "//a[contains(@href,'/contract/')]"
MENU_SUCCESSION_LINK = "//a[contains(@href,'/succession/calibration/')]"
MENU_REPORTS_LINK = "//a[contains(@href,'/report')]"


GENERAL_EXPAND = "//a[@href='#collapseGeneral']"
USERS_LIST_PATH = "//span[contains(.,'Users')]"

ADD_NEW_USER_BTN = "//a[contains(.,' Add New User')]"

NEW_USER_FIRST_NAME_ID = "//input[contains(@id,'firstName')]"
NEW_USER_LAST_NAME_ID = "//input[@id='user_lastName']"
NEW_USER_USERNAME_ID = "//input[@id='user_username']"
NEW_USER_EMAIL_ID = "//input[@id='user_email']"

MANAGER_SELECT_DROPDOWN_ID = "s2id_user_manager"
MANAGER_SELECT_INPUT_ID = "select2-input"
MANAGER_SELECT_RESULT_ID = "select2-result-selectable"

ONBOARDING_EXPAND = "//a[@href='#collapseOnboarding']"
OB_USERS_LIST_PATH = "//span[contains(.,'Onboarding Users')]"
OB_ADD_NEW_USER_BTN = "//a[contains(.,' New Onboarding User')]"

SELECT_START_DATE_ID = "//input[contains(@id,'user_startDate')]"
SELECT_EXPIRY_DATE_ID = "//input[contains(@id,'expiryDate')]"

USER_CREATE_SAVE_BTN_ID = "//button[@id='user_save']"

SELECT_TIMEZONE_ID = "//select[contains(@id,'user_timezone')]"

USER_PASSWORD_ID = "//input[contains(@id,'user_password_first')]"
USER_PASSWORD_RECONFIRM_ID = "//input[contains(@id,'user_password_second')]"

ADD_USER_SAVE_SUCCESS_ID = "//div[contains(@class,'alert alert-success')]"


SUB_TAB_ACTIVITY_NAME_ID = "//a[contains(@href,'/controlpanel/my-profile/personal')]"
SUB_TAB_RESUME_NAME_ID = "//a[contains(@href,'/controlpanel/my-profile/resume')]"
SUB_TAB_MYCAREER_NAME_ID = "//a[contains(@href,'/controlpanel/my-profile/my-career')]"
SUB_TAB_PERSONAL_NAME_ID = "//a[contains(@href,'/controlpanel/my-profile/personal')]"
SUB_TAB_PAYMENT_NAME_ID = "//a[contains(@href,'/controlpanel/my-profile/payment')]"
SUB_TAB_RECOGNITION_NAME_ID = "//a[contains(@href,'/controlpanel/my-profile/recommendation')]"


EDIT_EM_CONTACT_BTN_ID = "//button[contains(@title,'Edit Emergency Contact Details')]"
EDIT_NOK_CONTACT_BTN_ID = "//button[contains(@title,'Edit Next of Kin')]"

ADD_EM_CONTACT_BTN_ID =  "//button[@title='Add Emergency Contact Details']"
ADD_NOK_CONTACT_BTN_ID =  "//button[contains(@title,'Add Next of Kin')]"


EM_USER__NAME_ID = "//input[contains(@id,'name')]"
EM_USER_RELATIONSHIP_ID = "//input[contains(@id,'relationship')]"
EM_USER_ADDRESS_ID = "//input[contains(@id,'autocomplete_address')]"
EM_USER_MOBILE_ID = "mobile"
EM_USER_EMAIL_ID = "//input[contains(@id,'email')]"


SAVE_BTN_ID = "//button[contains(.,'Save')]"
DONE_BTN_ID = "//button[contains(.,'Done')]"


USERNAME_SEARCH_ID = "//input[@placeholder='Search']"


USERNAME_SEARCH_BTN = "//button[contains(@name,'search[submit]')]"
ACTION_DROPDOWN_CLASS_NAME = "dropdown-toggle"


INACTIVE_CLASS_ID = "is-not-active"
INACTIVE_ATTRIBUTE_ID = "data-sinfo"


VERIFY_SAVE_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"

PAGINATION_ID = "//div[@class='pagination-count']"

ADD_NOTE_USERPROFILE_ID = "btnAddNewNote"


#### Onboarding Section ####
ONBOARDING_USER_SETUP_ID = "//span[contains(.,'Onboarding User Setup')]"
ACTIVITY_RESUME_TAB_ID = "//a[contains(.,'Activity And Resume')]"
ONBOARDING_SETUP_TAB_ID = "//a[contains(.,'Onboarding Setup')]"


###Select2 dropdown generic page Elements####
SELECT2_DROPDOWN_ID = "select2-input"
SELECT2_DROPDOWN_RESULT_CLASS = "select2-result-selectable"


###General Assignment Rules Page Elements####
ENROLMENT_RULE_ID = 'enrolmentRuleSearch_name'
SEARCH_ENTER_CSS = 'button[name="search[submit]"]'


ASSIGN_RULE_TITLE_ID = "//input[contains(@id,'enrolmentRuleDetails_name')]"
ASSIGN_RULE_DESC_ID = "//textarea[contains(@id,'enrolmentRuleDetails_description')]"
ASSIGN_RULE_ADD_COND_ID = "//div[contains(.,'Add Condition')]"
ASSIGN_RULE_FIELDTYPE_ID = "//select[@id='enrolmentRuleUserFilters_userFilters_0_fieldType']"
ASSIGN_RULE_REQ_COURSE_CLASS_ID = "elmoPms_courses"
ASSIGN_RULE_RECMD_COURSE_CLASS_ID = "elmoPms_courses_recommended"
ASSIGN_RULE_SAVE_BUTTON_ID = "//button[contains(@id,'confirm-button')]"
ASSIGN_RULE_UNLOCK_BUTTON_ID = "//a[contains(@id,'unlock-button')]"

ASSIGN_RULE_FIELDINPUT_ID_MAP = {
    "Manager": "elmoPms_userManager",
    "Location": "elmoPms_userLocation",
    "Position": "elmoPms_userPosition",
    "Department": "elmoPms_userDepartment",
}

ASSIGN_RULE_LIST_ACTION_BTN_ID = "//table//button[@data-toggle='dropdown']"
BACKGROUND_JOB_PROCESS_ID = "//div[contains(@role,'progressbar')]"