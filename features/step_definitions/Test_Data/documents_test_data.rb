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


######### Document - Files page data #############################

FILE_TITLE_TXT = "Test File - DO NOT DELETE"
FILE_DESC_TXT = "Test File Description - DO NOT DELETE"


filename = "sample.pdf"
FILE_NAME = File.join(File.absolute_path("../../step_definitions/Test_Data/", File.dirname(__FILE__)), filename)

FILE_LABEL_ID_INDEX = 3

AVAIL_DROPDOWN_VALUE = "All Users"
FILE_SEARCH_RESULT = "//td[contains(.,'Test File - DO NOT DELETE')]"