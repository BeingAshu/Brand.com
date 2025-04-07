pipeline {
    agent any

    parameters{
        string(name: "DOCKER_TAG", defaultValue: '' , description: "Setting Docker Image for Latest Push" )
    }

    stages {

        stage('Validate Parameters'){
            steps{
                script{
                    if (params.DOCKER_TAG == '') {
                        error("DOCKER TAG must be provided")
                    }
                }
            }
        }
                
        
        stage('Checkout Code') {
            steps {
                checkout scm  // Checkout your code
            }
        }
        

        stage('Build Docker Image') {
            steps {
                script {
                    // Build the Docker image locally
                    sh "docker build -t my-app:${params.DOCKER_TAG} ."
                }
            }
        }
        

        stage('Create Docker Container') {
            steps {
                script {
                    // Run the Docker container and expose port 5000
                    def containerId = sh(script: "docker run -d -p 5000:5000 my-app:${params.DOCKER_TAG}", returnStdout: true).trim()

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
