pipeline {
    agent any
    stages {
        stage('Git-Download') {
            steps {
                git branch: 'main', url: 'https://github.com/devopstechlab/devopstechlab-maven.git'
            }
        }
        stage('Build') {
            steps {
                sh '''
                docker build -t mywebapp:${BUILD_NUMBER} .
                docker tag mywebapp:${BUILD_NUMBER} devopstechlab/mywebapp:${BUILD_NUMBER}
                docker tag devopstechlab/mywebapp:${BUILD_NUMBER} devopstechlab/mywebapp:latest
                docker push devopstechlab/mywebapp:${BUILD_NUMBER}
                docker push devopstechlab/mywebapp:latest
                '''
            }
        }
    }
}
