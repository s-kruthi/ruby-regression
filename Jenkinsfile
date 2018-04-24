pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building/Checking..'
	sh "scriptonce; pwd; git remote -v; git stash; git fetch; git checkout master; git pull origin master"
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            echo '-----------Running cucumber tests-------------- \n'
	    	sh "scriptonce; pwd; CHANNEL=headless cucumber -csigxt '@smoke or @course_add' url=tmsfull"
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
