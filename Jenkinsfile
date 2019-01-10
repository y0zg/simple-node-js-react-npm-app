pipeline {
    agent {
      //  triggers { pollSCM('H/5 * * * *') }
        docker {
            image 'node:6-alpine'
            args '-p 3003:3000'
        }
    }
    environment { 
        CI = 'true'
    }
    stages {
        stage('Checkout2') {
            steps {
                git(
                url: 'https://github.com/y0zg/jenkinspipeline.git',
                credentialsId: 'b3c2551f-c80d-4afe-9b11-bf7d73bc2180',
                branch: "master"
                )
            }
        } 
        stage('Checkout1') {
            steps {
                git(
                url: 'https://github.com/y0zg/simple-node-js-react-npm-app.git',
                credentialsId: 'b3c2551f-c80d-4afe-9b11-bf7d73bc2180',
                branch: "master"
                )
            }
        } 
        stage('Build') {
            steps {
                sh 'npm install'
            }
        }
        stage('Test') {
            steps {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') { 
            steps {
                sh './jenkins/scripts/deliver.sh' 
                input message: 'Finished using the web site? (Click "Proceed" to continue)' 
                sh './jenkins/scripts/kill.sh' 
            }
        }
    }
}
