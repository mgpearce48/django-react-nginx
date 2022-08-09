pipeline {
    agent any
    environment {
        CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('mgpearce-dockerhub')
    }
    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:lts-buster-slim'
                    args '-p 3000:3000'
                    reuseNode true
                }
            }
            steps {
                echo 'Build stage...'
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'nginx:stable-alpine'
                    reuseNode true
                }
            }
            steps {
                echo 'Deploy stage (with nginx)...'
            }
        }
        stage('Login-Dockerhub') {
            steps {
                echo 'Login stage...'
                // sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('Push-Dockerhub') {
            steps {
                echo 'Push stage...'
                // sh 'docker push mgpearce/testreact:latest'
            }
        }
    }
    post {
        always {
            echo 'Post stage (always)...'
            // sh 'docker logout'
        }
    }
}
