pipeline {
    agent any

    stages {
        stage('Dockerize simple nodejs app') {
            environment {
                SERVICE_CREDS = credentials('docker_cred')
            }
            steps {
                checkout([$class: 'GitSCM',
                    branches: [[name: '*/main']],
                    userRemoteConfigs: [[url: 'https://github.com/anas1243/jenkins_nodejs_example']]])
                    
                sh "docker stop node-app || true && docker rm node-app || true"
                sh "docker build . -t anas1243/sample-node-app:$BUILD_NUMBER"
                sh "docker login -u $SERVICE_CREDS_USR -p $SERVICE_CREDS_PSW"
                sh "docker push anas1243/sample-node-app:$BUILD_NUMBER"
                sh "docker run -d -it -p 3000:3000 --name node-app anas1243/sample-node-app:$BUILD_NUMBER "
                    
            }
        }
    }
    post {
        success {
            echo "wallah w 3mloha el regala"
        }
    }
}