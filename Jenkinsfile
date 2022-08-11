pipeline {
    agent any
    environment {
        CI = 'true'
        DOCKERHUB_CREDENTIALS = credentials('mgpearce-dockerhub')
    }
    stages {
        stage('create-images') {
              steps {
                  echo 'Create images...'
                  sh 'docker build -t react-image -f ./react/blogapi/Dockerfile.prod'
                  sh 'docker images'
              }
        }
        stage('Build') {
//             agent {
//                 docker {
//                     image 'node:lts-buster-slim'
//                     args '-p 3000:3000'
//                     reuseNode true
//                 }
//             }
            steps {
                echo 'Build stage...'

//                 sh 'npm install --prefix /var/jenkins_home/workspace/django-react-nginx/react/blogapi react/blogapi/'

//                 sh 'chmod +x ./react/blogapi/build.sh'
//                 sh './react/blogapi/build.sh'

//                 input message: 'Finished reviewing the build stage? (Click "Proceed" to continue)'

//                 sh 'chmod +x ./react/blogapi/kill.sh'
//                 sh './react/blogapi/kill.sh'
            }
        }
        stage('Deploy') {
//             agent {
//                 docker {
//                     image 'nginx:stable-alpine'
//                     args '-p 80:80'
//                     reuseNode true
//                 }
//             }
            steps {
                echo 'Deploy stage (with nginx)...'
//                 input message: 'Finished reviewing the deploy stage? (Click "Proceed" to continue)'
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
//                 input message: 'Finished reviewing teh dockerhub stage? (Click "Proceed" to continue)'
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
