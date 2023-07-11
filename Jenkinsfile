pipeline {
    agent any
    parameters {
        choice(
            choices: ['apply' , 'destroy'],
            description: 'select',
            name: 'REQUESTED_ACTION')
    }
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
            when {
                expression { params.REQUESTED_ACTION == 'apply' }
            }
            steps {
                dir('example') {
                  withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awscred", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY' ]]){
                    sh 'terraform apply terraform.plan'
                  }
                }
            }
        }
        stage('destroy') {
            when {
                expression { params.REQUESTED_ACTION == 'destroy' }
            }
            steps {
                dir('example') {
                  withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awscred", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY' ]]){
                    sh 'terraform apply -destroy'
                  }
                }
            }
        }
    }
}
