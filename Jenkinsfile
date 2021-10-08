pipeline {
    agent any

    def kubernetes_dev_cluster_host
    def kubernetes_prod_cluster_host
    def IMAGE_VERSION
    environment {
        dockerhub_repository = 'jenkins-test-cicd'
        dockerhub_organization = 'miquelpuigmena'
        dockerhub_username = 'miquelpuigmena'
        dockerhub_password = ''
    }
    stages {
        stage('deploy-kubernetes') {
            steps {
                sh """
                    echo 'Deploy kubernetes'
                    cd ./kubernetes/terraform
                    terraform init .
                    terraform plan .
                    terraform apply --auto-approve
                    echo 'OK - Deployed kubernetes'
                """
                kubernetes_dev_cluster_host = sh(returnStdout: true, script: "terraform output kubernetes_dev_cluster_host").trim()
                kubernetes_prod_cluster_host = sh(returnStdout: true, script: "terraform output kubernetes_prod_cluster_host").trim()
            }
        }
        stage('version-jenkins') {
            steps {
                IMAGE_VERSION = ${BUILD_ID}-${GIT_COMMIT}
                sh """
                    echo 'Version Jenkins to ${IMAGE_VERSION}'
                    cd ./jenkins/packer
                    packer init .
                    packer build \
                     -var 'dockerhub_username=${dockerhub_username}'\
                     -var 'dockerhub_password=${dockerhub_password}'\
                     -var 'dockerhub_organization=${dockerhub_organization}'\
                     -var 'dockerhub_repository=${dockerhub_repository}'\
                     -var 'version=${IMAGE_VERSION}' .
                    echo 'OK - Versioned Jenkins to ${IMAGE_VERSION}'
                """
            }
        }
        stage('deploy-jenkins') {
            steps {
                sh """
                    echo 'Deploy Jenkins'
                    cd ./jenkins/terraform
                    terraform init .
                    terraform plan .
                    terraform apply . --auto-approve
                    echo 'OK - Deployed Jenkins'
                """
            }
        }
    }
}