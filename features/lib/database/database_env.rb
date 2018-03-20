module Database_env
  class DAO
    attr_accessor :db

    def self.daos
      @@daos ||= Database_env::DAO.new()
      return @@daos
    end

    def initialize()

      @@HOST = 'secure.elmodev.com'
      @@SSH_USER  = 'tester'
      @@DB_HOST   = "basic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com"
      @@PWD = "Muraf3cAR"

      gateway = Net::SSH::Gateway.new(@@HOST, @@SSH_USER, :password => @@PWD)
      port = gateway.open(@@DB_HOST,3306,3306)

      $site = (ENV["URL"] || ENV["url"]) || 'tmsfull'
      $data_base = "pmsdev_" + "#{$site}"

      @db = Sequel.connect(:adapter => 'mysql2', :host => '127.0.0.1',:port => port, :user => 'tester', :password => @@PWD, :database => $data_base)

    end

    def select1_id()
      ids = @db[:epms_placeholder]
      return ids.map(:name)
    end

  end

end

$daos = Database_env::DAO.daos

