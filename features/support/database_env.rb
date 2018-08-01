module Database_env
  class DAO
    attr_accessor :db

    def self.daos
      @@daos ||= Database_env::DAO.new()
      return @@daos
    end

    def initialize()
      @@HOST = 'secure.elmodev.com'
      @@SSH_USER = 'tester'
      @@DB_HOST = "basic-test-cluster.cluster-cb3yhxjbfifz.ap-southeast-2.rds.amazonaws.com"
      @@PWD = ENV['ssh_pwd'] || ENV['SSH_PWD']
      @@DB_PWD = ENV['db_pwd'] || ENV['DB_PWD']

      $site = (ENV["URL"] || ENV["url"]) || 'tmsfull'
      $data_base = (ENV["DB"] || ENV["db"]) || "pmsdev_" + "#{$site}"

      $gateway = Net::SSH::Gateway.new(@@HOST, @@SSH_USER, :password => @@PWD)
      port = $gateway.open(@@DB_HOST, 3306)

      @db = Sequel.connect(:adapter => 'mysql2', :host => '127.0.0.1', :port => port, :user => 'tester', :password => @@DB_PWD, :database => $data_base)
      Sequel.default_timezone = :local
      Sequel.database_timezone = :local
      @db.convert_tinyint_to_bool = false
      puts "[INFO] ".colorize(:blue) + "Database connection on port: #{port}"
      puts "[INFO] ".colorize(:blue) + "Database name: #{$data_base}\n"
    end
  end
end


$daos = Database_env::DAO.daos

