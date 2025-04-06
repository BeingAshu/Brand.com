pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm  // Checkout your code
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image locally
                    sh 'docker build -t my-app:latest .'
                }
            }
        }

        stage('Simulate Push') {
            steps {
                script {
                    // Simulate the Docker push by just printing "pushed"
                    echo "Docker image tagged as my-app:latest"
                    echo "Simulating pushing Docker image... pushed!"
                }
            }
        }
    }
}
