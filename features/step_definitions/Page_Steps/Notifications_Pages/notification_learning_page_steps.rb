
def ConnectToDatabaseAndValidateTheCourseEnrolmentNotification()
  $DB_PWD_new =   %x(echo $DB_PWD).gsub(/[$]/,'/$/').gsub(/[>]/,'/>/').gsub(/\//, '\\').strip
  File.write('./features/step_definitions/Test_Data/stored_ids.rb', "$DB_PWD = '#{$DB_PWD_new}'")
  load('./features/step_definitions/Test_Data/stored_ids.rb')
  StartTheTunnel()
  File.write('./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql', "use #{TMSFULL_DATABASE} ; \n
    select*from epms_log_message where subject like 'New Enrolment' and recipient_ids like '/3472/3456/' ORDER BY id desc LIMIT 1\\G; \n
    select * from epms_lms_course_enrolment where course_id='392' ORDER BY id desc LIMIT 1 \\G; \n
    select * from epms_notifier_notification where trigger_id like 'Learning.CourseNewEnrolmentTrigger' ORDER BY id desc LIMIT 1 \\G;")
  begin
    result = %x(mysql -utester -p#{$DB_PWD} #{TMSFULL_DATABASE} -h127.0.0.1 --port 33060 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/learning_course_assignment.sql | tee ./features/step_definitions/MySQL_Scripts/sql_dependencies/myscript.txt) # connect to DB -> run SQL -> save it in text file
      frs = result.include?  ("recipient_ids: /3472/3456/") || #true validate that mail goes to both employee and manager
                                 ("user_id: 3472")  || #true validate for employee got enrolled in the course
                                 ("course_id: 392") || #true validate for employee enrolled for the right course
                                 ("trigger_id: Learning.CourseNewEnrolmentTrigger") #true validate right template got triggered
       unless frs == true
         puts "frs not matching"
       end
      qrs = result.include?  ("body: <p>Dear&nbsp;DontTouchAutomationUser&nbsp;AARON&nbsp;REBECCA.AARON@elmodemo.com</p>") ||
          ("SYSTEM_PLACEHOLDER_COMPANY_NAME: ELMO<br />") ||
          ("SYSTEM_PLACEHOLDER_COMPANY_SYSTEM_NAME: HR & Payroll<br />") ||
          ("SYSTEM_PLACEHOLDER_COMPANY_SHORT_NAME: ELMO<br />") ||
          ("SYSTEM_PLACEHOLDER_COMPANY_CONTACT: HROnline<br />") ||
          ("SYSTEM_PLACEHOLDER_COMPANY_EMAIL: noreply@elmolearning.com.au<br />") ||
          ("PLACEHOLDER_FIRSTNAME: DontTouchAutomationUser<br />") ||
          ("PLACEHOLDER_LASTNAME: AARON<br />") ||
          ("PLACEHOLDER_USERNAME: X1242341<br />") ||
          ("PLACEHOLDER_COURSE: course_section_automation_QuizActivity_shanku<br />") ||
          ("PLACEHOLDER_COURSE_LINK: https://tmsfull.dev.elmodev.com/learning/view-course/392?_l=1<br />") ||
          ("PLACEHOLDER_COURSE_DUE_DATE: [not specified]<br />")
    unless qrs == true
      puts "qrs not matching"
    end
      if frs &&  qrs
        puts "Yay! Notification has been triggered"
      else
        raise NotificationException.new("ERROR...Notifications were blocked !!!!!! ")
      end
  rescue
    puts "not valid"

  ensure
    %x(mysql -utester -p#{$DB_PWD} #{TMSFULL_DATABASE} -h127.0.0.1 --port 33060 -A < ./features/step_definitions/MySQL_Scripts/sql_commands/epms_log_message_delete.sql) #deletes the log files
    %x(kill -9 `ps aux | grep 3306 | grep -v grep | grep -v Server | awk '{print $2}'`) #kills ssh tunneling
    File.write('./features/step_definitions/Test_Data/stored_ids.rb', '')
  end
end
