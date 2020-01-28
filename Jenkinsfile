pipeline {
  agent any

  tools {nodejs "node"}


  stages {

    stage('Git- Get the project') { // for display purposes
        steps {
          // Get some code from a GitHub repository
          git 'https://github.com/ghabarid/postman-jenkins.git'
        }
   }


    stage('Install newman') {
      tools {maven "maven"}
      steps {
        sh 'mvn -version'
        sh 'echo WE ARE STARTING THE TEST ...'
        sh 'npm install -g newman'
        withMaven(maven: 'maven'){
            sh 'mvn -version'

        }
      }
    }

    stage('Run test') {
      steps {
        sh 'newman -v'
        sh 'newman run CI-CD.postman_collection.json'
      }
    }
  }
}