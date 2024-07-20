pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                script {
                    sh 'python hello_world.py'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'pytest test_hello_world.py'
                }
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    sh 'docker build -t hello-world-image .'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    sh 'docker run -d --name hello-world-container hello-world-image'
                }
            }
        }
    }
    post {
        always {
            emailext (
                to: 'you@example.com',
                subject: "Jenkins Job '${env.JOB_NAME}' (${env.BUILD_NUMBER})",
                body: """<p>Build Status: ${currentBuild.currentResult}</p>
                         <p>Job: ${env.JOB_NAME}</p>
                         <p>Build Number: ${env.BUILD_NUMBER}</p>
                         <p>Build URL: ${env.BUILD_URL}</p>""",
                mimeType: 'text/html'
            )
        }
    }
}

