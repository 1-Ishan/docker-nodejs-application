pipeline {
    agent any
    
    environment {
        REPO_URL = 'https://github.com/1-Ishan/docker-nodejs-application.git'
        IMAGE_NAME = 'docker-nodejs-application-image'
        CONTAINER_NAME = 'docker-nodejs-application-container'
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${REPO_URL}"
            }
        }
        
        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}", ".")
                }
            }
        }

        stage('Deploy to Nginx') {
            steps {
                script {
                    sh "docker ps -q --filter 'name=${CONTAINER_NAME}' | grep -q . && docker stop ${CONTAINER_NAME} && docker rm ${CONTAINER_NAME} || true"
                    sh "docker run -d --name ${CONTAINER_NAME} -p 80:80 ${IMAGE_NAME}"
                }
            }
        }
    }
}
