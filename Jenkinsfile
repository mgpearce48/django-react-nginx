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
                  cleanWs()
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
                sh 'docker tag nginx mgpearce/nginx_frontend:latest'
                sh 'docker tag django-react-nginx_backend mgpearce/django-react-nginx_backend:latest'
                sh 'docker push mgpearce/nginx_frontend:latest'
                sh 'docker push mgpearce/django-react-nginx_backend:latest'
            }
        }
    }
    post {
        always {
            sh 'docker logout'
        }
    }
}
