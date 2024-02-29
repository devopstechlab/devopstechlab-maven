pipeline {
    agent any
    tools{
        jdk 'java17'
        maven 'maven3.9'
    }
    stages {
        stage('Git-Code-Download') {
            steps {
                git branch: 'main', url: 'https://github.com/barochiyavikas/devopstechlab-maven.git'
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
        stage('Tr-Deploy-to-prod') {
            steps {
                timeout(time: 60, unit: 'SECONDS') {
                    input 'Do you want to deploy in prod?'
            }
            {
                build 'deploy-to-prod'
            }
        }                
    }
}
