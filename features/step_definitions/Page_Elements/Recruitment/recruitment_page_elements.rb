#Requisition Page UI Elements
REQUISITIONS_TAB = "//a[contains(@href, 'open-requisition')]"
NEW_REQUISITION_BTN = "//button[contains(.,'New Requisition')]"
REQUISITION_POS_INDEX_ARROW = "select2-arrow"
REQUISITION_POS_INDEX_CLASS = "select2-result"
REQUISITION_LOC_INDEX_ARROW = "select2-arrow"
REQUISITION_LOC_INDEX_CLASS = "select2-result"
REQUISITION_NUMBER_OF_POSITION = "//input[@name='numberOfPositions']"
REQUISITION_CALENDER_DUEDATE = "//input[@name='dueDate']"
REQUISITION_CALENDER_DONE_BTN = "//button[@ng-click='isOpen = false']"
REQUISITION_SUBMIT_BTN = "//button[contains(.,'Submit')]"


#Recruitment Candidates Page UI Elements
NEW_CANDIDATE_BTN_XPATH = "//a[contains(.,'New Candidate')]"
FIRSTNAME_INPUT_ID = "candidateProfileForm_firstName"
LASTNAME_INPUT_ID = "candidateProfileForm_lastName"
EMAIL_INPUT_ID = "candidateProfileForm_email"
HOMEPHONE_INPUT_ID = "candidateProfileForm_homePhone"
MOBILE_INPUT_ID = "candidateProfileForm_mobile"
ADDRESS_INPUT_ID = "candidateProfileForm_addressLine1"
SUBURB_INPUT_ID = "candidateProfileForm_suburb"
POSTCODE_INPUT_ID = "candidateProfileForm_postcode"
COUNTRY_INPUT_ID = "candidateProfileForm_country"
STATE_INPUT_ID = "candidateProfileForm_state"
TIMEZONE_INPUT_ID = "candidateProfileForm_timezone"
PASSWORD_INPUT_ID = "candidateProfileForm_password_first"
PASSWORD_CONFIRM_INPUT_ID = "candidateProfileForm_password_second"
SAVE_NEW_CANDIDATE_BTN = "candidateProfileForm_save"
CANDIDATE_NAME_CLASS = "user-profile-brief"

##### Requisition job ad creation ######
MY_REQ_LINK = 'Automation-testing'
JOB_AD_LINK = 'Job Ads'
NEW_JOB_POST_LINK = 'New Post'
SALARY_FROM = 'input[ng-model="jobAd.salaryFrom"]'
SALARY_TO = 'input[ng-model="jobAd.salaryTo"]'
JB_START_DATE_BTN = 'button[ng-click="openStartDate($event)"]'
JB_START_DATE = 'button[ng-click="today()"]'
JB_END_DATE = 'input[ng-model="jobAd.endDate"]'
INT_CAR_BTN = 'isInternalEnable'
EXT_CAR_BTN = 'toggleExternalEnable'
SAVE_JOB = 'button[ng-click="save(addEditForm)"]'
################### status Under requisition ##################
NEW_STATUS = '[ng-click="applyStatusFilter(data.status_new)"]'
ADD_TO_NOTSUITABLE = 'a[ng-click="markNotSuitable([jobapp.id])"]'


#### Open Requisitions page ####
REQUISITION_LIST_SEARCH_BOX_ID = '//label[@id="searchDesc"]//following::input[@type="text"]'
REQUISITION_SEARCH_BTN_ID = '//button[@ng-click="getRequisitions()"]'
REQUISITION_STATUS_INDEX_ID= "select2-choices"
REQUISITION_STATUS_RESULT_ID = "select2-result-selectable"
REQUISITION_SEARCH_RESULT_TITLE_ID = '//a[contains(@class,"requisition-title")]'
REQUISITION_ACTION_DROPDOWN_ID = '//div[@class="btn-group btn-group-dropdown"]'

REQUISITION_OVERVIEW_SUBTAB_ID = '//a[contains(@href, "overview")]'
REQUISITION_JOBADS_SUBTAB_ID = '//a[@role="menuitem"][contains(@href, "jobad")]'
REQUISITION_INTERVIEWS_SUBTAB_ID = '//a[@role="menuitem"][contains(@href, "interviews")]'
REQUISITION_PANELREVIEWS_SUBTAB_ID = '//a[@role="menuitem"][contains(@href, "panel-review")]'
REQUISITION_OFFERS_SUBTAB_ID = '//a[@role="menuitem"][contains(@href, "offers")]'
REQUISITION_COSTS_SUBTAB_ID = '//a[@role="menuitem"][contains(@href, "costs")]'


#### Approval Page ####
REQUISITION_APPROVAL_SEARCH_ID = '//input[@ng-model="search.keyword"]'


#### Requisition Candidates page ####
CANDIDATE_ACTION_DROPDOWN_ID = '//div[contains(@class,"btn-group ng-scope")]'
CANDIDATE_SEARCH_BOX_ID = 'recruitmentApplication_keyword'
CANDIDATE_SEARCH_BUTTON_ID = '//button[@id="recruitmentApplication_keyword"]'
REQUISITION_CANDIDATE_SELECTALL_ID = "//input[@id='cbSelectAll']"
REQUISTION_CANDIDATE_SELECTCHKBX_ID = '//input[@type="checkbox"]'

REQUISITION_PAGE_DROPDOWN_ID = '//button[@ng-click="getJobApplicationIds()"]'
REQUISITION_EMAILCANDIDATE_SUBJ_ID = '//input[@name="subject"]'
REQUISITION_EMAILCANDIDATE_ATCH_ID = '//button[@ng-click="addAttachment()"]'
REQUISITION_EMAILCANDIDATE_SEND_ID = '//button[@ng-click="send(emailForm)"]'


#### Offer page ####
OFFER_MESSAGE_BUTTON_ID = '//button[contains(.,"Message")]'


#### Requisition Overview Page ####
REQUISITION_ADD_NOTE_BUTTON_ID = '//button[contains(.,"Note")]'
REQUISITION_NOTE_ADDEDBY_ID = '//span[contains(@class, "text-bold")]'
REQUISITION_MODAL_ID = '//div[@class="bootbox-body"]'
REQUISITION_NOTE_SAVE_BUTTON_ID = 'requisitionNoteSaveBtn'
REQUISITION_NOTE_ID = 'requisitionNote'
REQUISITION_NOTE_CHARCOUNTER_ID = 'requisitionNotecharCountNumber'
REQUISITION_NOTE_EDIT_BUTTON_ID = '//button[@ng-click="toggleRequisitionNote(true)" and contains(.,"Edit")]'
REQUISITION_NOTE_DELETE_BUTTON_ID = '//button[contains(@ng-click,"confirmNoteDelete")]'

REQUSITION_OVERVIEW_SECTION_ID = "//a[contains(@href,'/overview')]"