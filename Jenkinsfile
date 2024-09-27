pipeline {
    agent any
    tools {
        maven 'maven3.9.4'
    }
    environment {
        DEPLOY_ENV = 'staging'
        GIT_REPO_URL = 'https://github.com/LaDebz/maven-web-app.git'
    }
    stages {
        stage('Clone from Github') {
            steps {
                git "${GIT_REPO_URL}"
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Testing') {
            steps {
                sh 'mvn sonar:sonar'
            }
        }
        stage('Nexus') {
            steps {
                sh 'mvn deploy'
            }
        }
        stage('Approval to Deploy - Staging') {
            steps {
                echo 'Seeking approval'
                echo 'Sending notification to team lead'
                script {
                    if (env.DEPLOY_ENV == 'staging') {
                        slackSend (
                            channel: '#jenkinspipeline',
                            message: "Please approve to Deploy Job to stage ${env.JOB_NAME} #${env.BUILD_NUMBER} in ${env.DEPLOY_ENV} \n Requester LaDebz \n Devops Engineer \n CICD Department \n Phone #9051231234"
                        )
                        timeout(time: 5, unit: "DAYS") {
                            input message: 'Approve to Deploy to staging'
                        }
                    }
                }
            }
        }
        stage('Deployment Stage - Staging') {
            when {
                expression { env.DEPLOY_ENV == 'staging' }
            }
            steps {
                echo 'Deploying to staging'
                script {
                    deploy adapters: [tomcat9(credentialsId: 'Tomcat_Cred', path: '', url: 'http://3.143.211.76:8080/')], 
                           contextPath: null, 
                           war: 'target/*war'
                }
            }
        }
        stage('Approval to Deploy - Production') {
            steps {
                echo 'Seeking approval'
                echo 'Sending notification to team lead'
                script {
                    if (env.DEPLOY_ENV != 'staging') {
                        slackSend (
                            channel: '#jenkinspipeline',
                            message: "Please approve to Deploy Job to production ${env.JOB_NAME} #${env.BUILD_NUMBER} in ${env.DEPLOY_ENV} \n Requester LaDebz \n Devops Engineer \n CICD Department \n Phone #9051231234"
                        )
                        timeout(time: 5, unit: "DAYS") {
                            input message: 'Approve to Deploy to production'
                        }
                    }
                }
            }
        }
        stage('Deployment Stage - Production') {
            when {
                expression { env.DEPLOY_ENV != 'staging' }
            }
            steps {
                echo 'Deploying to production'
                script {
                    deploy adapters: [tomcat9(credentialsId: 'Tomcat_Cred', path: '', url: 'http://18.191.112.223:7000/')], 
                           contextPath: null, 
                           war: 'target/*war'
                }
            }
        }
    }
    post {
        always {
            echo "I am done"
        }
        success {
            echo "Deploying to ${env.DEPLOY_ENV} tomcat successful"
        }
        failure {
            echo "Deploying to ${env.DEPLOY_ENV} failed"
        }
    }
}

