pipeline {
    agent any
    
    tools {
        maven 'maven3' // This must match the name you gave in Global Tool Configuration
    }

    environment {
        DOCKER_HUB_CREDS = credentials('docker-hub-credentials')
        DOCKER_IMAGE = "percyosag/comp367-lab3:latest"
    }

    stages {
        stage('Check out') { // [cite: 17]
            steps {
                checkout scm
            }
        }

        stage('Build maven project') { // [cite: 18]
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Docker login') { // [cite: 20]
            steps {
                sh "echo \$DOCKER_HUB_CREDS_PSW | docker login -u \$DOCKER_HUB_CREDS_USR --password-stdin"
            }
        }

        stage('Docker build') { // [cite: 21]
            steps {
                sh "docker build -t ${DOCKER_IMAGE} ."
            }
        }

        stage('Docker push') { // 
	steps {
                sh "docker push ${DOCKER_IMAGE}"
            }
        }
    }
}
