pipeline {
    agent any
    stages {
        stage('Cleaning up'){
            steps{
                sh label:'', script: 'rm * -rf'
                }
        }
        stage('Git Checkout'){
            steps{
                git credentialsId: 'b9837471-4cb3-4e4c-8b85-35bcf380bd2f', url: 'http://gitlab.linoop.us/root/sc-vsphere-template.git'
                }
            }
        stage('Packer-VM Creating'){
            steps{
                sh label:'', script: '/usr/bin/packer build -force cent7.json'
                }
        }
        stage('Terraform-Permission'){
            steps{
                sh '''
                    terraform init
                    terraform apply -auto-approve
                   '''
                }
        }
    }
}
