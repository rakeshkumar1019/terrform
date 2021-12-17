pipeline {
    agent any
     environment {
      DOCKER_TAG = getDockerTag()
     }

    stages {
        stage('print') {
            steps {
               sh "echo Hello World"
                echo  "'${DOCKER_TAG}'"
            }
        }
    }
}
def getDockerTag(){
     def tag = sh script: 'git branch --show-current', returnStdout: true
     return tag
}
