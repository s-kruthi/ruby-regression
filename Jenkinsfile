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
            sh 'pwd'
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