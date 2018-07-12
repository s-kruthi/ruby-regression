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
    select*from epms_log_message where subject like 'New Enrolment' and recipient_ids like '/#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_lms_course_enrolment where course_id='#{$data_hash['course_id:']}' and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like 'Learning.CourseNewEnrolmentTrigger'and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql','myscript.txt')
  begin
     a = @db_result.include?  ("recipient_ids: /3472/3456/")  #true validate that mail goes to both employee and manager
        if a == false  then print "a is not matching \n".colorize(:red) end
     b = @db_result.include?  ("user_id: 3472")  #true validate for employee got enrolled in the course
        if b == false  then print "b is not matching \n".colorize(:red) end
     c = @db_result.include?  ("course_id: 392")  #true validate for employee enrolled for the right course
        if c == false  then print "c is not matching \n".colorize(:red) end
     d = @db_result.include?  ("trigger_id: Learning.CourseNewEnrolmentTrigger") #true validate right template got triggered
        if d == false  then print "d is not matching \n".colorize(:red) end
     e = @db_result.include?  ("body: <p>Dear&nbsp;DontTouchAutomationUser&nbsp;AARON&nbsp;REBECCA.AARON@elmodemo.com</p>")
        if e == false  then print "e is not matching \n".colorize(:red) end
     f = @db_result.include?  ("SYSTEM_PLACEHOLDER_COMPANY_NAME: ELMO<br />")
        if f == false  then print "f is not matching \n".colorize(:red) end
     g = @db_result.include?  ("SYSTEM_PLACEHOLDER_COMPANY_SYSTEM_NAME: HR & Payroll<br />")
        if g == false  then print "g is not matching \n".colorize(:red) end

    if a & b & c & d & e & f & g
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
    select*from epms_log_message where subject like 'Course Enrol Request' and recipient_ids like '/#{$data_hash['manager_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_course_enrol_request where course_id='#{$data_hash['course_id:']}' and requestor_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like 'Learning.CourseEnrolRequestTrigger' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql','myscript.txt')
  begin
    a = @db_result.include?  ("approver_id: 3456")  #true validate that mail goes to  employee's manager
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?  ("requestor_id: 3472")  #true validate that right employee got enrolled to the course
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("course_id: 787")  #true validate for employee enrolled for the right course
    if c == false  then print "c is not matching \n".colorize(:red) end
    d = @db_result.include?  ("trigger_id: Learning.CourseEnrolRequestTrigger") #true validate right template got triggered
    if d == false  then print "d is not matching \n".colorize(:red) end
    e = @db_result.include?  ('body: <p><span style="color:rgb(51, 51, 51); font-family:arial,sans-serif; font-size:10pt">Hi SIMON&nbsp;COX,<br />
DontTouchAutomationUser&nbsp;has&nbsp;requested to enrol into course_section_automation_QuizActivity_shanku(Approval). Please review the request and notify them if their enrolment to complete this training has been approved or declined.<br />
https://tmsfull.dev.elmodev.com/learning/course-requests<br />')
    if e == false  then print "e is not matching \n".colorize(:red) end
    f = @db_result.include?  ("recipient_ids: /3456/")
    if f == false  then print "f is not matching \n".colorize(:red) end
    g = @db_result.include?  ('recipients: {"to":{"SIMON.COX@elmodemo.com":"SIMON COX"},"cc":null,"bcc":null}')
    if g == false  then print "g is not matching \n".colorize(:red) end

    if a & b & c & d & e & f & g
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
    select*from epms_log_message where subject like 'Course Enrol Request Approved' and recipient_ids like '/#{$data_hash['user_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_course_enrol_request where course_id='#{$data_hash['course_id:']}' and requestor_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like 'Learning.CourseEnrolRequestApprovedTrigger' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql', 'myscript.txt')
  begin
    a = @db_result.include?  ("approver_id: 3456")  #true validate that mail goes to  employee's manager
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?  ("requestor_id: 3472")  #true validate that right employee got enrolled to the course
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("course_id: 787")  #true validate for employee enrolled for the right course
    if c == false  then print "c is not matching \n".colorize(:red) end
    d = @db_result.include?  ("status: 2") #true validate the status is approved
    if d == false  then print "d is not matching \n".colorize(:red) end
    e = @db_result.include?  ("trigger_id: Learning.CourseEnrolRequestApprovedTrigger") #true validate right template got triggered)
    if e == false  then print "e is not matching \n".colorize(:red) end
    f = @db_result.include?  ('body: <p><span style="color:rgb(51, 51, 51); font-family:arial,sans-serif; font-size:10pt">Hi DontTouchAutomationUser,<br />
Your request to enrol into course_section_automation_QuizActivity_shanku(Approval) has been approved.<br />
<br />
Should you have any questions please email&nbsp;<a href="mailto:lnd@tmbank.com.au">lnd@tmbank.com.au</a></span></p>')
    if f == false  then print "f is not matching \n".colorize(:red) end
    g = @db_result.include?  ("recipient_ids: /3472/")
    if g == false  then print "g is not matching \n".colorize(:red) end

    if a & b & c & d & e & f & g
      print "Yay! Notifications have been triggered \n".colorize(:green)
    else
      print "ERROR...Notifications were blocked !!!!!! \n".colorize(:red)
      raise TunnelException.new("Notifications were blocked ")
    end
  rescue
    print "not valid".colorize(:red)
  ensure
    ResetTheEnvironment(TMSFULL_DATABASE)
    DeleteTheExistingCourseEnrolment('787')
  end
end

def ConnectToDatabaseAndValidateTheNewCourseEnrolmentNotification()
  StartTunnelIfRequired()
  SecurePasswordConnectToDatabase()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql', "use #{TMSFULL_DATABASE} ; \n
    select*from epms_log_message where subject like 'New Enrolment' and recipient_ids like '/#{$data_hash['user_id:']}/#{$data_hash['manager_id:']}/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_lms_course_enrolment where course_id='#{$data_hash['course_id:']}' and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like 'Learning.CourseNewEnrolmentTrigger'and user_id='#{$data_hash['user_id:']}' ORDER BY id desc LIMIT 1 \\G;")
  ConnectToEnvironment(TMSFULL_DATABASE,'learning_course_assignment.sql', 'myscript.txt')
  begin
    a = @db_result.include?  ("recipient_ids: /3472/3456/")  #true validate that mail goes to both employee and manager
    if a == false  then print "a is not matching \n".colorize(:red) end
    b = @db_result.include?  ("user_id: 3472")  #true validate for employee got enrolled in the course
    if b == false  then print "b is not matching \n".colorize(:red) end
    c = @db_result.include?  ("course_id: 982")  #true validate for employee enrolled for the right course
    if c == false  then print "c is not matching \n".colorize(:red) end
    d = @db_result.include?  ("trigger_id: Learning.CourseNewEnrolmentTrigger") #true validate right template got triggered
    if d == false  then print "d is not matching \n".colorize(:red) end
    e = @db_result.include?  ("body: <p>Dear&nbsp;DontTouchAutomationUser&nbsp;AARON&nbsp;REBECCA.AARON@elmodemo.com</p>")
    if e == false  then print "e is not matching \n".colorize(:red) end
    f = @db_result.include?  ("SYSTEM_PLACEHOLDER_COMPANY_NAME: ELMO<br />")
    if f == false  then print "f is not matching \n".colorize(:red) end
    g = @db_result.include?  ("SYSTEM_PLACEHOLDER_COMPANY_SYSTEM_NAME: HR & Payroll<br />")
    if g == false  then print "g is not matching \n".colorize(:red) end

    if a & b & c & d & e & f & g
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