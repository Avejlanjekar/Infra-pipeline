pipeline {

    agent any

    environment {

        AWS_REGION = 'ap-south-1'

        AWS_CREDENTIALS = 'aws-ecr-credentials'

        TF_VAR_FILE = 'environments/dev/terraform.tfvars'
    }

    stages {

        stage('Terraform Init') {
            steps {

                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: env.AWS_CREDENTIALS]
                ]) {

                    sh '''
                        terraform init
                    '''
                }
            }
        }

        stage('Terraform Validate') {
            steps {

                sh '''
                    terraform validate
                '''
            }
        }

        stage('Terraform Plan - Dev') {
            steps {

                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: env.AWS_CREDENTIALS]
                ]) {

                    sh '''
                        terraform plan \
                            -var-file=${TF_VAR_FILE} \
                            -out=tfplan
                    '''
                }
            }
        }

        stage('Terraform Apply - Dev') {
            steps {

                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: env.AWS_CREDENTIALS]
                ]) {

                    sh '''
                        terraform apply -auto-approve tfplan
                    '''
                }
            }
        }
    }

    post {

        always {
            deleteDir()
        }
    }
}