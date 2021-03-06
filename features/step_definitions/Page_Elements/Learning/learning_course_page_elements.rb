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


COURSE_SHOW_SEC_DESC_INPUT_ID = "s2id_elmo_learningbundle_course_settingsShowSectionDescription"
COURSE_COMPLETE_UNIT_INPUT_ID = "s2id_elmo_learningbundle_course_restricts_0_durationUnit"
COURSE_COMPLETE_INPUT_ID = "//input[contains(@id,'elmo_learningbundle_course_restricts_0_duration')]"
COURSE_RETRAIN_INPUT_UNIT_ID = "s2id_elmo_learningbundle_course_restricts_0_retrainUnit"
COURSE_RETRAIN_INPUT_ID = "//input[contains(@id,'elmo_learningbundle_course_restricts_0_retrain')]"
COURSE_RETRAIN_OPEN_INPUT_UNIT_ID = "s2id_elmo_learningbundle_course_restricts_0_retrainOpenUnit"
COURSE_RETRAIN_OPEN_INPUT_ID = "//input[contains(@id,'elmo_learningbundle_course_restricts_0_retrainOpen')]"
COURSE_AVAILABILITY_INPUT_ID = "s2id_elmo_learningbundle_course_visible"
COURSE_CERTIFICATE_TEMPLATE_ID = "s2id_elmo_learningbundle_course_cTemplate"
COURSE_SELF_ENROLL_INPUT_ID = "s2id_elmo_learningbundle_course_allowSelfUnenrol"
COURSE_VERIFY_SAVE_SUCCESSFUL_ID = "//div[contains(@class,'alert alert-success')]"


COURSE_LIST_SEARCH_BOX_ID = "//input[contains(@id,'searchText')]"
COURSE_SEARCH_BTN_ID = "//button[contains(@type,'submit')]"
COURSE_LIST_DROPDOWN = "//table//button[@data-toggle='dropdown']"
COURSE_COPYDELETE_BTN_NAME_ID = "//button[contains(@id,'copyDeleteConfirm')]"
COURSE_DELETE_SUCCESSFUL_ID = "//div[contains(@class,'modal-body')]"

SUB_TAB_SECTION_NAME_ID = "//a[contains(.,'Sections')]"


COURSE_AVAILABILITY_ID = "//select[contains(@id,'elmo_learningbundle_course_visible')]"

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


#Commenting this out, as only new Elmo Survey(surveytwo) exists in tmsfull
###ELMO Survey activity elements
# SURVEY_CONFIG_COMPULSORY_ID = 'elmo_learningbundle_modelmosurvey_compulsory'
SURVEY_CONFIG_COMPULSORY_ID = 'elmo_learningbundle_ModSurveytwo_compulsory'


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
F2F_SESSION_DROPDOWN_CSS = ".view-session-info .dropdown-toggle"
F2F_SESSION_DETAILS_CSS = ".view-session-details-modal"
F2F_SESSION_DETAILS_COLUMN_CSS = '.col-md-6'
# F2F_SESSION_SAVE_CHANGES_ID = "//button[contains(@class, 'confirm-btn')]"


###Quiz activity elements
QUIZ_PASS_MARK_ID = "//input[contains(@id,'passMark-clone')]"
QUESTION_SAVE_BTN_ID = "//button[@class='save-question btn btn-primary']"
ADD_QUESTION_BTN_ID = "//a[@class='btn btn-primary add-question']"


###SCORM package elements
# SCORM_TITLE_ID = "//input[contains(@id,'name')]"
SCORM_TITLE_ID = "//input[contains(@name,'modScorm[name]')]"
SCORM_PASS_MARK_ID = "//input[contains(@id,'cke_1_contents')]"
SELECT_FILE_ID = "addFile"
EDIT_ACTIVITY_BUTTON_CSS = "a[href*='edit-activity']"
SCORM_EXTRACTION_MODAL_CSS = '.modal-body.text-center.ng-scope'
SCORM_DELETE_CONFIRM_BTN_ID = "//button[contains(@ng-click,'showConfirmDialog(model)')]"


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
FILTER_SAVE_BTN_ID = "filter_form_elmoPms_SaveFilter"
FILTER_NAME_ID = "filter_form_elmoPms_FilterTitle"
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
BULK_ENROL_BUTTON_CSS = "[title='Bulk Enrol Users']"
CHECK_USER_BULK_ENROL_CSS = '#elmo-table .add-user'
ENROL_SELECTED_USER_BUTTON_CSS = 'enrol-btn'
CONFIRM_ENROL_USERS_BUTTON_CSS = '.process-action[data-action=run]'


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


#### Face to Face Notification Elements ####
F2FNotificationEditButtonCSS = '.templateNotification_button_edit'
NOTIFICATION_ID = 'tr[id*=templateRow]'
NOTIFICATION_PREVIEW_TITLE_XPATH = '//tr[contains(@id, "templateRow")]/*[1]/*[1]'
NOTIFICATION_PREVIEW_DESCRIPTION_XPATH = '//tr[contains(@id, "templateRow")]/*[1]/*[3]'
F2F_SESSION_NOTIFICATION_TITLE_ID = 'templateNotification_title'
F2F_SESSION_NOTIFICATION_DESCRIPTION_ID = 'templateNotification_description'
FACE_TO_FACE_NOTIFICATION_SELECT2_ID = 'select2-chosen-1'
FACE_TO_FACE_NOTIFICATION_EMAIL_SUBJECT_ID = 'templateNotification_channels_0_subject'
FACE_TO_FACE_NOTIFICATION_TOGGLE_BUTTON_XPATH = '//tr[contains(@id, "templateRow")][1]//button[contains(@class, "dropdown-toggle")]'
FACE_TO_FACE_NOTIFICATION_TOGGLE_DELETE_XPATH = '//tr[contains(@id, "templateRow")][1]//ul[@role="menu"]//a[contains(text()," Delete")]'
FACE_TO_FACE_NOTIFICATION_TEMPLATE_SELECT2_ID = 'select2-chosen-2'
FACE_TO_FACE_NOTIFICATION_NAME = 'Course Face-to-Face Confirmation'

AddNotificationNextButtonId = 'templateNotification_button_next'
EditButtonXpathText = '//a[contains(text(),"Edit")]'
ModalDialogBodyTextCSS = '.modal-body .bootbox-body-sr'


#### Enrolments Section elements ####
ENROLMENT_STATUS_FILTER_ID = "//select[@id='courseSearchForm_statusIds']"
ENROLMENT_METHOD_FILTER_ID = "//select[@id='courseSearchForm_enrolmentMethods']"
RETRAIN_TOGGLE_ID = "//input[@name='enrolment-retrain']"
RETRAIN_DISABLE_TOGGLE_ID = '//label[@class="btn btn-primary toggle-on"]'
RETRAIN_ENABLE_TOGGLE_ID = '//label[@class="btn btn-default active toggle-off"]'
ENROLMENT_START_DATE_ID = "enrolmentEdit_timeEnroled"
ENROLMENT_DUE_DATE_ID = "enable-date-timeDue"
ENROLMENT_SUBMIT_BTN = "//button[contains(.,'Submit')]"
ENROLMENT_TOOLTIP_ID = "//span[contains(@data-toggle,'tooltip')]"
COURSE_SCORE_ID = "userProfileCompletionForm_score"


#### Course Certificate Template ####
CERTIFICATE_TEMP_SEARCH_CSS = '#courseCertificateTemplateSearch_searchTerm'
CERTIFICATE_TEMP_SEARCH_BTN_ID = 'button[name="search[submit]"]'
CERT_TEMP_TITLE_FIELD_CSS = 'input[name="course_certificate_template[title]"]'
CERT_TEMP_DESCRIPTION_CSS = 'textarea[name="course_certificate_template[description]"]'
CERT_TEMP_LAYOUT_CSS = 'input[name="course_certificate_template[layout]"]'
CERT_TEMP_BACKGROUND_COLOUR_CSS = 'input[name="course_certificate_template[background_colour]"]'
CREATE_CERTIFICATE_CSS = '#certificateAdd'
SAVE_CERTIFICATE_CSS = '#course_certificate_template_save'
TABLE_HEADER_VALUE = ['Title', 'Description', 'Updated By', 'Last Updated', 'Actions']
PAGE_TITLE_CSS = '#elmo-table thead'
TABLE_BODY_CSS = '#elmo-table tbody'
EDIT_CERTIFICATE_CSS = '.edit-action'
CLEAR_SEARCH_BTN_CSS = 'a[title="Clear search"]'

### Learning Course Face to Face Session Manual enrol Mark attendance ###
SIGN_UP_SELECTED_USERS_ID = 'enrol-btn'
ACTION_TOGGLE_XPATH = "//div[contains(@class, 'pull-right')]//button[contains(@class, 'dropdown-toggle')]"
MARK_ATTENDANCE_BUTTON_XPATH = "//a[@title='Mark Session Attendance']"
BULK_MARK_ATTENDANCE_BUTTON_XPATH = '//div[contains(@class, "btn-group-nowrap")]//a[@title="Mark Session Attendance"]'
CANCEL_SIGNUP_BUTTON_XPATH = "//a[@title='Cancel Sign Up']"
MARK_ATTENDANCE_CONFIRM_BUTTON_ID = 'markAttendanceOk'
ATTENDANCE_DROPDOWN_XPATH = "//*[@id='modFacetofaceSessionAttendanceForm_attendance']"
GRADE_FIELD_XPATH = "//input[@id='modFacetofaceSessionAttendanceForm_score']"
MARK_COMPLETE_CHECKBOX_CSS = '#modFacetofaceSessionAttendanceForm_completed'
TOGGLE_BUTTON_CSS = 'div[data-toggle="toggle"]'

### Learning Course Face to Face Session Bulk enrol Mark attendance ###
SERVICE_FACE_TO_FACE_SESSION_NAME = 'ELMO Face-to-Face'
PAGINATION_CSS = '.pagination-count'
BULK_ACTIONS_TOGGLE_XPATH = "//div[contains(@class, 'btn-group-nowrap')]//button[contains(@class, 'dropdown-toggle')]"