pipeline {
    agent any 
    environment {
        APPLICATION = "myapp"
        VERSION = "v1"
        USER =  "thamizhnithiya"
    }
    stages {
        stage('checking') {
            steps {
                sh 'mvn --version'
            }
        }
        stage('cloning') {
            steps {
                git 'https://github.com/vrthamizharasan/simple-java-maven-app.git'
            }
        }
        stage('build') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('docker') {
            steps {
                withCredentials([string(credentialsId: 'dockerpass', variable: 'DP')]) {
                     sh "docker build -t ${APPLICATION}:${BUILDNUMBER} . "
                     sh "docker tag ${APPLICATION}:${BUILDNUMBER} ${USER}/${APPLICATION}:${VERSION}" 
                     sh "docker login -u ${USER} - p ${DP}" 
                     sh "docker push ${USER}/${APPLICATION}:${VERSION}"
                 } 
            }
        }

    }
}
