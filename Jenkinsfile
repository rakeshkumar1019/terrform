pipeline {
    agent any
     environment {
      DOCKER_TAG = getDockerTag()
      BRANCH_NAME = "${GIT_BRANCH.split("/")[0]}"
     }

    stages {
        stage('print branch name') {
            steps {
                echo BRANCH_NAME 
            }
        }
    }
}
def getDockerTag(){
     def tag = sh script: 'git branch', returnStdout: true
     return tag
}
