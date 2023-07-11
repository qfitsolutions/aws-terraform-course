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
                  sh 'terraform plan -out terraform.plan'
                }
            }
        }
        stage('apply') {
            steps {
                dir('example') {
                  sh 'terraform apply terraform.plan'
                }
            }
        }
    }
}
