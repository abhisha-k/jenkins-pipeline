pipeline {
    agent any

    environment {
        AWS_DEFAULT_REGION = 'ap-south-2'
    }

    stages {

        stage('Clone Repository') {
            steps {
                git branch: 'main',
                url: 'https://github.com/abhisha-k/jenkins-pipeline.git'
            }
        }

        stage('Terraform Init') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Terraform Apply') {
            steps {
                withAWS(credentials: 'aws-jenkins-creds',
                         region: 'ap-south-2') {

                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
