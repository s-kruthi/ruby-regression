SEARCH_FIELD_ID = 'searchForm_searchText'
ACTION_BUTTON_PATH = "//button[contains(.,'Actions Toggle Dropdown')]"
ASSIGN_BUTTON_PATH = "//a[contains(@title,'Assign Template')]"
USER_SEARCH_FIELD_ID = 'search-text'
CHECKBOX_ID = 'check_0'
ASSIGN_TO_SCLTD_USR_BTN = "//button[@data-trigger='assign-selected']"
EXISTING_ASSIGNMENT_PATH = "//a[contains(.,'Existing Assignments')]"
VIEW_BUTTON_PATH = "//a[contains(@href,'/documents/view/')]"

############ User Document submission page ######################
STREET_NUM_ID = 'documentForm_form_field_181_street_no'
STREET_ID = 'documentForm_form_field_181_street'
SUBURB_ID = 'documentForm_form_field_181_suburb'
STATE_ID = 'documentForm_form_field_181_state'
POSTCODE_ID = 'documentForm_form_field_181_postcode'
DATE_PICKER_ID = 'documentForm_form_field_184_default'
TODAY_DATE_CLASS = 'today'
SUBMIT_FOR_APPROVAL = "//button[@data-trigger='document-action-submit']"
ENTER_MESSAGE_ID = 'documentSubmitForm_message'
DOCUMENT_COMPLETE = "//button[@name='documentSubmitForm[submit]']"

######### manager document approved #############################

DOCUMENT_APPROVAL_PATH = "//a[contains(@href,'/documents/approval')]"
DOCUMENT_APPROVE_BUTTON = "//button[@data-trigger='document-action-approve']"
ENTER_APPROVAL_MESSAGE_ID = 'documentApproveForm_message'
CONFIRM_APPROVE_BUTTON = "//button[contains(@data-trigger,'document-action-confirm-approve')]"

######### manager document Rejected #############################

DOCUMENT_REJECT_BUTTON = "//button[@data-trigger='document-action-reject']"
ENTER_REJECTION_MESSAGE_ID = 'documentRejectForm_message'
CONFIRM_REJECT_BUTTON = "//button[@data-trigger='document-action-confirm-reject']"

######### Document - Form page elements #############################

DOCUMENTS_EXPAND = "//a[@href='#collapseDocuments']"
DOCUMENTS_LIST_PATH = "//span[contains(.,'Form Templates')]"

CREATE_FORM_TEMPLATE_BTN="//a[contains(.,'Create Form Template')]"

FORM_TEMP_TITLE = "//input[contains(@id,'title')]"
FORM_TEMPLATE_SAVE_BTN="//button[contains(.,'Save')]"

CAT_POS_INDEX_ARROW = "select2-arrow"
CAT_POS_INDEX_CLASS = "select2-result"

FORM_TEMP_SEARCH_BOX = "//input[contains(@id,'searchText')]"
SEARCH_BTN_ID = "//button[contains(@type,'submit')]"
FILE_DROPDOWN = "dropdown-toggle"
FILE_ACTION_ITEM = "Hide"


######### Document - Files page elements #############################

# DOCUMENTS_EXPAND = "//a[@href='#collapseDocuments']"
FILES_LIST_PATH = "//span[contains(.,'Files')]"

ADD_FILE_BTN = "//button[contains(.,'Add File')]"

FILE_TITLE = "//input[contains(@id,'title')]"
FILE_ID = "//ul[contains(.,'Labels')]"
FILE_LABEL_ID = "select2-result"
BROWSE_FILE_ID = "//input[contains(@type,'file')]"
# FILE_SEARCH_BOX = "//input[contains(@id,'searchText')]"
AVAIL_DROPDOWN_OPTION = "//select[@ng-model='selectedAvailability.type']"


FILE_TEMP_SEARCH_BOX = "//input[contains(@placeholder,'Search')]"
FILE_SEARCH_BTN_ID = "//button[contains(@type,'submit')]"
FILE_ACTION_DELETE = "Delete"