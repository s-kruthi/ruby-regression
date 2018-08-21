$VERBOSE = nil


def ReturnDetailsOfAParticularUser(database,emp_username)
  SearchDatabaseForASpecificData(database, Find_UserDetails(emp_username))
end


def Find_UserDetails(emp_username)
  "select id as user_id,manager_id,identifier from epms_user where username='#{emp_username}' ORDER BY id desc LIMIT 1"
end


# Get all the variables under one method and use it during the course of each test scenario
def ReturnMultipleUserDetails(database,emp_username, course_name)
  SearchDatabaseForASpecificData(database, Find_MultipleUserDetails(emp_username, course_name))
end


# # you can club multiple and unrelated sql queries into one method , between 2 sql queries put \\G; \n
def Find_MultipleUserDetails(emp_username, course_name)
  "select first_name from epms_user where username='#{emp_username}' ORDER BY id desc LIMIT 1 \\G; \n
    select id as course_id from mdl_course where fullname='#{course_name}' ORDER BY id desc"
end


def ConnectToDatabaseAndValidateTheCourseEnrolmentNotification()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql', "use #{TMSFULL_DATABASE} ; \n
    select*from epms_log_message where subject like '%New Enrolment Confirmation%' and recipient_ids ='/#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_lms_course_enrolment where course_id='#{$data_hash['course_id:']}' and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like '%Learning.CourseNewEnrolmentTrigger%'and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql','myscript.txt')
  begin
     a = @db_result.include?  ("recipient_ids: /#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/")  #true validate that mail goes to both employee and manager
        if a == false  then print "a is not matching \n".colorize(:red) end
     b = @db_result.include?  ("user_id: #{$data_hash['user_id:']}")  #true validate for employee got enrolled in the course
        if b == false  then print "b is not matching \n".colorize(:red) end
     c = @db_result.include?  ("course_id: #{$data_hash['course_id:']}")  #true validate for employee enrolled for the right course
        if c == false  then print "c is not matching \n".colorize(:red) end
     d = @db_result.include?  ("trigger_id: Learning.CourseNewEnrolmentTrigger") #true validate right template got triggered
        if d == false  then print "d is not matching \n".colorize(:red) end

    if a & b & c & d
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
      end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(TMSFULL_DATABASE)
  end
end


def ConnectToDatabaseAndValidateTheCourseEnrolmentRequestNotification()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql', "use #{TMSFULL_DATABASE} ; \n
    select*from epms_log_message where subject like '%Course Enrolment Request for%' and recipient_ids ='/#{$data_hash['manager_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_course_enrol_request where course_id='#{$data_hash['course_id:']}' and requestor_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like '%Learning.CourseEnrolRequestTrigger%' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql','myscript.txt')
  begin
    a = @db_result.include?  ("approver_id: #{$data_hash['manager_id:']}")  #true validate that mail goes to  employee's manager
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?  ("requestor_id: #{$data_hash['user_id:']}")  #true validate that right employee got enrolled to the course
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("course_id: #{$data_hash['course_id:']}")  #true validate for employee enrolled for the right course
    if c == false  then print "c is not matching \n".colorize(:red) end
    d = @db_result.include?  ("trigger_id: Learning.CourseEnrolRequestTrigger") #true validate right template got triggered
    if d == false  then print "d is not matching \n".colorize(:red) end
    e = @db_result.include?  ("recipient_ids: /#{$data_hash['manager_id:']}/")
    if e == false  then print "e is not matching \n".colorize(:red) end

    if a & b & c & d & e
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(TMSFULL_DATABASE)
  end
end


def ConnectToDatabaseAndValidateTheCourseEnrolmentRequestApprovedNotification()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql', "use #{TMSFULL_DATABASE} ; \n
    select*from epms_log_message where subject like '%Enrolment Request Approved%' and recipient_ids = '/#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_course_enrol_request where course_id='#{$data_hash['course_id:']}' and requestor_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like '%Learning.CourseEnrolRequestApprovedTrigger%' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql', 'myscript.txt')
  begin
    a = @db_result.include?  ("approver_id: #{$data_hash['manager_id:']}")  #true validate that mail goes to  employee's manager
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?  ("requestor_id: #{$data_hash['user_id:']}")  #true validate that right employee got enrolled to the course
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("course_id: #{$data_hash['course_id:']}")  #true validate for employee enrolled for the right course
    if c == false  then print "c is not matching \n".colorize(:red) end
    d = @db_result.include?  ("status: 2") #true validate the status is approved
    if d == false  then print "d is not matching \n".colorize(:red) end
    e = @db_result.include?  ("trigger_id: Learning.CourseEnrolRequestApprovedTrigger") #true validate right template got triggered)
    if e == false  then print "e is not matching \n".colorize(:red) end
    f = @db_result.include?  ("recipient_ids: /#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/")
    if f == false  then print "f is not matching \n".colorize(:red) end

    if a & b & c & d & e & f
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(TMSFULL_DATABASE)
    GoToSpecificCourseEnrolmentSection("#{$data_hash['course_id:']}")
    DeleteTheExistingCourseEnrolment()
  end
end


def ConnectToDatabaseAndValidateTheNewCourseEnrolmentNotification()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql', "use #{TMSFULL_DATABASE} ; \n
    select*from epms_log_message where subject like '%New Enrolment Confirmation%' and recipient_ids ='/#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_lms_course_enrolment where course_id='#{$data_hash['course_id:']}' and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like '%Learning.CourseNewEnrolmentTrigger%'and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql', 'myscript.txt')
  begin
    a = @db_result.include?  ("recipient_ids: /#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/")  #true validate that mail goes to both employee and manager
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?  ("user_id: #{$data_hash['user_id:']}")  #true validate for employee got enrolled in the course
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("course_id: #{$data_hash['course_id:']}")  #true validate for employee enrolled for the right course
    if c == false  then print "c is not matching \n".colorize(:red) end
    d = @db_result.include?  ("trigger_id: Learning.CourseNewEnrolmentTrigger") #true validate right template got triggered
    if d == false  then print "d is not matching \n".colorize(:red) end

    if a & b & c & d
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(TMSFULL_DATABASE)
  end
end


def ConnectToDatabaseAndValidateBulkNewCourseEnrolmentNotifications()
  SearchDatabaseForNotificationTriggers(TMSFULL_DATABASE,
  " Select recipients,recipient_ids from epms_log_message where subject like '%New Enrolment Confirmation%' order by id DESC LIMIT 10",
    'learning_course_assignment.sql')
  begin
    a = @db_result.include?  ("recipient_ids:")  #true validate that mail goes to both employee and manager(if employee has a manager)
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.scan(/recipient_ids/).count == 10  #true validate for employee got enrolled in the course
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.scan(/recipients/).count == 10  #true validate for employee got enrolled in the course
    if c == false  then print "c is not matching \n".colorize(:red) end

    if a & b & c
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(TMSFULL_DATABASE)
  end
end