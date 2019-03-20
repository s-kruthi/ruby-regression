# If the installation failes then create a shell script and put the following content in there and execute it:
#/bin/bash
gem install bundler
gem install selenium-webdriver
gem install capybara
gem install nokogiri
gem install rspec
gem install cucumber
gem install rake
gem install mysql2
gem install sequel
gem install colorize
gem install waitutil
gem install touch_action
gem install pry
gem install byebug
gem install rest-client
gem install JiraClient
gem install jira
gem install ruby-jmeter
gem install net-ssh-gateway
gem install watir


Required Gems:
-------------------------
require 'rubygems'
require 'active_record'
require 'touch_action/selenium-webdriver'
require 'securerandom'
require 'waitutil'
require 'selenium-webdriver'
require 'pry'
require 'rest-client'
require 'ruby-jmeter'
require 'sequel'
require 'net/ssh/gateway'
require 'watir'
require 'pp'
require 'jira-ruby'

Setup:
--------------------------
brew install bundler
brew install chromedriver
brew install geckodriver
brew install mysql
cd [Go to your scriptonce_automation] folder
bundle update


FAQ:
----------------------------

* How To Load The test?

- Just download the 'scriptonce_automation' folder
- Save it in your local( e.g documents / desktop)
- Now open RubyMine and load this project by giving path to your 'features' folder( that's a neat ruby IDE, you can chose any other)

* How To Run The test?

- Open a terminal
- Go To the 'scriptonce_automation' Folder Path (e.g cd */sampleWeb/sample_rubymine/sample_cucumber/scriptonce_automation)

- Type "$export CHANNEL=firefox; cucumber -csigxt @create_new_issue" if you're using Windows with Cygwin or gitbash sort of emulator
- Type "CHANNEL=chrome cucumber -csigxt @create_new_issue" if you're using MacOS/Linux

*NOTE:*
You can also pass parameters to change the default site information as well as point at whether it's staging or production site, as staging points to sub-domain.dev.elmodev.com
 and production points to sub-domain.elmotalent.com.au

An example is provided below:

~/automation/scriptonce_automation <auto/TDC-57> ✗ CHANNEL=firefox cucumber -csigxt @retrain_discrepancy_fix url=shayan01 type=staging
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

~/automation/scriptonce_automation <auto/TDC-57> ✗ CHANNEL=chrome cucumber -csigxt @activity_survey2_add url=survey.uat type=prod
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
