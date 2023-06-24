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
                withCredentials([usernamePassword(credentialsId: 'dockerpass', passwordVariable: 'PASS', usernameVariable: 'USR')]) {
                     sh "docker build -t ${APPLICATION}:${BUILD_NUMBER} ${WORKSPACE}/. "
                     sh "docker tag ${APPLICATION}:${BUILD_NUMBER} ${USR}/${APPLICATION}:${VERSION}" 
                     sh "docker login -u ${USR} -p ${PASS}" 
                     sh "docker push ${USR}/${APPLICATION}:${VERSION}"
                 } 
            }
        }

    }
}
