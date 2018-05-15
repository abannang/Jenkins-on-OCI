pipeline {
    agent { label 'jenkinslave' }
    stages {
        stage('Fetch dependencies') {
        /* This stage pulls the latest node image from
           Dockerhub */
            steps {
                sh 'sudo docker pull node:latest'
          }
        }
        stage('Build docker image') {
        /* This stage builds the actual image; synonymous to
           docker build on the command line */
            steps {
            sh "sudo docker build . -t customnode:1"
            }    
        }
        stage('Test image') {
         /* This stage runs unit tests on the image; we are
            just running dummy test here */
            steps {
                sh 'echo "Tests successful"'
          }
        }
        stage('Push image to OCIR') {
         /* Final stage of build; Push the 
            docker image to our private Registry*/
        steps {
            sh "sudo docker login -u 'REGISTRY USERNAME' -p 'REGISTRY PASSWORD' iad.ocir.io"
            sh "sudo docker tag node:latest iad.ocir.io/OCI_TENANCY/node:latest"
            sh 'sudo docker push iad.ocir.io/OCI_TENANCY/node:latest'
            
           }
         }      
    }
}
