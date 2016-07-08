#!/usr/bin/expect
spawn ssh -f -p 22 tester@54.66.150.255 -L 33060:basic-test.cxexixtaxuuy.ap-southeast-2.rds.amazonaws.com:3306 -N
sleep 3
expect "password: "
send "Muraf3cAR\r"
sleep 3
expect "$ "