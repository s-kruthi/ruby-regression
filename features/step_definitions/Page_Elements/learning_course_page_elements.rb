ADD_COURSE_BTN = "//a[contains(.,'New Course')]"
COURSE_NAME_ID = 'elmo_learningbundle_course_fullname'
COURSE_CODE_ID ='elmo_learningbundle_course_shortname'
SAVE_COURSE_ID = 'elmo_learningbundle_course_save'
ADD_COURSE_SECTION = 'add-section'
QUIZ_ACTIVITY = "select2-results-dept-1"
ADD_ACTIVITY = 'input[name="addsection"]'
ACTIVITY_DROPDOWN = 's2id_section'



############Learning course section###############
LEARNING_EXPAND = "//a[@href='#collapseLearning']"
LEARNING_LIST_PATH = "//span[contains(.,'Courses')]"

CREATE_NEW_COURSE_BTN = "//a[contains(.,'New Course')]"

NEW_COURSE_TITLE_ID = "//input[contains(@id,'fullname')]"


NEW_COURSE_CATEGORY_ID = ""
NEW_COURSE_CODE_ID = "//input[contains(@id,'shortname')]"


COURSE_RETRAIN_INPUT_ID = "//select[contains(@id,'retrain')]"
COURSE_RETRAIN_OPEN_INPUT_ID = "//select[contains(@id,'retrainOpen')]"
COURSE_COMPLETE_INPUT_ID = "//select[contains(@id,'duration')]"
COURSE_AVAILABILITY_INPUT_ID = "//select[contains(@id,'visible')]"
COURSE_CERTIFICATE_TEMPLATE_ID = "//select[contains(@name,'course[cTemplate]')]"
COURSE_SELF_ENROLL_INPUT_ID = "//select[contains(@id,'allowSelfUnenrol')]"
COURSE_SHOW_SEC_DESC_INPUT_ID = "//select[contains(@id,'settingsShowSectionDescription')]"
COURSE_VERIFY_SAVE_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"


COURSE_LIST_SEARCH_BOX_ID = "//input[contains(@id,'searchText')]"
COURSE_SEARCH_BTN_ID = "//button[contains(@type,'submit')]"
COURSE_LIST_DROPDOWN = "//table//button[@data-toggle='dropdown']"
COURSE_DELETE_BTN_NAME_ID = "//button[contains(@id,'copyDeleteConfirm')]"
COURSE_DELETE_SUCCESSFUL_ID = "//div[contains(@class,'modal-body')]"

SUB_TAB_SECTION_NAME_ID = "//a[contains(.,'Sections')]"

COURSE_AVAILABILITY_ID = "//select[contains(@id,'elmo_learningbundle_course_visible')]"

# SUB_TAB_APROVAL_NOT_NAME_ID = "//a[contains(.,'Approval Notifications')]" #Legacy Approval Notifications tab name
# SUB_TAB_COURSE_NOT_NAME_ID = "//a[contains(.,'Course Notifications')]" #Legacy Course Notifications tab name

SUB_TAB_APPROVAL_NOTIFICATION_NAME_ID = "//a[contains(.,'Notifications')]"

COURSE_NOT_SAVE_BUTTON_ID = "//button[contains(@id,'submit')]"
COURSE_ADD_A_SECTION_BTN_ID = "//a[contains(.,'Add a section')]"

COURSE_ADD_ACTIVITY_BTN_ID = "addactivity"

COURSE_SECTION_DROPDOWN_ID = "s2id_section"
COURSE_SECTION_DROPDOWN_SEARCH_ID = "select2-input"
COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID = "select2-result-selectable"

SECTION_TRASH_ICON_ID = "glyphicon-trash"


###Acknowledgement activity elements
ACK_TITLE_ID = "//input[contains(@id,'name')]"
ACK_SAVE_BTN_ID = "//button[contains(@id,'save')]"


###ELMO Survey activity elements
SURVEY_TITLE_ID = "//input[contains(@id,'name')]"
SURVEY_SAVE_BTN_ID = "//button[contains(@id,'save')]"


###ELMO Survey2 activity elements
SURVEY2_TITLE_ID = "//input[contains(@id,'name')]"
SURVEY2_SAVE_BTN_ID = "//button[contains(@id,'save')]"

SURVEY2_CONTENT_DROPDOWN_INPUT_ID = "s2id_elmo_learningbundle_ModSurveytwo_survey2"
SURVEY2_CONTENT_DROPDOWN_INPUT_CLASS = "select2-input"
SURVEY2_CONTACT_DROPDOWN_SEARCH_CLASS = "select2-result-selectable"


###Face-to-face activity elements
F2F_TITLE_ID = "//input[contains(@id,'name')]"
F2F_SAVE_BTN_ID = "//button[contains(@id,'save')]"
F2F_SESSION_ADD_FILE_ID = "//a[@id='addFile']"
F2F_SESSION_TITLE_ID = "//h3[contains(.,'')]"
F2F_SESSION_HEADING_ID = "//h4[contains(.,'')]"
F2F_SESSION_SORTING_CLASS_ID = "//a[contains(@class,'sortable')]"
F2F_SESSION_SORTING_ORDER_ID = "//a[contains(@title,'Location')]"
F2F_SESSION_CONFIG_LOCATION_ID = 'elmo_learningbundle_mod_facetoface_sessionTemplate_location'
F2F_SESSION_CONFIG_FACILITATOR_ID = 'elmo_learningbundle_mod_facetoface_sessionTemplate_facilitator'

F2F_SESSION_CONFIG_LOC_INPUT_ID = "//label[text()='Location']/parent::div/following-sibling::div[1]/div[1]/div/child::label[2]"
F2F_SESSION_CONFIG_FAC_INPUT_ID = "//label[text()='Facilitator']/parent::div/following-sibling::div[1]/div[1]/div/child::label[2]"


F2F_ACTIVITY_EDIT_LINK = "//a[contains(@href,'/learning/edit-activity/246/397')]"


###Quiz activity elements
QUIZ_TITLE_ID = "//input[contains(@id,'name')]"
QUIZ_PASS_MARK_ID = "//input[contains(@id,'passMark-clone')]"
QUIZ_SAVE_BTN_ID = "//button[contains(.,'Save')]"
QUESTION_SAVE_BTN_ID = "//button[@class='save-question btn btn-primary']"
ADD_QUESTION_BTN_ID = "//a[@class='btn btn-primary add-question']"


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


###Course Retrain Discrepancy Elements
COURSE_DISCREPANCY_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"
EMPLOYEE_NAME_DROPDOWN_ID = "s2id_filter_form_elmoPms_userEmployeeId"
FILTER_SUBMIT_BTN_ID = "//button[contains(.,'Submit')]"
FILTER_RESULT_VERIFY_TABLE_ID = "elmo-table"


#### course section elements #####
DROPDOWN_KEY_CSS = 'button[data-toggle="dropdown"]'
ENROLLED_USER_LTXT = 'Enrolled Users'
MANUAL_ENROLL_LTXT = 'Manual Enrol Users'
REFRESH_ENROLMENT_LTXT = 'Refresh Enrolments'
REFRESH_ID = 'myModalLabel'
COURSE_CATALOGUE_LTEXT = 'Course Catalogue'
F2F_COURSE_TITLE_CSS  = 'span[title="course_section_automation_f2f_shanku"]'
ENROLLED_BUTTON = 'Enrolled'
SIGNUP_BUTTON = 'Sign Up'
COURSE_ENROLMENT_LTEXT = 'Enrolments'
ACTIVITY_NAME = 'activity-name'
SUBMIT_QUIZ_BUTTON = 'submit-quiz'
QUIZ_ANSWER = 'Aliens'


#### Categories section elements ####
CATEGORIES_BTN = "//a[@href='/admin/course/categories'][contains(text(),'Categories')]"
NEW_CATEGORY_BTN = "//a[contains(string(),'New Category')]"
CATEGORY_NAME_ID = "elmo_learningbundle_category_name"
CATEGORY_FRAME_CSS = "#cke_1_contents > iframe"
CATEGORY_SAVE_ID = "elmo_learningbundle_category_Save"
CATEGORY_SUCCESS_XPATH = "//div[@class='alert alert-success']"
CATEGORY_EDIT_XPATH = "//a[@title='Edit Course']"
CATEGORY_VISIBLE_XPATH = "//a[contains(concat(' ', @class, ' '), ' edit-visible ')]"


#### Learning section elements ####
COURSE_SECTION_CSS = ".list-group-item.asection:not(.hide)"
SECTION_NAME_VISIBLE_CSS = ".section-name:not(.section-name-000)"
EDIT_SECTION_CSS = ".edit-section:not(.edit-section-000)"
SECTION_NAME_EDIT_INPUT_CSS = ".section-name-input:not(.hidden)"
DONE_SECTION_CSS = ".done-edit-section:not(.hidden)"
DELETE_SECTION_CSS = ".del-section:not(.del-section-000)"
DELETE_SECTION_CONFIRM_CSS = 'button[data-bb-handler="confirm"]'


#### Learning cost category elements ####
COST_CATEGORY_NAME_ID = "elmo_learningbundle_cost_category_name"
CATEGORY_SECTION_CLASS = "view-course-info"

