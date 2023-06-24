pipeline {
    agent any 
    stages {
        stage('checking') {
            steps {
                sh 'mvn --version'
            }
        }
        stage('cloning') {
            steps {
                git 'https://github.com/jenkins-docs/simple-java-maven-app.git'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }

    }
}
