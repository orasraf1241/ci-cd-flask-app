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

        stage('Test') {
            steps {
                httpRequest method: 'GET', url: 'https://localhost', validResponseCodes: '200'
            }
        }

        stage ('Stop and delete') {
            steps{
                sh 'docker stop my-flask-app'
                sh 'docker rm my-flask-app'
            }
        }

        stage('Push image') {
            steps {
                sh 'docker push orasraf1241/my-flask-app:1.0.0'
            }
        }
    }
}
