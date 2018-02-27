HOST      = 'secure.elmodev.com'
SSH_USER  = 'tester'
DB_HOST   = "basic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com"
PWD = "Muraf3cAR"


gateway = Net::SSH::Gateway.new(HOST, SSH_USER, :password => PWD)
port = gateway.open(DB_HOST,3306,3306)



db = Sequel.connect(:adapter => 'mysql2', :host => '127.0.0.1',:port => port, :user => 'tester', :password => PWD, :database => 'pmsdev_tmsfull')
puts db['select id from epms_placeholder'].count


gateway.close(port)