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

        stage('Create Docker Container') {
            steps {
                script {
                    // Create a Docker container from the image
                    def containerId = sh(script: 'docker run -d my-app:latest', returnStdout: true).trim()

                    // Print the container ID
                    echo "Docker container created with ID: ${containerId}"
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
