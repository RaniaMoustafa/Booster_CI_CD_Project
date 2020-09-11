pipeline {
  agent any

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
                sh 'docker run -d -p 172.0.0.1:8000:0.0.0.0:8000 raniamoustafa/jenkins_django:v1.0'
            }
        }  
    }
}
