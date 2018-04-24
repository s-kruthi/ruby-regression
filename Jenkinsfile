pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
	sh 'cd ~/automation/scriptonce_automation; git stash; pwd; git remote -v; git fetch; git checkout master; git pull origin master; git status'
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            echo '-----------Running cucumber tests-------------- \n'
	    sh ' cd ~/automation/scriptonce_automation; pwd; cucumber -csigxt @course_add url=tmsfull; cucumber -csigxt -csigxt @course_activity_add url=tmsfull'
            
	    echo 'Test passed\n'
	    sh ' cd ~/automation/scriptonce_automation; pwd; git checkout .; git remote -v; git pull origin master'
          }
        }
        stage('success') {
          steps {
            echo 'Test passed'
          }
        }
      }
    }
    stage('Deploy') {
      steps {
        echo 'Deploying....'
      }
    }
  }
}
