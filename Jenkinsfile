pipeline {
    agent any
    parameters {
        choice(
            choices: ['apply' , 'destroy','import','plan'],
            description: 'select',
            name: 'REQUESTED_ACTION')
    }
    stages {
        stage('init') {
            steps {
                dir('importdemo') {
                  sh 'terraform init'
                }
            }
        }
        stage('import') {
            when {
                expression { params.REQUESTED_ACTION == 'import' }
            }
            steps {
                dir('importdemo') {
                  withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awscred", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY' ]]){
                    sh 'terraform import aws_instance.app_server i-02d70938318384a50'
                  }
                }
            }
        }
        stage('plan') {
            when {
                expression { params.REQUESTED_ACTION == 'plan' }
            }
            steps {
                dir('importdemo') {
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
                dir('importdemo') {
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
                dir('importdemo') {
                  withCredentials([[ $class: 'AmazonWebServicesCredentialsBinding', credentialsId: "awscred", accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY' ]]){
                    sh 'terraform apply -destroy -auto-approve'
                  }
                }
            }
        }
    }
}
