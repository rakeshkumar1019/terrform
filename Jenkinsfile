pipeline {
    agent any
     environment {
      DOCKER_TAG = getDockerTag()
      BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
     }

    stages {
        stage('print branch name') {
            steps {
                echo "Hello World-${DOCKER_TAG}"
                echo "bbbb"+ BRANCH_NAME 
                echo 'Pulling...' + env.BRANCH_NAME
            }
        }
    }
}
def getDockerTag(){
     def tag = sh script: 'git branch', returnStdout: true
     return tag
}
