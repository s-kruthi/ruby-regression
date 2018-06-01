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
            echo 'Test passed'
            sh 'cd /var/lib/scriptonce_automation; pwd; git checkout .; git remote -v; git pull origin master'
          }
        }
        stage('test') {
          steps {
            echo 'test execution in progress..'
            sh 'cucumber -xgt @C807 CHANNEL=headless'
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