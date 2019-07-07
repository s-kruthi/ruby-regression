SEARCH_FIELD_ID = 'searchForm_searchText'
ACTION_BUTTON_CSS = 'button[data-toggle="dropdown"]'
ASSIGN_BUTTON_PATH = "Assign Template"
USER_SEARCH_FIELD_ID = 'search-text'
CHECKBOX_ID = 'check_0'
ASSIGN_TO_SCLTD_USR_BTN = "//button[@data-trigger='assign-selected']"
EXISTING_ASSIGNMENT_PATH = "//a[contains(.,'Existing Assignments')]"
VIEW_BUTTON_PATH = "//a[contains(@href,'/documents/view/')]"

############ User Document submission page ######################
FIRSTNAME_ID = 'documentForm_form_field_71_first_name'
LASTNAME_ID = 'documentForm_form_field_71_last_name'
DATE_PICKER_ID = 'documentForm_form_field_73_default'
STREET_NUM_ID = 'documentForm_form_field_75_street_no'
STREET_ID = 'documentForm_form_field_75_street'
SUBURB_ID = 'documentForm_form_field_75_suburb'
STATE_ID = 'documentForm_form_field_75_state'
POSTCODE_ID = 'documentForm_form_field_75_postcode'
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

CREATE_FORM_BTN = "//a[contains(., 'Create Form')]"

FORM_TEMP_TITLE = "//input[contains(@id,'title')]"
FORM_TEMPLATE_SAVE_BTN="//button[contains(.,'Save')]"

DOCUMENT_CATEGORY_ID = "s2id_formTemplateForm_category"
DOCUMENT_CATEGORY_DROPDOWN_SEARCH_CLASS = "select2-input"
DOCUMENT_CATEGORY_DROPDOWN_RESULT_CLASS = "select2-result-selectable"

FORM_DROPDOWN = "dropdown-toggle"

CAT_POS_INDEX_ARROW = "select2-arrow"
CAT_POS_INDEX_CLASS = "select2-result"

FORM_TEMP_SEARCH_BOX = "//input[contains(@id,'searchText')]"
SEARCH_BTN_ID = "//button[contains(@type,'submit')]"
FILE_DROPDOWN = "dropdown-toggle"

PREFAB_FORM_ID = "prefab_picker_prefab_form_id"
PREFAB_FORM_DROPDOWN_SEARCH_CLASS = "form-control"
PREFAB_FORM_DROPDOWN_RESULT_CLASS = "form-control"


######### Document - Document Categories elements #############################

CREATE_DOCUMENT_CATEGORY_BTN = "//a[contains(.,'Add Category')]"
DOCUMENTS_CAT_LIST_PATH = "//span[contains(.,'Document Categories')]"

DOCUMENT_CATEGORY_TITLE_ID = "//input[contains(@id,'title')]"

DOCUMENT_CAT_SAVE_SUCCESS_ID = "//div[contains(@class,'alert alert-success')]"

DOC_CAT_DROPDOWN = "dropdown-toggle"

######### Document - Files page elements #############################

FILES_LIST_PATH = "//span[contains(.,'Files')]"

ADD_FILE_BTN = "//button[contains(.,'Add File')]"

FILE_TITLE = "//input[contains(@id,'title')]"
FILE_ID = "//ul[contains(.,'Labels')]"

FILE_CATEGORY_ID = "s2id_category"

FILE_LABEL_ID = "select2-result"


FILE_TEMP_SEARCH_BOX = "//input[contains(@placeholder,'Search')]"
FILE_SEARCH_BTN_ID = "//button[contains(@type,'submit')]"

FILE_SAVE_SUCCESSFUL_ID = "//div[contains(.,'Save successful')]"

FILE_SEARCH_BOX = "//input[contains(@id,'searchText')]"
AVAIL_DROPDOWN_OPTION = "//select[@ng-model='selectedAvailability.type']"
##### Document admin #############
DOCUMENT_PATH = "//a[@aria-controls='collapseDocuments']"
DOC_TEXT = 'Documents'
FORM_PATH = "//span[contains(.,'Forms')]"
FORM_TEXT = 'Forms'

