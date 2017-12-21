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
            sh ' cd /var/lib/scriptonce_automation; pwd; git checkout .;git remote set-url origin git@bitbucket.org:shanku_elmo/scriptonce_automation.git; git remote -v; '
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