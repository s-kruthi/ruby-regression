SEARCH_TEMPLATE = 'cool stuff'
SEARCH_USER = 'DontTouchAutomationUser AARON'

#### user document submission ####
STREET_NUM_VAL = '23'
STREET_VAL = 'oxford'
SUBURB_VAL = 'Bondi Jn'
STATE_VAL = 'NSW'
POSTCODE_VAL = '2022'
DOC_COMPLETE_MESSAGE = 'Document completed'

#### manager's document approved ###
APPROVAL_MESSAGE = 'Document approved'
#### manager's document rejected ###
REJECTION_MESSAGE = 'Document rejected'


######### Document - Form template page data #############################

FORM_TEMP_TITLE_TXT = "Test Form Template - DO NOT DELETE"
FORM_TEMP_DESC_TXT = "Test Form Template Description - DO NOT DELETE"
FORM_ACTION_ITEM = "Hide"

######### Document - Document Categories page data #############################

DOCUMENT_CATEGORY_TITLE_TEXT = "Test Document Category - DO NOT DELETE"
DOCUMENT_CATEGORY_DESC_TXT = "Test Document Category Description - DO NOT DELETE"

DOCUMENT_CAT_SAVE_SUCCESS_VALUE = "Successfully added new category"

DOC_CAT_ACTION_ITEM = "Hide"

######### Document - Files page data #############################

FILE_TITLE_TXT = "Test File - DO NOT DELETE"
FILE_DESC_TXT = "Test File Description - DO NOT DELETE"


filename = "sample.pdf"
DOCUMENT_FILE_NAME = File.join(File.absolute_path("../../step_definitions/Test_Data/", File.dirname(__FILE__)), filename)

FILE_LABEL_ID_INDEX = 3

AVAIL_DROPDOWN_VALUE = "All Users"
FILE_SEARCH_RESULT = "//td[contains(.,'Test File - DO NOT DELETE')]"
FILE_ACTION_DELETE = "Delete"

FILE_SAVE_SUCCESSFUL_VALUE = "Save successful"