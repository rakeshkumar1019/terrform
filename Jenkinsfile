pipeline {
    agent any
     environment {
      DOCKER_TAG = getDockerTag()
     }

    stages {
        stage('print branch name') {
            steps {
                echo 'Hello World-${DOCKER_TAG}'
            }
        }
    }
}
def getDockerTag(){
     def tag = sh script: 'git symbolic-ref --short HEAD', returnStdout: true
     return tag
}
