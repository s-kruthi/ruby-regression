@learning @enrolments

Feature: As An Admin I Would Like to Manage Enrolments

@smoke_learning1 @learning_low_risk @course_view_enrolments
Scenario: [Learning]Learning Admin Can View Course Enrolments
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
Then  I Should Be Able To View All The Course Enrolments

@smoke_learning1 @learning_low_risk @course_disable_retrain_enrolment
Scenario: [Learning]Learning Admin Can Disable Retrain For Enrolments
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
And   I Filter For Enrolments With Status Of Recompletion Required
And   I Choose To Disable Retrain For The Enrolment
Then  I Should Be Able To See The Retrain Disabled For The Enrolment

@smoke_learning1 @learning_low_risk @course_enable_retrain_enrolment
Scenario: [Learning]Learning Admin Can Enable Retrain For Enrolments
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
And   I Filter For Enrolments With Status Of Completed
And   I Choose To Enable Retrain For The Enrolment
Then  I Should Be Able To See The Retrain Enabled For The Enrolment

@learning_low_risk @course_edit_enrolment_start_end_date @C800 @C801 @PMS-14875
Scenario: [Learning]Learning Admin Can Edit Enrolments With Due Date
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
   # And   I Filter For Enrolments With Status Of Not Yet Started
And   I Filter For Enrolments With Status Of In Progress
And   I Choose To Edit An Enrolment
And   I Edit The Enrolment Start Date To Be "Today's Date"
And   I Edit The Enrolment Due Date To Be "A Month From Today"
And   I Save The Changes To The Enrolment
Then  I Should See That The Changes Were Successfully Saved To The Enrolment

@learning_low_risk @course_edit_enrolment_start_date @C800 @C801 @PMS-14875
Scenario: [Learning]Learning Admin Can Edit Enrolments Without Due Date
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
    #And   I Filter For Enrolments With Status Of Not Yet Started
And   I Filter For Enrolments With Status Of In Progress
And   I Choose To Edit An Enrolment
And   I Edit The Enrolment Start Date To Be "Today's Date"
And   I Edit The Enrolment Due Date To Be "N/A"
And   I Save The Changes To The Enrolment
Then  I Should See That The Changes Were Successfully Saved To The Enrolment

@learning_low_risk @course_delete_enrolment @C813
Scenario: [Learning]Learning Admin Can Delete Enrolment
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
And   I Filter For Enrolments With Status Of Completed
And   I Filter For Enrolments With Enrolment Method Of Manual
    #And   I Should Be Able To Only Refresh/Delete Enrolment
And   I Choose To Delete An Enrolment
Then  I Should See That The Enrolment Was Successfully Deleted

@smoke_learning2 @learning_low_risk @course_bulkdelete_enrolment @C815
Scenario: [Learning]Learning Admin Can Delete Enrolment In Bulk
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
And   I Filter For Enrolments With Status Of Completed
And   I Select "3" "Enrolments" For Bulk Action
And   I Choose To Delete Enrolment From The Actions Menu
Then  I Should See That The Enrolment Was Successfully Deleted

@smoke_learning2 @learning_low_risk @course_mark_enrolment_complete @C815
Scenario: [Learning]Learning Admin Can Mark Enrolment As Complete
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
And   I Filter For Enrolments With Status Of In Progress
And   I Choose To Mark An Enrolment As Complete
Then  I Should See That The Enrolment Was Successfully Marked As Complete

@smoke_learning2 @learning_low_risk @course_bulkmark_enrolment_complete
Scenario: [Learning]Learning Admin Can Mark Enrolments In Bulk As Complete
Given I Have Logged In As A Learning Admin
And   I Go To Admin Settings
When  I Go To "Enrolments" Under "Learning" Section
And   I Filter For Enrolments With Status Of In Progress
And   I Select "1" "Enrolment" For Bulk Action
And   I Choose To Mark Enrolments As Complete From The Actions Menu
Then  I Should See That The Enrolments Was Successfully Marked As Complete