- Ruby gems required:

require 'touch_action'
require 'pp'
require 'jira-ruby'
require 'rubygems'
require 'active_record'
require 'waitutil'
require 'touch_action/selenium-webdriver'
require 'selenium-webdriver'
require 'pry'
require 'rest-client'
require 'ruby-jmeter'


open up terminal and use 'bundle update' which will install all required gems by reading the  “Gemfile.lock” file


- How To Load The test?

1. Just download the 'scriptonce_automation' folder
2. Save it in your local( e.g documents / desktop)
3. Now open RubyMine and load this project by giving path to your 'features' folder( that's a neat ruby IDE, you can chose any other)

- How To Run The test?

Open a terminal
Go To the 'scriptonce_automation' Folder Path (e.g cd */sampleWeb/sample_rubymine/sample_cucumber/scriptonce_automation)

Type "$export CHANNEL=firefox; cucumber --tags @create_new_issue" if you're using Windows with Cygwin or gitbash sort of emulator
Type "CHANNEL=firefox cucumber --tags @create_new_issue" if you're using MacOS/Linux
You can also pass parameters to change the default site information as well as point at whether it's staging or production site, as staging points to sub-domain.dev.elmodev.com and production points to sub-domain.elmotalent.com.au

An example is provided below:

~/automation/scriptonce_automation <auto/TDC-57> ✗ CHANNEL=firefox cucumber --xgt @retrain_discrepancy_fix url=shayan01 type=staging
@learning @courses
Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @retrain_discrepancy_fix @wip @learning_low_risk
  Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain
    Given I Have Logged In as a Learning Admin to shayan01 site
      URL OVERRIDE = https://shayan01.dev.elmodev.com/dashboard
      Title: Shayan01 - Dashboard
      URL: https://shayan01.dev.elmodev.com/dashboard
    And I go to Admin Settings
    And I Go To Retrain Discrepancies under Learning section
    When I Search For A Specific Course Named Fraud & Corruption
    Then I Should Be Able To Fix Retrain Of The Specific Course
      MATCHED: Retrain for the selected user(s) have been successfully fixed - [ PASSED ]

1 scenario (1 passed)
5 steps (5 passed)
0m22.338s

~/automation/scriptonce_automation <auto/TDC-57> ✗ CHANNEL=chrome cucumber -xgt @activity_survey2_add url=survey.uat type=prod
@learning @courses
Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @activity_survey2_add @activity_add @learning_high_risk
  Scenario: [Learning]Learning Admin creating New Post Activity In A Course # features/tests/learning.feature:108
    Given I Have Logged In as a Learning Admin to shayan02 site             # features/step_definitions/business_layer/general_business_steps.rb:42
      URL OVERRIDE = https://survey.uat.elmotalent.com.au/dashboard
      SERVER MODE = prod
      Title: ELMO Talent Management System - Dashboard
      URL: https://survey.uat.elmotalent.com.au/dashboard
    And I go to Admin Settings                                              # features/step_definitions/business_layer/general_business_steps.rb:114
    And I Go To Courses under Learning section                              # features/step_definitions/business_layer/general_business_steps.rb:119
    When I Edit A Specific Course Named DO NOT DELETE                       # features/step_definitions/business_layer/learning_course_business_steps.rb:56
    Then I Should Be Able To Add A New ELMO Survey (new) Activity           # features/step_definitions/business_layer/learning_course_business_steps.rb:62
      Adding activity: ELMO Survey (new)
      MATCHED: Successfully saved - [ PASSED ]

1 scenario (1 passed)
5 steps (5 passed)
0m44.586s

