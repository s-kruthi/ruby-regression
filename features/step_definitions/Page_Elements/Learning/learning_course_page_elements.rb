COURSE_NAME_ID = 'elmo_learningbundle_course_fullname'
COURSE_CODE_ID ='elmo_learningbundle_course_shortname'
SAVE_COURSE_ID = 'elmo_learningbundle_course_save'
ADD_COURSE_SECTION = 'add-section'
ADD_ACTIVITY = 'input[name="addsection"]'


ADD_FILE_ID = "//a[@id='addFile']"
LIST_DROPDOWN = "//table//button[@data-toggle='dropdown']"
COURSE_ACTIVITY_TITLE_ID = "//input[contains(@id,'name')]"

############Learning course section###############
LEARNING_EXPAND = "//a[@href='#collapseLearning']"
LEARNING_LIST_PATH = "//span[contains(.,'Courses')]"

CREATE_NEW_COURSE_BTN = "//a[contains(.,'New Course')]"


############Course Details########################
NEW_COURSE_TITLE_ID = "//input[contains(@id,'fullname')]"
NEW_COURSE_CATEGORY_ID = ""
NEW_COURSE_CODE_ID = "//input[contains(@id,'shortname')]"

COURSE_SHOW_SEC_DESC_INPUT_ID = "//select[contains(@id,'settingsShowSectionDescription')]"
COURSE_COMPLETE_INPUT_ID = "//select[contains(@id,'duration')]"
COURSE_RETRAIN_INPUT_ID = "//select[contains(@id,'retrain')]"
COURSE_RETRAIN_OPEN_INPUT_ID = "//select[contains(@id,'retrainOpen')]"
COURSE_AVAILABILITY_INPUT_ID = "//select[contains(@id,'visible')]"
COURSE_CERTIFICATE_TEMPLATE_ID = "//select[contains(@name,'course[cTemplate]')]"
COURSE_SELF_ENROLL_INPUT_ID = "//select[contains(@id,'allowSelfUnenrol')]"
COURSE_VERIFY_SAVE_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"


COURSE_LIST_SEARCH_BOX_ID = "//input[contains(@id,'searchText')]"
COURSE_SEARCH_BTN_ID = "//button[contains(@type,'submit')]"
COURSE_LIST_DROPDOWN = "//table//button[@data-toggle='dropdown']"
COURSE_COPYDELETE_BTN_NAME_ID = "//button[contains(@id,'copyDeleteConfirm')]"
COURSE_DELETE_SUCCESSFUL_ID = "//div[contains(@class,'modal-body')]"

SUB_TAB_SECTION_NAME_ID = "//a[contains(.,'Sections')]"

COURSE_AVAILABILITY_ID = "//select[contains(@id,'elmo_learningbundle_course_visible')]"

# SUB_TAB_APROVAL_NOT_NAME_ID = "//a[contains(.,'Approval Notifications')]" #Legacy Approval Notifications tab name
# SUB_TAB_COURSE_NOT_NAME_ID = "//a[contains(.,'Course Notifications')]" #Legacy Course Notifications tab name

SUB_TAB_APPROVAL_NOTIFICATION_NAME_ID = "//a[contains(.,'Notifications')]"

COURSE_NOT_SAVE_BUTTON_ID = "//button[contains(@id,'submit')]"
COURSE_ADD_A_SECTION_BTN_ID = "//a[contains(.,'Add a section')]"

COURSE_ADD_ACTIVITY_BTN_ID = "//input[contains(@value,'Add an activity')]"

COURSE_SECTION_DROPDOWN_ID = "s2id_section"
COURSE_SECTION_DROPDOWN_SEARCH_ID = "select2-input"
COURSE_SECTION_DROPDOWN_RESULT_INDEX_ID = "select2-result-selectable"

SECTION_TRASH_ICON_ID = "glyphicon-trash"


###ELMO Survey2 activity elements
SURVEY2_CONTENT_DROPDOWN_INPUT_ID = "s2id_elmo_learningbundle_ModSurveytwo_survey2"
SURVEY2_CONTENT_DROPDOWN_INPUT_CLASS = "select2-input"
SURVEY2_CONTACT_DROPDOWN_SEARCH_CLASS = "select2-result-selectable"


###ELMO Survey activity elements
SURVEY_CONFIG_COMPULSORY_ID = 'elmo_learningbundle_modelmosurvey_compulsory'

###Face-to-face activity elements
F2F_SESSION_TITLE_ID = "//h3[contains(.,'')]"
F2F_SESSION_HEADING_ID = "//h4[contains(.,'')]"
F2F_SESSION_SORTING_CLASS_ID = "//a[contains(@class,'sortable')]"
F2F_SESSION_SORTING_ORDER_ID = "//a[contains(@title,'Location')]"
F2F_SESSION_CONFIG_LOCATION_ID = 'elmo_learningbundle_mod_facetoface_sessionTemplate_location'
F2F_SESSION_CONFIG_FACILITATOR_ID = 'elmo_learningbundle_mod_facetoface_sessionTemplate_facilitator'

F2F_SESSION_CONFIG_LOC_INPUT_ID = "//label[text()='Location']/parent::div/following-sibling::div[1]/div[1]/div/child::label[2]"
F2F_SESSION_CONFIG_FAC_INPUT_ID = "//label[text()='Facilitator']/parent::div/following-sibling::div[1]/div[1]/div/child::label[2]"


###F2F session elements#####
F2F_SESSION_ADD_SESSION_BTN = "//a[contains(.,'New Session')]"
F2F_SESSION_ADD_PART_CLASS_ID = "//a[contains(@class,'add-timeslot-action')]"
F2F_SESSION_START_TIME = "//input[contains(@id, 'startTime')]"
F2F_SESSION_FINISH_TIME = "//input[contains(@id, 'finishTime')]"
F2F_SESSION_AVAILABILITY_INPUT_ID = "//select[contains(@id,'availability')]"
F2F_SESSION_MIN_CAPACITY_INPUT_ID = "//input[contains(@id,'minCapacity')]"
F2F_SESSION_MAX_CAPACITY_INPUT_ID = "//input[contains(@id,'maxCapacity')]"
F2F_SESSION_LOCATION_INPUT_ID= "//input[contains(@id,'location')]"
F2F_SESSION_FACILITATOR_INPUT_ID = "//input[contains(@id,'facilitator')]"
# F2F_SESSION_SAVE_CHANGES_ID = "//button[contains(@class, 'confirm-btn')]"


###Quiz activity elements
QUIZ_PASS_MARK_ID = "//input[contains(@id,'passMark-clone')]"
QUESTION_SAVE_BTN_ID = "//button[@class='save-question btn btn-primary']"
ADD_QUESTION_BTN_ID = "//a[@class='btn btn-primary add-question']"


###SCORM package elements
SCORM_TITLE_ID = "//input[contains(@id,'name')]"
SCORM_PASS_MARK_ID = "//input[contains(@id,'cke_1_contents')]"
SCORM_FILE_ID = "addFile"
EDIT_ACTIVITY_BUTTON_CSS = "a[href*='edit-activity']"


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
POST_SAVE_BTN_ID = "//button[contains(@id,'submit')]"


###Notification elements
ADD_NOTIFICATION_BUTTON_ID = "//button[contains(@id,'templateNotification_button_add_template')]"
ADD_NOTIFICATION_TEMP_SAVE_BUTTON_ID = "//button[contains(@id,'submit')]"


###Course Retrain Discrepancy Elements
COURSE_DISCREPANCY_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"
EMPLOYEE_NAME_DROPDOWN_ID = "s2id_filter_form_elmoPms_userEmployeeId"
FILTER_SUBMIT_BTN_ID = "//button[contains(.,'Submit')]"
FILTER_RESULT_VERIFY_TABLE_ID = "elmo-table"
COURSE_BULKDISCREPANCY_FIX_ID = "bulk-retrain-discrepancy-fix" #classname
COURSE_BULKDISCREPANCY_DISABLE_ID = "bulk-retrain-discrepancy-disable"
COURSE_PAGE_DROPDOWN = "//button[@data-toggle='dropdown']"
COURSE_DISCREPANCY_LISTINGS_ID = "select-course-enrolment"


#### course section elements #####
DROPDOWN_KEY_CSS = 'button[data-toggle="dropdown"]'
ENROLLED_USER_LTXT = 'Enrolled Users'
MANUAL_ENROLL_LTXT = 'Manual Enrol Users'
REFRESH_ENROLMENT_LTXT = 'Refresh Enrolments'
REFRESH_ID = 'myModalLabel'
COURSE_CATALOGUE_LTEXT = 'Course Catalogue'
COURSE_REQUESTS_LTEXT = 'Course Requests'
F2F_COURSE_TITLE_CSS = 'span[title="course_section_automation_f2f_shanku"]'
ENROLLED_BUTTON = 'Enrolled'
SIGNUP_BUTTON = 'Sign Up'
COURSE_ENROLMENT_LTEXT = 'Enrolments'
ACTIVITY_NAME = 'activity-name'
SUBMIT_QUIZ_BUTTON = 'submit-quiz'
QUIZ_ANSWER = 'Aliens'
CRS_REQUEST_BTN = 'a[title="Send Enrol Request"]'
CRS_RQST_ID = 'elmo_learningbundle_courseenrolrequest_comment'
CRS_REQUEST_SBMT = 'elmo_learningbundle_courseenrolrequest_submit'
APPROVE_CRS_RQST_CSS = 'a[title="Approve this course request"]'
COURSE_APPROVAL_REASON_FLD= "reason-field"

#### Categories section elements ####
CATEGORIES_BTN = "//a[@href='/admin/course/categories'][contains(text(),'Categories')]"
NEW_CATEGORY_BTN = "//a[contains(string(),'New Category')]"
CATEGORY_NAME_ID = "elmo_learningbundle_category_name"
CATEGORY_FRAME_CSS = "#cke_1_contents > iframe"
CATEGORY_SAVE_ID = "elmo_learningbundle_category_Save"
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


#### Learning activity elements ####
PRECEDING_BREAD_LIST_XPATH = "//ol[@class='breadcrumb']/*[last()]/preceding-sibling::*[1]"


#### Quiz activity elements ####
QUIZ_SAVE_ID = 'modQuiz_save'
COMPLETION_ID = 's2id_elmo_learningbundle_mod_modquiz_quizSettings_completionTerm-clone'
FEEDBACK_ID = 's2id_elmo_learningbundle_mod_modquiz_quizSettings_showFeedback-clone'
MARKER_ID = 's2id_elmo_learningbundle_mod_modquiz_quizSettings_markerType-clone'
QUIZ_SETTING_CLASS = 'select2-result-label'
PASS_MARK_CSS = '#elmo_learningbundle_mod_modquiz_quizSettings_passMark-clone'
COMPLETION_TERMINOLOGY_CSS = '#s2id_elmo_learningbundle_mod_modquiz_quizSettings_completionTerm-clone'
SHOW_FEEDBACK_CSS = '#s2id_elmo_learningbundle_mod_modquiz_quizSettings_showFeedback-clone'
MARKER_CSS = '#s2id_elmo_learningbundle_mod_modquiz_quizSettings_showFeedback-clone'
COMPLETION_NOTIFICATION_CSS = '.toggle[data-toggle]'
