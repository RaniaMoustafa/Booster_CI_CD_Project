pipeline {
  agent {label 'slave'}

    stages {
        stage('Build') {
            steps {
                sh 'docker build -f dockerfile . -t raniamoustafa/jenkins_django:v1.0'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId:"docker",usernameVariable:"USERNAME",passwordVariable:"PASSWORD")]){
                sh 'docker login --username $USERNAME --password $PASSWORD'
                sh 'docker push raniamoustafa/jenkins_django:v1.0'
            }
            }
        }
      stage('Deploy') {
            steps {
                sh 'docker run -d -p 8010:8000 raniamoustafa/jenkins_django:v1.0'
            }
        }  
    }
  post{
    success{
      slackSend (color: '#00FF00', message: "SUCCESSFUL: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)") 
    }
    failure{
      slackSend (color: '#E83009', message: "Failure: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)") 
    }
    aborted{
      slackSend (color: '#E8E209', message: "ABORTED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]' (${env.BUILD_URL}console)") 
    }
  }
}
