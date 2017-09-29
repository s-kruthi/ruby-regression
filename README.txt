- Ruby gems required:

require 'rubygems'
require 'pp'
require 'jira-ruby'

require 'rubygems'
require 'active_record'
require 'touch_action/selenium-webdriver'
require 'securerandom'
require 'waitutil'
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

An example is provided below:

omar@OMAR-ELMO: ~/automation/scriptonce_automation$CHANNEL=chrome cucumber -x -g -t @add_employee_contract
CHANNEL = chrome
@employee_contracts
Feature:
  I want to Test if I can Successfully Manage Contract Library

  @add_employee_contract
  Scenario: Create a New Contract                  # features/tests/employee_contracts.feature:7
    Given I Have Logged In as a Company Admin      # features/step_definitions/business_layer/documents_forms_business_steps.rb:1
      ELMO Talent Management System - Dashboard
    And I Go To The General Contract Library Section       # features/step_definitions/business_layer/employee_contracts_business_steps.rb:2
    When I click on New Contract Button            # features/step_definitions/business_layer/employee_contracts_business_steps.rb:7
    And I Enter New Employee Contract Details      # features/step_definitions/business_layer/employee_contracts_business_steps.rb:11
    Then I Should Be Able To Create A New Contract # features/step_definitions/business_layer/employee_contracts_business_steps.rb:23
      MATCHED: Contract is saved successfully

1 scenario (1 passed)
5 steps (5 passed)
1m34.684s