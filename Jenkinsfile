pipeline {
    agent any

    stages {
        stage('Hello') {
            steps {
                dir('example') {
                  sh 'terraform init'
                }
            }
        }
    }
}
