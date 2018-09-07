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
            sh 'cd /var/lib/scriptonce_automation; pwd; git checkout .;git clean -f -d; git remote -v;git checkout master; git pull origin master ; rm -r features/lib ;mkdir features/lib; chmod -R 755 features/lib; cd features/lib && git clone git@bitbucket.org:elmodevelopment/scriptonce_lib.git .'
          }
        }
        stage('Test Execution') {
          steps {
            echo 'test execution in progress..'
            sh '''source ~/.bash_profile

cucumber -xgt @smoke_learning1 CHANNEL=headless'''
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