LEARNING_EXPAND = "//a[@href='#collapseLearning']"
LEARNING_LIST_PATH = "//span[contains(.,'Courses')]"

CREATE_NEW_COURSE_BTN = "//a[contains(.,'New Course')]"

NEW_COURSE_TITLE_ID = "//input[contains(@id,'fullname')]"

NEW_COURSE_CATEGORY_ID = ""
NEW_COURSE_CODE_ID = "//input[contains(@id,'shortname')]"

COURSE_RETRAIN_INPUT_ID = "//select[contains(@id,'retrain')]"
COURSE_COMPLETE_INPUT_ID = "//select[contains(@id,'duration')]"
COURSE_AVAILABILITY_INPUT_ID = "//select[contains(@id,'visible')]"
COURSE_CERTIFICATE_TEMPLATE_ID = "//select[contains(@name,'course[cTemplate]')]"
COURSE_SELF_ENROLL_INPUT_ID = "//select[contains(@id,'allowSelfUnenrol')]"
COURSE_SHOW_SEC_DESC_INPUT_ID = "//select[contains(@id,'settingsShowSectionDescription')]"
COURSE_VERIFY_SAVE_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"

COURSE_LIST_SEARCH_BOX_ID = "//input[contains(@id,'searchText')]"
COURSE_SEARCH_BTN_ID = "//button[contains(@type,'submit')]"
COURSE_LIST_DROPDOWN = "dropdown-toggle"

SUB_TAB_SECTION_NAME_ID = "//a[contains(.,'Sections')]"
#Legacy Approval Notifications tab name
# SUB_TAB_APROVAL_NOT_NAME_ID = "//a[contains(.,'Approval Notifications')]"
SUB_TAB_APROVAL_NOT_NAME_ID = "//a[contains(.,'Notifications')]"

# SUB_TAB_COURSE_NOT_NAME_ID = "//a[contains(.,'Course Notifications')]"
COURSE_NOT_SAVE_BUTTON_ID = "//button[contains(@id,'submit')]"
COURSE_ADD_A_SECTION_BTN_ID = "//a[contains(.,'Add a section')]"

COURSE_ADD_ACTIVITY_BTN_ID = "addactivity"

COURSE_SECTION_DROPDOWN_ID = "select2-choice"
COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID = "select2-result-selectable"

SECTION_TRASH_ICON_ID = "glyphicon-trash"

###Acknowledgement activity elements

ACK_TITLE_ID = "//input[contains(@id,'name')]"
ACK_SAVE_BTN_ID = "//button[contains(@id,'save')]"

###ELMO Survey activity elements

SURVEY_TITLE_ID = "//input[contains(@id,'name')]"
SURVEY_SAVE_BTN_ID = "//button[contains(@id,'save')]"

###Face-to-face activity elements

F2F_TITLE_ID = "//input[contains(@id,'name')]"
F2F_SAVE_BTN_ID = "//button[contains(@id,'save')]"

###Quiz activity elements

QUIZ_TITLE_ID = "//input[contains(@id,'name')]"
QUIZ_PASS_MARK_ID = "//input[contains(@id,'passMark-clone')]"
QUIZ_SAVE_BTN_ID = "//button[contains(.,'Save')]"

###File activity elements

FILE_TITLE_ID = "//input[contains(@id,'name')]"
FILE_SAVE_BTN_ID = "//button[contains(@id,'save')]"
FILE_SELECT_FILE_ID = "//a[contains(.,'Select File')]"

###Label activity elements

LABEL_SAVE_BTN_ID = "//button[contains(@id,'save')]"

###Page activity elements

PAGE_TITLE_ID = "//input[contains(@id,'name')]"
PAGE_SAVE_BTN_ID = "//button[contains(@id,'save')]"

###Post activity elements

POST_TITLE_ID = "//input[contains(@id,'name')]"
POST_SAVE_BTN_ID = "//button[contains(@id,'submit')]"
POST_SELECT_FILE_ID = "//a[contains(.,'Select File')]"

###Notification elements

ADD_NOTIFICATION_BUTTON_ID = "//button[contains(@id,'templateNotification_button_add_template')]"
ADD_NOTIFICATION_TEMP_SAVE_BUTTON_ID = "//button[contains(@id,'submit')]"
