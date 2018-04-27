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

      gateway = Net::SSH::Gateway.new(@@HOST, @@SSH_USER, :password => @@PWD)
      port = gateway.open(@@DB_HOST, 3306, 3306)

      $site = (ENV["URL"] || ENV["url"]) || 'tmsfull'
      $data_base = "pmsdev_" + "#{$site}"

      @db = Sequel.connect(:adapter => 'mysql2', :host => '127.0.0.1', :port => port, :user => 'tester', :password => @@DB_PWD, :database => $data_base)

    end

    def select1_id()
      ids = @db[:epms_placeholder]
      return ids.map(:name)
    end

    def get_existing_user_detail_with_no_contract()
      query = "select id, first_name, last_name, email
               from epms_user
               where id not in (select user_id from epms_contract_workflow
               where status in (1,2,3,4,5,7,8))
               and is_active =1 and is_deleted=0 and is_elmo=0 and is_onboarding=0 order by rand();"
      @db[query].first
    end

    def get_onboarding_user_detail_with_no_contract()
      query = "select id, first_name, last_name, email
               from epms_user
               where id not in (select user_id from epms_contract_workflow
               where status in (1,2,3,4,5,7,8))
               and is_active =1 and is_deleted=0 and is_elmo=0 and is_onboarding=1 order by rand();"
      @db[query].first
    end

    def get_user_contract_workflow_id(user_id, status)
      query = "select id
               from epms_contract_workflow
               where user_id = #{user_id}
               and status = #{status};"
      @db[query]
    end

    def get_contract_placeholders_containing_string(contract_placeholder_string)
      query = "select count(*) as contract_placeholdersnum
               from epms_placeholder
               where name like '%#{contract_placeholder_string}%';"
      contract_placeholders_count = @db[query].first
      return contract_placeholders_count[:contract_placeholdersnum]
    end


    def get_visible_course_list_by_name(partial_course_name)
      query = "SELECT id, fullname, shortname, c_template
      FROM mdl_course WHERE fullname LIKE '%#{partial_course_name}%' AND visible = 1;"
      return @db[query].first[:fullname]
    end


    def get_course_discrepency_list()
      query = "SELECT c.fullname courseName, c.id courseId, u.id userId, e.retrain, e.retrain_open
    FROM epms_lms_course_enrolment e
    INNER JOIN mdl_course c ON e.course_id = c.id
    INNER JOIN epms_user u ON e.user_id = u.id
    WHERE
    u.is_elmo = 0 AND
    e.isActive = 1 AND
    e.status = 2 AND
    e.retrain != 0 AND
    c.visible != 0 AND
    DATE_SUB(DATE_ADD(FROM_UNIXTIME(e.timeEnded), INTERVAL e.retrain MONTH), INTERVAL e.retrain_open DAY) <= CURDATE();"
      return @db[query].first[:courseName]
    end

  end
end


$daos = Database_env::DAO.daos

