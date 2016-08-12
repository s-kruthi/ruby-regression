
Ruby gems required -
require 'selenium-webdriver'
require 'rspec-expectations'
require "selenium/client"
require “cucumber”
adding “Gemfile.lock” for all other gem dependencies which you can easily- bundle update

How To Load The test?
Just download the 'features' folder
Save it in your local( e.g documents / desktop)
Now open RubyMine and load this project by giving path to your 'features' folder( that's a neat ruby IDE, you can chose any other)

How To Run The test?
*just open a terminal 
*Go To the 'features' Folder Path (e.g cd */sampleWeb/sample_rubymine/sample_cucumber/Jira_Project)

The Path should have 'features' folder listed in it  

*then type this command $export CHANNEL=firefox; cucumber --tags @create_new_issue   