pipeline {
    agent any

    tools {
        maven 'maven3' 
        dockerTool 'docker' // This matches the "dockerTool" type required by Jenkins
    }

    environment {
        DOCKER_HUB_CREDS = credentials('docker-hub-credentials')
        DOCKER_IMAGE = "percyosag/comp367-lab3:latest"
    }
    
    stages {
        stage('Check out') {
            steps {
                checkout scm
            }
        }

        stage('Build maven project') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker login') {
            steps {
                // Use single quotes for the shell command to handle the $ properly
                sh 'echo $DOCKER_HUB_CREDS_PSW | docker login -u $DOCKER_HUB_CREDS_USR --password-stdin'
            }
        }

        stage('Docker build') {
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Docker push') {
            steps {
                sh "docker push ${DOCKER_IMAGE}"
            }
        }
    }
}
