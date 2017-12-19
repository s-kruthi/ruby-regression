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
            sh '#!/bin/bash -l ; cd /var/lib/scriptonce_automation; pwd;'
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