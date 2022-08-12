pipeline {
    agent any
    environment {
        CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('mgpearce-dockerhub')
    }
    stages {
        stage('Build & Test') {
              steps {
                  echo 'Create images...'
                  sh 'docker-compose up -d'
                  input message: 'Finished reviewing the react app? (Click "Proceed" to continue)'
                  sh 'docker-compose down'
              }
        }
        stage('Login Dockerhub') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push Dockerhub') {
            steps {
                echo 'Push Dockerhub...'
                // sh 'docker push mgpearce/testreact:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
