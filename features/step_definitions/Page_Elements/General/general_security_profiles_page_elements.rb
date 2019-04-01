SECURITY_PROFILES_ID ="//span[contains(.,'Security Profiles')]"

SECURITY_PROFILES_ADD_ID = '//a[@href="/admin/security-profile/add/details/"]'

SECURITY_PROFILES_ROLETYPE_ID = '//select[@id="securityProfile_roleType"]'

SECURITY_PROFILES_NAME_ID = 'securityProfile_name'

SECURITY_PROFILES_SAVE_ID = 'securityProfile_save'

SECURITY_PROFILES_SUMMARYCONFIRM_ID = 'role-type-confirm'

SECURITY_PROFILES_USERSTAB_ID = '//a[contains(@href,"/admin/security-profile/edit/user/")]'

SECURITY_PROFILES_USERSEARCH_ID = "//div[@id='s2id_search-item']"

SECURITY_PROFILES_USERINPUT_ID = "//input[@id='s2id_autogen1_search']"

SECURITY_PROFILES_USERSAVE_ID = 'role-type-save-user'

SECURITY_PROFILES_USERSSUCCESSMSG_ID = "//div[@id='role-type-message-container']"

SECURITY_PROFILES_SUMMARYTAB_ID = '//a[contains(@href,"/admin/security-profile/edit/confirmation/")]'

SECURITY_PROFILES_EDIT = "//a[@title='Edit']"

SECURITY_PROFILES_DEL = "//a[@title='Delete']"

LEARNING_REPORTS  = { "Learning Cost Report" => "//label[@for='filter_form_lmsReport_0']",
                      "Learner Report" => "//label[@for='filter_form_lmsReport_1']",
                      "Survey Report" => "//label[@for='filter_form_lmsReport_2']",
                      "Training Matrix Report" => "//label[@for='filter_form_lmsReport_3']",
                      "Face-to-Face Session Report" => "//label[@for='filter_form_lmsReport_4']",
                      "Course Status Report" => "//label[@for='filter_form_lmsReport_5']",
                      "Continuing Professional Development Report" => "//label[@for='filter_form_lmsReport_6']",
                      "Question Details Report" => "//label[@for='filter_form_lmsReport_7']",
                      "Misconceptions Report" =>  "//label[@for='filter_form_lmsReport_8']"}

HRCORE_REPORTS = {"HR Audit Report" => "//label[@for='filter_form_hrAuditReport_0']"}

LEAVE_REPORTS = {"Leave Balances and Accrual Report" => "//label[@for='filter_form_leaveReport_0']",
                 "Excessive Leave Compliance Report " => "//label[@for='filter_form_leaveReport_1']",
                 "Leave Taken Report " => "//label[@for='filter_form_leaveReport_2']"}


LEARNING_SECTIONS  = {"Course Certificate Templates" => "//input[@value='courseCertificateTemplate_enabled']",
                      "ELMO Course Builder" => "//input[@value='lcms_enabled']",
                      "Continuing Professional Development" => "//input[@value='cpd_enabled']",
                      "External Training" => "//input[@value='externalTraining_enabled']"}