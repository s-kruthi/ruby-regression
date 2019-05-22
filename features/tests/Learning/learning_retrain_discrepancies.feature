@learning @course_retrain
  #@learningTestRailTags
  #C7206  C7207 C1804
  #@learningTestRailTags

Feature: As An Admin I Would Like to Manage Retrain Discrepancies For Users

  @smoke_learning8 @learning_low_risk @course_retrain_discrepancy_fix @C7206
Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain
Given I Have Logged In as a Learning Admin
And   I Go To Admin Settings
And   I Go To "Retrain Discrepancies" Under "Learning" Section
When  I See a List of Discrepancy Courses for Users
Then  I Should Be Able To Fix Retrain Of A Specific Course

  @smoke_learning8 @learning_low_risk @course_retrain_discrepancy_disable @C7207
Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Disable Retrain
Given I Have Logged In as a Learning Admin
And   I Go To Admin Settings
And   I Go To "Retrain Discrepancies" Under "Learning" Section
When  I See a List of Discrepancy Courses for Users
Then  I Should Be Able To Disable Retrain Of A Specific Course

  @smoke_learning8 @learning_low_risk @course_retrain_discrepancy_filter_create @C1804
Scenario: [Learning]Learning Admin using a Filter to apply on Retrain Discrepancies Page Results
Given I Have Logged In as a Learning Admin
And   I Go To Admin Settings
And   I Go To "Retrain Discrepancies" Under "Learning" Section
When  I Filter For An Employee With Discrepancies
Then  I See a Filtered List of Retrain Discrepancy Course Results for Learner

  @smoke_learning8 @learning_low_risk @course_retrain_discrepancy_bulkfix
Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain in Bulk
Given I Have Logged In as a Learning Admin
And   I Go To Admin Settings
And   I Go To "Retrain Discrepancies" Under "Learning" Section
When  I See a List of Discrepancy Courses for Users
And   I Select 3 Retrain Discrepancies For Bulk Action
And   I Choose To Fix Retrain From The Actions Menu
Then  I Should Be Able To See The Success Message For Fix Retrain For Users

  @smoke_learning8 @learning_low_risk @course_retrain_discrepancy_bulkdisable
Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain in Bulk
Given I Have Logged In as a Learning Admin
And   I Go To Admin Settings
And   I Go To "Retrain Discrepancies" Under "Learning" Section
When  I See a List of Discrepancy Courses for Users
And   I Select 3 Retrain Discrepancies For Bulk Action
And   I Choose To Disable Retrain From The Actions Menu
Then  I Should Be Able To See The Success Message For Disable Retrain For Users