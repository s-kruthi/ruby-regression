pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
      }
    }
    stage('Code check in') {
      parallel {
        stage('check in code') {
          steps {
sh 'echo -e "--------------"'
sh 'echo -e "Current User: " $USER'
sh 'echo -e "Current directory: " $PWD'
sh 'echo -e "Ruby Version: " $(ruby -v)'
sh 'echo -e "BROWSER: " ${browser}'
sh 'echo -e "TAG: " ${tags}'
sh 'echo -e "BRANCH: " ${branch}'
sh 'echo -e "WORKSPACE: " $WORKSPACE'
sh 'echo -e "--------------"'
sh 'echo -e "Gem list:\n"'
sh 'echo -e "-------------\n"'

sh 'cd /var/lib/branched_scriptonce/scriptonce_automation/features/lib'
sh 'git clean -f -d'
sh 'git checkout .'
sh 'git fetch'
sh 'git checkout master'
sh 'git reset --hard HEAD'
sh 'git pull origin master'

sh 'echo -e "--------------"'
sh 'echo -e "Current User: " $USER'
sh 'echo -e "Current directory: " $PWD'
sh 'echo -e "Ruby Version: " $(ruby -v)'
sh 'echo -e "BROWSER: " ${browser}'
sh 'echo -e "TAG: " ${tags}'
sh 'echo -e "BRANCH: " ${branch}'
sh 'echo -e "WORKSPACE: " $WORKSPACE'
sh 'echo -e "--------------"'
sh 'echo -e "Gem list:\n"'
sh 'echo -e "-------------\n"'


sh 'cd /var/lib/branched_scriptonce/scriptonce_automation'
sh 'git clean -f -d'
sh 'git checkout .'
sh 'git fetch'
sh 'git checkout master'
sh 'git reset --hard HEAD'
sh 'git pull origin master'
sh 'git checkout ${branch} 2>&1 | tee -a $WORKSPACE/output.txt'
sh 'git pull origin ${branch} 2>&1 | tee -a $WORKSPACE/output.txt'         
 }
        }
        stage('Test Execution') {
          steps {
            echo 'test execution in progress..'
            sh 'source ~/.bash_profile 
	    sh 'cucumber -xgt @smoke_learning1 CHANNEL=headless'
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        echo 'Not implemented....'
      }
    }
  }
}
