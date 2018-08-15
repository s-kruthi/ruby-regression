csv = CSV.read('features/step_definitions/Test_Data/PayrollNewMember.csv', :headers=>false)

# Details required to fill TFN Declaration section
#$tfn = csv[1][36]
$tfn = rand(999999999).to_s.center(9, rand(9).to_s)
$title = csv[1][1]
$name = csv[1][2] + rand(100).to_s
$surname = csv[1][3] + rand(100).to_s
$othername = csv[1][4] + rand(100).to_s
$addr = rand(1..20).to_s + " " + csv[1][7]
$suburb = csv[1][8]
$state = csv[1][9]
$postcode = csv[1][10]
$tfn_decl = "Have specified a tax file number"
$dobcal= 0
$doecal = 1
$dodcal = 2
#$residentfortax = csv[1][40] ------since the resident for tax is a toggle in production, based on this value the toggle will be performed in the script
$residentfortax = "An australian resident for tax purposes"
$helpdebt = csv[1][42]
$sfssdebt = csv[1][43]

# Details required to fill Profile section
$employment = csv[1][17]
$gender = csv[1][5]
$marital = csv[1][19]
$position = "Not applicable"
#$location = csv[1][11]
$location = "Not applicable"
$paymentpoint = "Not applicable"
$abn = "Default company"
$hometel = csv[1][34]
$mobile = csv[1][33]
#$email = csv[1][32]
$email = $name + $surname + "@yopmail.com"

# Details required to fill Pay Details section
$paycycle = "Monthly Pay"
$stdworkhrs = csv[1][24]
$rop = csv[1][26]
#$bsb = csv[1][66]
$bsb = rand(999999).to_s.center(6, rand(9).to_s)
#$account_no = csv[1][67]
$account_no = rand(999999999).to_s.center(9, rand(9).to_s)
$account_name = $name + " " +$surname
$emp_name = $surname + " " +$name
$lodge_ref = csv[1][68]
$self_super = csv[1][53]
$super_fund = csv[1][51]
$super_member_no = csv[1][52]

# Details required to fill Leave Details section
$accrues_annual = csv[1][61]
$open_annual_leave_bal = csv[1][57]
$accrues_personal = csv[1][64]
$open_personal_leave_bal = csv[1][58]
$accrues_lon_serv = csv[1][63]
$open_long_serv_leave_bal = csv[1][60]
$accrues_time_lieu = csv[1][62]
$open_time_lieu_leave_bal = csv[1][59]

$create_new_index = 0
$create_close_index = 1

