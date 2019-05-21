# Basic Installation
If the installation failes then create a shell script and put the following content in there and execute it:

#!/bin/snstall bundler 
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
gem install jira-ruby
gem install JiraClient
gem install jira
gem install ruby-jmeter
gem install ed25519
gem install bcrypt_pbkdf
gem install net-ssh
gem install net-ssh-gateway
gem install watir
gem install rubocop


# Requirements
In general, these are the primary gems currently used by the scriptonce automation framework
-------------------------
require 'rubyems'   
require 'touch_action'
require 'securerandom'
require 'waitutil'   
require 'selenium-webdriver'
require 'pry'        
require 'rest-client'
require 'ruby-jmeter'
require 'net/ssh/gate'
require 'active_record'
require 'sequel'
require 'watir'
require 'colorize'
require 'csv'
require 'byebug'
require 'fileutils'


Setup:
--------------------------
brew install bundler
brew install cask
brew install cask chromedriver
brew install cask geckodriver
brew install mysql
cd [CRIPTONCE FOLDER]
bundle install 
bundle update


FAQ:
----------------------------

* How To Load The test?

- Just download the 'scriptonce_automation' folder
- Save it in your local( e.g documents / desktop)
- Now open RubyMine and load this project( that's a neat ruby IDE, you can chose any other)

* How To Run The test?

- Open a terminal
- Go To the 'scriptonce_automation' Folder Path (e.g cd */sampleWeb/sample_rubymine/sample_cucumber/scriptonce_automation)
- Type "$export CHANNEL=firefox; cucumber -csigxt @create_new_issue" if you're using Windows with Cygwin or gitbash sort of emulator
- Type "CHANNEL=chrome cucumber -csigxt @create_new_issue" if you're using MacOS/Linux

Parameters:
----------------------------
- Some of the common parameters which can be passed on to cucumber command are following:
- TYPE/type = prod/staging (Helps you run the tests against staging/production. By default, tests point to staging sites
- URL/url = site.dev (This allows running the tests against specific staging site. Unless specified, tests normally point to tmsfull.elmodev.com
- CHANNEL = <browser name> (Available browser names are chrome, firefox, headless)

Example:
-----------------------------
~/automation/scriptonce_automation <auto/TDC-57> ✗ CHANNEL=firefox cucumber -csigxt @retrain_discrepancy_fix url=shayan01.dev type=staging
@learning @courses
Feature: As An Admin I Would Like to Manage Courses Which can Further Be Used To Create Recordable And Non Recordable Activities

  @retrain_discrepancy_fix @wip @learning_low_risk
  Scenario: [Learning]Learning Admin Using Retrain Discrepancies Page to Fix Retrain
    Given I Have Logged In as a Learning Admin to shayan01 site
      URL OVERRIDE = https://shayan01.dev.elmodev.com/dashboard
      Title: Shayan01 - Dashboard
      URL: https://shayan01.dev.elmodev.com/dashboard
    And I go to Admin Settings
    And I Go To "Retrain Discrepancies" Under "Learning" Section
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
    And I Go To "Courses" Under "Learning" Section                              # features/step_definitions/business_layer/general_business_steps.rb:119
    When I Edit A Specific Course Named DO NOT DELETE                       # features/step_definitions/business_layer/learning_course_business_steps.rb:56
    Then I Should Be Able To Add A New ELMO Survey (new) Activity           # features/step_definitions/business_layer/learning_course_business_steps.rb:62
      Adding activity: ELMO Survey (new)
      MATCHED: Successfully saved - [ PASSED ]

1 scenario (1 passed)
5 steps (5 passed)
0m44.586s
