#!/usr/bin/expect -f
spawn ssh -f -p 22 tester@13.55.17.183 -L 33060:basic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com:3306 -N
sleep 1
expect "password: "
send "Muraf3cAR\r"
sleep 1
expect "$ "