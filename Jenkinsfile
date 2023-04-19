    pipeline {
        agent any
        stages {
            stage('Git checkout') {
                steps {
                    git branch: 'main',
                    credentialsId: 'orasraf1241',
                    url: 'https://github.com/orasraf1241/ci-cd-flask-app.git'
                }
            }

            stage('Building docker image') {
                steps {
                    sh 'ls'
                    sh 'docker build -t my-flask-app .'
                }
            }

            stage('Run docker image') {
                steps {
                    sh 'docker run --name flask-app -d -p 443:443 my-flask-app'
                }
            }

    
            stage('Check URL') {
                steps {
                    sh 'curl -k https://localhost'
                }
            }
        


            stage ('Stop and delete') {
                steps{
                    sh 'docker stop flask-app'
                    sh 'docker rm flask-app'
                }
            }

            stage('Push image') {
                steps {
                    sh 'docker push orasraf1241/simple-flask-app-leumi:1.0.0'
                }
            }
        }
    }
