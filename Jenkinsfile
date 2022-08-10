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
                sh 'cd react/blogapi'
                sh 'npm install'
                sh 'npm run build'
                sh 'npm start &'
                sh 'sleep 1'
                sh 'echo $! > .pidfile'
                input message: 'Finished reviewing the build stage? (Click "Proceed" to continue)'
                sh 'kill $(cat .pidfile)'
            }
        }
        stage('Deploy') {
            agent {
                docker {
                    image 'nginx:stable-alpine'
                    args '-p 80:80'
                    reuseNode true
                }
            }
            steps {
                echo 'Deploy stage (with nginx)...'
                input message: 'Finished reviewing the deploy stage? (Click "Proceed" to continue)'
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
                input message: 'Finished reviewing teh dockerhub stage? (Click "Proceed" to continue)'
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
