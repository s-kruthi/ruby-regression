#Requisition Page Test Data
REQUISITION_POSITION_TITLE = 'SOA Test Position'
REQUISITION_LOCATION = 'New South Wales'
NUMBER_OF_POSITION_INPUT = '0'
REQUISITION_DUEDATE = "31/12/2016"
REQUISITION_MESSAGE_BODY = 'This is a test Requisition message.\n Please do not delete this.\n Thank you'

#Recruitment New Candidate Test Data
NEW_CANDIDATE_BTN_LABEL = 'New Candidate'
CANDIDATE = Hash.new
CANDIDATE[:FIRST] = "Test #{SecureRandom.hex(5)}"
CANDIDATE[:LAST] = "Team #{SecureRandom.hex(5)}"
CANDIDATE[:EMAIL] = "test.team"
CANDIDATE[:HOMEPHONE] = "80603700"
CANDIDATE[:MOBILE] = "0430222301"
CANDIDATE[:ADDRESSLINE1] = "520 Oxford St"
CANDIDATE[:SUBURB] = "SYDNEY"
CANDIDATE[:POSTCODE] = "2022"
CANDIDATE[:COUNTRY] = "Australia"
CANDIDATE[:STATE] = "NSW"
CANDIDATE[:TIMEZONE] = "Sydney"
CANDIDATE[:PASSWORD] = "Tester1!"