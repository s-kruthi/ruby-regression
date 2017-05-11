######### Scheduled Reports page elements #############################

REPORTS_TAB_ID = "//a[contains(.,'Reports')]"
SCH_REPORTS_TAB_ID = "//a[contains(.,'Scheduled Reports')]"
SCHD_REPORTS_BTN_ID = "//button[contains(.,'Scheduled Report')]"
SCHD_REPORTS_NAME_ID = "//input[contains(@placeholder,'Title')]"
SCHD_REPORTS_FREQ_ID = "//select[contains(@data-ng-model,'report.frequency')]"
SCHD_REPORTS_START_DATE_ID = "//input[contains(@name,'startDate')]"
SCHD_REPORTS_END_DATE_ID = "//input[contains(@name,'endDate')]"

REPORT_NAME_INDEX_NAME_ID = "select2-choice"
REPORT_NAME_RESULT_ID = "select2-result-selectable"

REPORTS_LEVEL_ID =  "//select[@ng-model='report.parameters[parameter.name]']" #Reports like Learner Report needs this defined
REPORTS_FORMAT_ID =  "//select[contains(@data-ng-model,'report.format')]"

RECIPIENT_FIELD_ID = "s2id_autogen8"
SHOW_ALL_DATA_ID =  "//select[contains(@data-ng-model,'report.showAllData')]"

REPORTS_SAVE_BTN_ID = "//button[contains(.,'Save')]"

SCHD_REPORT_VERIFY_SAVE_SUCCESSFUL_ID =  "//div[contains(@class,'alert ng-isolate-scope alert-success')]"

SCHD_REPORT_SEARCH_ID = "//input[contains(@ng-keydown,'$event.which === 13 && getScheduledReports()')]"
SCHD_REPORT_SEARCH_BTN_ID = "//button[@ng-click='getScheduledReports()']"