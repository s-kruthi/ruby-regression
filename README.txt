I have automated the scenario using Cucucmber and selenium WD 2.0 and The feature is written in BDD language for easy readability 
in quest of automating a single scenario i have actually created a brand new framework which is based on Page-Object pattern but due to time constraint 
i could only test it fully on Firefox and Safari , but if you have environments setted up for Android device, ios device and chrome,
then it should probably work on those as well(feel free to give it a try)

But for Demo purpose lets just test it on Firefox Browser
System specification -Mac OS/ Windows (prefarably MAC)
 
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
*Go To the 'features' Folder Path (e.g cd /Users/shankumahanty/Documents/sampleWeb/sample_rubymine/sample_cucumber/Jira_Project)
*type ls ( e.g Shankus-MacBook:Jira_Project shankumahanty$ ls
            features)
The Path should have 'features' folder listed in it  

*then type this command $export CHANNEL=firefox; cucumber --tags @create_new_issue   (e.g Shankus-MacBook:Jira_Project shankumahanty$ export CHANNEL=firefox; cucumber --tags @create_new_issue)
hit enter

if system requirements are met properly, you should observe the below behaviour
1. An instance of firefox browser will open
2. It will go to 'https://id.atlassian.com/login?continue=https%3A%2F%2Fjira.atlassian.com%2Fsecure%2FDashboard.jspa&application=jac'
3. Login using my JIRA test credential catchycool4@gmail.com , tester1
4. Execute The desired steps mentioned in BDD feature
5. logout and close the browser

“consecutive card numbers will be generated for every consecutive test execution” , which verifies that new issues can be created 

PLEASE CHECK THE ATTACHED SCREENSHOT

########################################## MITIGATION PLAN ################################################

I Am attaching a RAW code as well which is much easy to execute

Download "sel.rb' file
Open terminal
type ruby <drag and drop sel.rb file> hit enter ( e.g Shankus-MacBook:Jira_Project shankumahanty$ ruby <drag and drop sel.rb file> ) enter
That should execute the same behaviour as above .

