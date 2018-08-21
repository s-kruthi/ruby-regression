csv = CSV.read('features/step_definitions/Test_Data/PayrollNewMember.csv', :headers=>false)

# Details required to fill TFN Declaration section
#NEW_TFN_NO = csv[1][36]
NEW_TFN_NO = rand(999999999).to_s.center(9, rand(9).to_s)
NEW_TFN_TITLE = csv[1][1]
NEW_EMP_NAME = csv[1][2] + rand(100).to_s
NEW_EMP_SURNAME = csv[1][3] + rand(100).to_s
NEW_EMP_OTHER_NAME = csv[1][4] + rand(100).to_s
NEW_EMP_ADDRESS = rand(1..20).to_s + " " + csv[1][7]
NEW_EMP_SUBURB = csv[1][8]
NEW_EMP_STATE = csv[1][9]
NEW_EMP_POSTCODE = csv[1][10]
NEW_TFN_DEC_OPTION = "Have specified a tax file number"
NEW_DOBCAL= 0
NEW_DOECAL = 1
NEW_DODCAL = 2
#NEW_RESIDENT_FOR_TAX = csv[1][40] ------since the resident for tax is a toggle in production, based on this value the toggle will be performed in the script
NEW_RESIDENT_FOR_TAX = "An australian resident for tax purposes"
NEW_HELP_DEBT = csv[1][42]
NEW_SFSS_DEBT = csv[1][43]

# Details required to fill Profile section
NEW_EMPLOYMENT = csv[1][17]
NEW_GENDER = csv[1][5]
NEW_MARITAL_STATUS = csv[1][19]
NEW_POSITION = "Not applicable"
#NEW_LOCATION = csv[1][11]
NEW_LOCATION = "Not applicable"
NEW_PAYMENT_POINT = "Not applicable"
NEW_ABN = "Default company"
NEW_HOME_TELEPHONE_NO = csv[1][34]
NEW_MOBILE_NO = csv[1][33]
#NEW_EMAIL_ADDR = csv[1][32]
NEW_EMAIL_ADDR = NEW_EMP_NAME + NEW_EMP_SURNAME + "@yopmail.com"

# Details required to fill Pay Details section
NEW_PAY_CYCLE = "Monthly Pay"
NEW_STD_WORK_HRS = csv[1][24]
NEW_RATE_OF_PAY = csv[1][26]
#NEW_BSB = csv[1][66]
NEW_BSB = rand(999999).to_s.center(6, rand(9).to_s)
#NEW_BANK_ACCOUNT_NO = csv[1][67]
NEW_BANK_ACCOUNT_NO = rand(999999999).to_s.center(9, rand(9).to_s)
NEW_BANK_ACCOUNT_NAME = NEW_EMP_NAME + " " + NEW_EMP_SURNAME
EMP_NAME = NEW_EMP_SURNAME + " " + NEW_EMP_NAME
NEW_LODGEMENT_REF = csv[1][68]
NEW_SELF_SUPER = csv[1][53]
NEW_SUPER_FUND = csv[1][51]
NEW_SUPER_MEMBER_NO = csv[1][52]

# Details required to fill Leave Details section
NEW_ACCRUES_ANNUAL = csv[1][61]
NEW_OPENING_ANNUAL_LEAVE_BAL = csv[1][57]
NEW_ACCRUES_PERSONAL = csv[1][64]
NEW_OPENING_PERSONAL_LEAVE_BAL = csv[1][58]
NEW_ACCRUES_LONG_SER = csv[1][63]
NEW_OPENING_LONG_SER_LEAVE_BAL = csv[1][60]
NEW_ACCRUES_TIME_IN_LIEU = csv[1][62]
NEW_OPENING_TIME_IN_LIEU_BAL = csv[1][59]

CREATE_AND_NEW = 0
CREATE_AND_CLOSE = 1

