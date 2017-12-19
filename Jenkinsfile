pipeline {
  agent any
  stages {
    stage('Build') {
      steps {
        echo 'Building..'
      }
    }
    stage('Test') {
      parallel {
        stage('Test') {
          steps {
            echo 'Test passed'
            sh ' cd /var/lib/scriptonce_automation; pwd; git checkout .; git remote -v; git pull https://shanku_elmo:Mirror%401020@bitbucket.org/shanku_elmo/scriptonce_automation.git; '
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