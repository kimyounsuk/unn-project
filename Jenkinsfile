pipeline {
    agent any

    environment {
        REGISTRY = "ec2-13-124-3-169.ap-northeast-2.compute.amazonaws.com"
        PROJECT  = "unnproject"
        IMAGE    = "web01"
        TAG      = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Image') {
            steps {
                script {
                    app = docker.build("${REGISTRY}/${PROJECT}/${IMAGE}")
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry("https://${REGISTRY}", "harbor-reg") {
                        app.push(TAG)
                        app.push("latest")
                    }
                }
            }
        }
    }
}

