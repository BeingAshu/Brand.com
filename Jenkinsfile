pipeline {
    agent any

    parameters{
        string(name: "DOCKER_TAG", defaultValue: 'latest' , description: "Setting Docker Image for Latest Push" )
    }

    environment{
        NAMESPACE = "my-app"
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

       // stage('Push') {
       //     steps {
        //        script {
        //           withCredentials(
//[usernamePassword(
//    credentialsId:"dockerhub", 
  //  passwordVariable:"dockerHubPass", 
   // usernameVariable:"Dockerhubuser"
   // )
//]
  //                               )
    //                {
      //              sh "docker image tag my-app:${params.DOCKER_TAG} ${env.Dockerhubuser}/my-app:${params.DOCKER_TAG}"
        //            sh "docker login -u ${env.Dockerhubuser} -p ${env.dockerHubPass}"
          //          sh "docker push  ${env.Dockerhubuser}/my-app:${params.DOCKER_TAG}"

            //        }



                    
          //      }   
            //}
        //}

        stage('Update Deployment YAML'){
            sh """
                sed -i "s|image: my-app:.*|image: ${env.Dockerhubuser}/my-app:${params.DOCKER_TAG}|" Kubernetes/deployment.yaml
            """
            
        }
        //stage("Deploy to Kubernetes"){
          //  sh "kubectl apply -f Kubernetes/deployment.yaml -n ${NAMESPACE}"
            //sh "kubectl apply -f Kubernetes/service.yaml -n ${NAMESPACE}"
        //}
        
        //stage("monitor Deployment"){
          //  sh "kubectl rollout status deployment/my-app -n ${NAMESPACE}"

        //}    

        
    }
}
