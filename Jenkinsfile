pipeline {
    agent any
     environment {
      DOCKER_TAG = getDockerTag()
     }

    stages {
        stage('print') {
            steps {
               sh "echo Hello World"
                 sh "${DOCKER_TAG}"
            }
        }
    }
}
def getDockerTag(){
     def tag = sh script: 'git branch --contains HEAD', returnStdout: true
     return tag
}
