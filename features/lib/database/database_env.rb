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

    def get_existing_user_detail_with_no_contract()
      query = "select first_name, last_name, email
               from epms_user
               where id not in (select user_id from epms_contract_workflow
               where status not in (0,1,2,3,4,5,6,7))
               and is_active =1 and confirmed=1 and is_deleted=0 and is_elmo=0 and is_onboarding=0 order by rand();"
      @db[query].first
    end

    def get_onboarding_user_detail_with_no_contract()
      query = "select first_name, last_name, email
               from epms_user
               where id not in (select user_id from epms_contract_workflow
               where status not in (0,1,2,3,4,5,6,7))
               and is_active =1 and confirmed=1 and is_deleted=0 and is_elmo=0 and is_onboarding=1 order by rand();"
      @db[query].first
    end

  end

end

$daos = Database_env::DAO.daos

