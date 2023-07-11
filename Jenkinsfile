pipeline {
    agent any

    stages {
        stage('init') {
            steps {
                dir('example') {
                  sh 'terraform init'
                }
            }
        }
        stage('plan') {
            steps {
                dir('example') {
                  withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awscred", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY' ]]){
                    sh 'terraform plan -out terraform.plan'
                  }
                }
            }
        }
        stage('apply') {
            steps {
                dir('example') {
                  withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awscred", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY' ]]){
                    sh 'terraform apply terraform.plan'
                  }
                }
            }
        }
    }
}
