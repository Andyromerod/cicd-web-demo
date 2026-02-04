pipeline {
    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Test') {
            steps {
                sh 'chmod +x scripts/test.sh'
                sh 'scripts/test.sh'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t cicd-web-demo:staging .'
            }
        }

        stage('Deploy to Staging') {
            steps {
                sh 'docker-compose up -d web-staging'
            }
        }

        stage('Approval for Production') {
            steps {
                input message: '¿Aprobar despliegue a Producción?'
            }
        }

        stage('Build Production Image') {
            steps {
                sh 'docker tag cicd-web-demo:staging cicd-web-demo:production'
            }
        }

        stage('Deploy to Production') {
            steps {
                sh 'docker-compose up -d web-production'
            }
        }
    }
}
