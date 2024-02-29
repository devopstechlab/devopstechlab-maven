pipeline {
    agent any
    tools {
        maven 'maven3.9'
        jdk 'java17'
    }
    stages {
        stage('Git-Download') {
            steps {
                git branch: 'main', url: 'https://github.com/devopstechlab/devopstechlab-maven.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                junit stdioRetention: '', testResults: '**/target/surefire-reports/*.xml'
            }
        }
        stage('Archive-Artifact') {
            steps {
                archiveArtifacts artifacts: '**/*.war', followSymlinks: false
            }
        }
        stage('deploy-to-prod') {
            steps {
                timeout(time: 60, unit: 'SECONDS') {
                    input 'Do you want to deploy in prod?'
                }
                build 'deploy-to-prod'
            }
        }
    }
}
