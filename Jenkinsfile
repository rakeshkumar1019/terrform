pipeline {
    agent any
     environment {
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
