pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    parameters {
        choice(
            name: 'Environment',
            choices: ['dev', 'qa', 'uat', 'prod'],
            description: 'Select the Terraform environment'
        )
    }

    environment {
        AWS_REGION = 'ap-south-1'
        AWS_CREDENTIALS = 'aws-ecr-credentials'
    }

    stages {

        stage('Select Environment') {
            steps {
                script {
                    def CONFIG = [
                        dev: [
                            BACKEND: 'backend/backend-dev.tf',
                            VAR_FILE: 'environments/dev/terraform.tfvars'
                        ],
                        qa: [
                            BACKEND: 'backend/backend-qa.tf',
                            VAR_FILE: 'environments/qa/terraform.tfvars'
                        ],
                        uat: [
                            BACKEND: 'backend/backend-uat.tf',
                            VAR_FILE: 'environments/uat/terraform.tfvars'
                        ],
                        prod: [
                            BACKEND: 'backend/backend-prod.tf',
                            VAR_FILE: 'environments/prod/terraform.tfvars'
                        ]
                    ]

                    env.TF_BACKEND_FILE =
                        CONFIG[params.Environment].BACKEND

                    env.TF_VAR_FILE =
                        CONFIG[params.Environment].VAR_FILE

                    echo "Environment: ${params.Environment}"
                    echo "Backend: ${env.TF_BACKEND_FILE}"
                    echo "Variables: ${env.TF_VAR_FILE}"
                }
            }
        }

        stage('Terraform Init') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: "${AWS_CREDENTIALS}"]
                ]) {
                    sh '''
                        terraform init \
                          -input=false \
                          -reconfigure \
                          -backend-config="$TF_BACKEND_FILE"
                    '''
                }
            }
        }

        stage('Terraform Format Check') {
            steps {
                sh 'terraform fmt -check -recursive'
            }
        }

        stage('Terraform Validate') {
            steps {
                sh 'terraform validate'
            }
        }

        stage('Terraform Plan') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: "${AWS_CREDENTIALS}"]
                ]) {
                    sh '''
                        terraform plan \
                          -input=false \
                          -var-file="$TF_VAR_FILE" \
                          -out=tfplan

                        terraform show -no-color tfplan
                    '''
                }
            }
        }

        stage('Manual Approval') {
            steps {
                script {
                    def APPROVER = input(
                        message: "Review the Terraform Plan console output. Approve changes to ${params.Environment}?",
                        ok: 'Approve and Apply',
                        submitterParameter: 'APPROVER'
                    )

                    echo "Approved by: ${APPROVER}"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                withCredentials([
                    [$class: 'AmazonWebServicesCredentialsBinding',
                     credentialsId: "${AWS_CREDENTIALS}"]
                ]) {
                    sh '''
                        terraform apply \
                          -input=false \
                          -auto-approve \
                          tfplan
                    '''
                }
            }
        }
    }

    post {
        success {
            echo "Terraform pipeline completed for ${params.Environment}."
        }

        failure {
            echo "Terraform pipeline failed for ${params.Environment}. Review the console output."
        }

        aborted {
            echo "Terraform pipeline was aborted."
        }

        always {
            deleteDir()
        }
    }
}